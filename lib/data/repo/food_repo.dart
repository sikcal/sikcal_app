import 'dart:convert';

import 'package:sikcal/model/food.dart';
import 'package:http/http.dart' as http;

class FoodRepo {
  FoodRepo(this.host, this.token);

  final String host;
  final String token;

  Future<List<Food>> searchFood(String name) async {
    var params = {
      'foodName': name,
    };

    final url = Uri.http(host, '/api/user/record/food', params);
    final http.Request req = http.Request('GET', url);

    req.headers['Authorization'] = 'Bearer $token';
    print(req.headers);

    final res = await req.send();

    print(res.statusCode);
    print(res.reasonPhrase);

    var jsonList = jsonDecode(await res.stream.bytesToString());

    print(jsonList);

    List<Food> result = <Food>[];
    for (var json in jsonList) {
      // print(json);
      result.add(Food.fromJson(json));
    }

    return result;
  }
}
