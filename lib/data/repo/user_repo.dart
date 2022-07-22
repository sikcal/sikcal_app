import 'dart:convert';
import 'dart:io';

import 'package:sikcal/data/tokens.dart';
import 'package:sikcal/model/user.dart';
import 'package:http/http.dart' as http;

class UserRepo {
  UserRepo(this.host, this.refresh);

  final String host;
  final Function refresh;

  Future<User> getUserInfo() async {
    final url = Uri.http(host, '/api/user');
    final req = http.Request('GET', url);

    req.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';

    final res = await req.send();
    print('getUserInfo ${res.statusCode}');
    if (res.statusCode == 403) {
      await refresh();
      return getUserInfo();
    }

    final Map<String, dynamic> response = jsonDecode(await res.stream.bytesToString());
    final birth = response['birth'];
    var date = DateTime(birth[0], birth[1], birth[2]);
    response['birth'] = date.toString();

    response.addAll(await getRecommendedIntake());

    final user = User.fromJson(response);

    return user;
  }

  Future<Map<String, dynamic>> getRecommendedIntake() async {
    final url = Uri.http(host, '/api/user/info');
    final req = http.Request('GET', url);

    req.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';

    final res = await req.send();
    print('getRecommendedIntake ${res.statusCode}');
    if (res.statusCode == 403) {
      await refresh();
      return getRecommendedIntake();
    }

    final Map<String, dynamic> response = jsonDecode(await res.stream.bytesToString());

    response['carbohydrate'] = (response['requiredTan'] / 4).toInt(); // kcal to gram
    response['protein'] = (response['requiredDan'] / 4).toInt();
    response['fat'] = (response['requiredJi'] / 9).toInt();

    return response;
  }
}
