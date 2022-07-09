import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/data/provider.dart';
import 'package:sikcal/model/food.dart';
import 'package:sikcal/model/meal.dart';

class MealList extends StateNotifier<List<Meal>> {
  MealList(this.ref) : super(<Meal>[]);

  final Ref ref;

  void set(List<Meal> mealList) {
    state = mealList;

    int carbohydrate = 0;
    int protein = 0;
    int fat = 0;

    final gainedCalories = ref.read(gainedCaloriesProvider.state).state;

    for (Meal meal in mealList) {
      for (Food food in meal.foodList.keys) {
        carbohydrate += food.carbohydrate * meal.foodList[food]!;
        protein += food.protein * meal.foodList[food]!;
        fat += food.fat * meal.foodList[food]!;
      }
    }
    gainedCalories['carbohydrate'] =  carbohydrate;
    gainedCalories['protein'] = protein;
    gainedCalories['fat'] = fat;
  }
}