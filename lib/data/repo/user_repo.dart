import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/model/register_info_user.dart';
import 'package:sikcal/model/user.dart';
import 'package:http/http.dart' as http;

class UserRepo {
  UserRepo(this.ref);

  Ref ref;

  Future<User> signUp(RegisterInfoUser registerInfoUser) async {
    final url = Uri.http('43.200.102.54:8080', '/api/join');
    final req = http.Request("POST", url);

    req.headers['Content-Type'] = 'application/json';
    req.body = jsonEncode(registerInfoUser);

    final res = await req.send();

    Map<String, dynamic> response = jsonDecode(await res.stream.bytesToString());

    if (response.containsKey('error code')) {
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

    final User user = User.fromJson(response);

    return user;
  }

  // Future<User> getUser() {
  //   final loadingState = ref.watch(loadingStateProvider.state);
  //
  //   loadingState.state = true;
  //   // TODO : 서버에서 받아오기
  //   return Future.delayed(Duration(seconds: 1), () {
  //     return User(name, height, weight, birth, sex, activity, goal);
  //   }).whenComplete(() => loadingState.state = false);
  // }
}

// String? username;
// DateTime? userbirth;
// String? usergoal;
// String? usergender;
// String? userheight;
// String? userweight;
// String? useractivity;
