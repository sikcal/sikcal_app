import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/data/provider.dart';
import 'package:sikcal/model/register_info_user.dart';
import 'package:sikcal/model/user.dart';
import 'package:http/http.dart' as http;

class UserRepo {
  UserRepo({
    required this.ref,
  });

  Ref ref;
  String? accessToken;
  String? refreshToken;

  Future<void> signUp(RegisterInfoUser registerInfoUser) async {
    final url = Uri.http('43.200.102.54:8080', '/api/join');
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

    final birth = response['birth'];
    var date = DateTime(birth[0], birth[1], birth[2]);
    response['birth'] = date.toString();
  }

  Future<User?> signIn(String userid, String password) async {
    final url = Uri.http('43.200.102.54:8080', '/api/login');
    final req = http.Request('POST', url);

    req.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    req.body = 'userid=$userid&password=$password';

    final res = await req.send();

    if (res.statusCode == 403) {
      return null;
    }

    final Map<String, dynamic> response = jsonDecode(await res.stream.bytesToString());

    // TODO local에 저장
    accessToken = response['access_token'];
    refreshToken = response['refresh_token'];

    return await getUserInfo();
  }

  Future<User> getUserInfo() async {
    final token = accessToken;
    if (token == null) throw const CertificateException('no token');

    final url = Uri.http('43.200.102.54:8080', '/api/user');
    final req = http.Request('GET', url);

    req.headers['Authorization'] = 'Bearer ${token.trim()}';

    final res = await req.send();

    final Map<String, dynamic> response = jsonDecode(await res.stream.bytesToString());
    final birth = response['birth'];
    var date = DateTime(birth[0], birth[1], birth[2]);
    response['birth'] = date.toString();

    response.addAll(await getRecommendedIntake());

    final user = User.fromJson(response);
    ref.read(userProvider.state).update((state) => user);
    print(user.toJson());

    return user;
  }

  Future<Map<String, dynamic>> getRecommendedIntake() async {
    final token = accessToken;
    if (token == null) throw const CertificateException('no token');

    final url = Uri.http('43.200.102.54:8080', '/api/user/info');
    final req = http.Request('GET', url);

    req.headers['Authorization'] = 'Bearer ${token.trim()}';

    final res = await req.send();

    final Map<String, dynamic> response = jsonDecode(await res.stream.bytesToString());

    response['carbohydrate'] = (response['requiredTan'] / 4).toInt(); // kcal to gram
    response['protein'] = (response['requiredDan'] / 4).toInt();
    response['fat'] = (response['requiredJi'] / 9).toInt();

    return response;
  }
}

// String? username;
// DateTime? userbirth;
// String? usergoal;
// String? usergender;
// String? userheight;
// String? userweight;
// String? useractivity;
