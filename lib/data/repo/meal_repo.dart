import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:sikcal/data/providers.dart';
import 'package:sikcal/data/shared_preferences.dart';
import 'package:sikcal/model/food.dart';
import 'package:sikcal/model/meal.dart';

class MealRepo {
  MealRepo(this.ref, this.host, this.refresh);

  final Ref ref;
  final String host;
  final Function refresh;

  Future<MealResponse?> addMeal(Meal meal) async {
    final url = Uri.http(host, '/api/user/record');
    final req = http.Request("POST", url);
    req.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';

    final res = await req.send();
    print('addMeal ${res.statusCode}');
    if (res.statusCode == 403) {
      if (!await refresh()) {
        return null;
      }
      return addMeal(meal);
    }

    Map<String, dynamic> response = jsonDecode(await res.stream.bytesToString());
    MealResponse result = MealResponse(
      response['recordId'],
      DateTime(response['createdDate'][0], response['createdDate'][1], response['createdDate'][2]),
    );

    for (Food food in meal.foodList.keys) {
      for (int _ = 0; _ < meal.foodList[food]!; _++) {
        await addFood(result.recordId, food);
      }
    }

    return result;
  }

  Future<bool> removeMeal(int recordId) async {
    final url = Uri.http(host, '/api/user/record/$recordId');
    final req = http.Request("DELETE", url);
    req.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';

    final res = await req.send();
    print('removeMeal($recordId) ${res.statusCode}');
    if (res.statusCode == 403) {
      if (!await refresh()) {
        return false;
      }
      return removeMeal(recordId);
    }

    return true;
  }

  Future<int?> addFood(int recordId, Food food) async {
    final param = {
      "recordId": recordId,
      "foodId": food.foodId,
    };

    final url = Uri.http(host, '/api/user/record/food');
    final req = http.Request("POST", url);
    req.headers[HttpHeaders.authorizationHeader] = "Bearer $accessToken";
    req.headers[HttpHeaders.contentTypeHeader] = "application/json";
    req.body = jsonEncode(param);

    final res = await req.send();
    print('addFood ${res.statusCode}');
    if (res.statusCode == 403) {
      if (!await refresh()) {
        return null;
      }
      return addFood(recordId, food);
    }

    Map<String, dynamic> response = jsonDecode(await res.stream.bytesToString());
    print(response);
    final recordFoodId = response['recordFoodId'];
    return recordFoodId;
  }

  Future<void> getMealList() async {
    if (records.isEmpty) {
      print("getMealList no records");
      ref.watch(currentMealListProvider.notifier).set([]);
      return;
    }
    List<int> shouldRemove = [];
    DateTime today = DateTime.now();
    for (int i = 0; i < recordDates.length; i++) {
      String date = recordDates[i];
      DateTime d = DateTime.parse(date);
      print("${DateTime(d.year, d.month, d.day)}   ${DateTime(today.year, today.month, today.day)}");
      if (DateTime(d.year, d.month, d.day).difference(DateTime(today.year, today.month, today.day)).inDays != 0) shouldRemove.add(i);
    }
    for (int r in shouldRemove.reversed) {
      recordDates.removeAt(r);
      records.removeAt(r);
    }
    prefs.setStringList('records', records);
    prefs.setStringList('recordDates', recordDates);

    if (records.isNotEmpty) {
      List<Meal> mealList = [];
      for (int id in records.map((e) => int.parse(e))) {
        final meal = await getMeal(id);
        if (meal != null) {
          meal.recordId = id;
          mealList.add(meal);
        }
      }
      ref.watch(currentMealListProvider.notifier).set(mealList);
    }
  }

  Future<Meal?> getMeal(int recordId) async {
    final param = {
      "recordId": '$recordId',
    };
    final url = Uri.http(host, '/api/user/record/list', param);
    final req = http.Request("GET", url);
    req.headers[HttpHeaders.authorizationHeader] = "Bearer $accessToken";

    final res = await req.send();
    print("getMeal($recordId) ${res.statusCode}");
    if (res.statusCode == 403) {
      if (!await refresh()) {
        return null;
      }
      return getMeal(recordId);
    }

    final response = jsonDecode(await res.stream.bytesToString());
    final Meal meal = Meal();
    for (var r in response) {
      var food = Food.fromJson(r);
      meal.addFood(food);
    }

    meal.recordId = recordId;
    print(meal);
    return meal;
  }
}

class MealResponse {
  final int recordId;
  final DateTime recordDate;

  MealResponse(this.recordId, this.recordDate);
}
