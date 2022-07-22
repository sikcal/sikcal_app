import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/data/providers.dart';
import 'package:sikcal/data/shared_preferences.dart';
import 'package:sikcal/model/register_info_user.dart';
import 'package:http/http.dart' as http;

class AuthRepo {
  AuthRepo(this.ref, this.host);

  final Ref ref;
  final String host;

  Future<void> signUp(RegisterInfoUser registerInfoUser) async {
    final url = Uri.http(host, '/api/join');
    final req = http.Request("POST", url);

    req.headers['Content-Type'] = 'application/json';
    req.body = jsonEncode(registerInfoUser);

    final res = await req.send();

    Map<String, dynamic> response = jsonDecode(await res.stream.bytesToString());

    if (response.containsKey('error code')) {
      print(response);
      if (response['message'] == 'Member Exception. 중복된 id가 있습니다.') {
        throw const FormatException('중복된 아이디가 있습니다.');
      }
      if (response['message'] == 'Member Exception. 회원가입 형식이 잘못됌') {
        throw const FormatException('8~12글자 아이디를 사용해주세요.\n영문 대 소문자, 숫자, 특수문자를 사용한 8~16자 비밀번호를 사용해주세요.');
      }
    }
  }

  Future<void> signIn(String userid, String password) async {
    final url = Uri.http(host, '/api/login');
    final req = http.Request('POST', url);

    req.headers[HttpHeaders.contentTypeHeader] = 'application/x-www-form-urlencoded';
    req.body = 'userid=$userid&password=$password';

    final res = await req.send();

    print('signIn ${res.statusCode}');
    if (res.statusCode == 403) {
      return;
    }

    final Map<String, dynamic> response = jsonDecode(await res.stream.bytesToString());

    accessToken = response['access_token'];
    refreshToken = response['refresh_token'];
    prefs.setStringList('token', [accessToken!, refreshToken!]);

    final user = await ref.read(userRepoProvider).getUserInfo();
    ref.read(userProvider.state).update((state) => user);
  }

  Future<bool> refresh() async {
    print('refresh called');

    final url = Uri.http(host, '/api/token/refresh');
    final req = http.Request('GET', url);

    req.headers[HttpHeaders.authorizationHeader] = 'Bearer $refreshToken';

    final res = await req.send();

    print('refresh ${res.statusCode}');
    if (res.statusCode == 403) {
      accessToken = null;
      refreshToken = null;
      ref.read(userProvider.state).update((state) => null);
      return false;
    }

    final Map<String, dynamic> response = jsonDecode(await res.stream.bytesToString());

    if (response.containsKey('access_token')) {
      accessToken = response['access_token'];
      refreshToken = response['refresh_token'];
      prefs.setStringList('token', [accessToken!, refreshToken!]);
    }

    return true;
  }
}
