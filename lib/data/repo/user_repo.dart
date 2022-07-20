import 'dart:convert';
import 'dart:io';

import 'package:sikcal/model/user.dart';
import 'package:http/http.dart' as http;

class UserRepo {
  UserRepo(this.host, this.token);

  final String host;
  final String token;

  Future<User> getUserInfo() async {
    final url = Uri.http(host, '/api/user');
    final req = http.Request('GET', url);

    req.headers['Authorization'] = 'Bearer $token';

    final res = await req.send();

    final Map<String, dynamic> response = jsonDecode(await res.stream.bytesToString());
    final birth = response['birth'];
    var date = DateTime(birth[0], birth[1], birth[2]);
    response['birth'] = date.toString();

    response.addAll(await getRecommendedIntake());

    final user = User.fromJson(response);


    print(user.toJson());
    return user;
  }

  Future<Map<String, dynamic>> getRecommendedIntake() async {
    if (token == null) throw const CertificateException('no token');

    final url = Uri.http(host, '/api/user/info');
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
