import 'dart:convert';
import 'dart:io';

import 'package:sikcal/data/tokens.dart';
import 'package:sikcal/model/food.dart';
import 'package:http/http.dart' as http;

class FoodRepo {
  FoodRepo(this.host, this.refresh);

  final String host;
  final Function refresh;

  Future<List<Food>> searchFood(String name) async {
    var params = {
      'foodName': name,
    };

    final url = Uri.http(host, '/api/user/record/food', params);
    final http.Request req = http.Request('GET', url);
    req.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
    req.headers[HttpHeaders.contentTypeHeader] = 'application/json';

    final res = await req.send();

    print('searchFood ${res.statusCode}');
    if (res.statusCode == 403) {
      await refresh();
      return searchFood(name);
    }

    var jsonList = jsonDecode(await res.stream.bytesToString());

    List<Food> result = <Food>[];
    for (var json in jsonList) {
      // print(json);
      result.add(Food.fromJson(json));
    }

    return result;
  }
}
