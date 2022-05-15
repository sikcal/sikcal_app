import 'package:sikcal/model/food.dart';

class Meal {
  final Map<Food, int> foodList = {};

  // TODO json 추가

  String toString() {
    String result = '';

    for (var key in foodList.keys) {
      result += '$key*${foodList[key]} ';
    }

    return result.trim();
  }
}