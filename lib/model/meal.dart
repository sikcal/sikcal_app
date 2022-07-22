import 'package:sikcal/model/food.dart';

class Meal {
  late int recordId;
  final Map<Food, int> foodList = {};

  void addFood(Food food) {
    for (Food key in foodList.keys) {
      if (key.foodId == food.foodId) {
        foodList[key] = foodList[key]! + 1;
        return;
      }
    }
    foodList[food] = 1;
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
