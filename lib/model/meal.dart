import 'package:sikcal/model/food.dart';

class Meal {
  final Map<Food, int> foodList = {};

  void addFood(Food food) {
    foodList[food] = (foodList.containsKey(food)) ? foodList[food]! + 1 : 1;
  }

  // 개수 줄이기
  void subFood(Food food) {
    if (!foodList.containsKey(food)) return;

    foodList[food] = foodList[food]! - 1;
    if (foodList[food] == 0) foodList.remove(food);
  }

  // TODO json 추가

  String toString() {
    String result = '';

    for (var key in foodList.keys) {
      result += '$key*${foodList[key]} ';
    }

    return result.trim();
  }
}
