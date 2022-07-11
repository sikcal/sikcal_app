import 'dart:convert';

import 'package:http/http.dart' as http;

class FoodRepo {
  Future<void> searchFood(String name) async {
    var params = {
      'foodName': name,
    };

    final url = Uri.http('43.200.102.54:8080', '/api/record/food').replace(queryParameters: params);
    final req = http.Request('GET', Uri.http('43.200.102.54:8080', '/api/record/food'));
    req.body = jsonEncode(params);

    await req.send().then((value) => print(value.request));
  }
}