import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/data/repo/food_repo.dart';
import 'package:sikcal/data/repo/user_repo.dart';
import 'package:sikcal/model/meal.dart';
import 'package:sikcal/model/meal_list_model.dart';
import 'package:sikcal/model/user.dart';

final userRepoProvider = Provider((ref) => UserRepo(ref: ref));
final userProvider = StateProvider<User?>((ref) => null);
final currentMealListProvider = StateNotifierProvider<MealList, List<Meal>>((ref) => MealList(ref));
final gainedCaloriesProvider = StateProvider<Map<String, int>>((ref) => {
  'carbohydrate': 0,
  'protein': 0,
  'fat': 0,
});
final loadingStateProvider = StateProvider((ref) => true);
final foodRepoProvider = Provider((ref) => FoodRepo());