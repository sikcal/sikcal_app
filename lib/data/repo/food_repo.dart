import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sikcal/model/food.dart';

class FoodRepo {
  Future<List<Food>> searchFood(String name) async {
    var params = {
      'foodName': name,
    };

    final url = Uri.http('43.200.102.54:8080', '/api/record/food', params);
    final http.Request req = http.Request('GET', url);

    final res = await req.send();

    var jsonList = jsonDecode(await res.stream.bytesToString());

    List<Food> result = <Food>[];
    for (var json in jsonList) {
      // print(json);
      result.add(Food.fromJson(json));
    }

    return result;
  }
}