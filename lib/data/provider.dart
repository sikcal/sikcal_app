import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/data/repo/user_repo.dart';
import 'package:sikcal/model/meal.dart';
import 'package:sikcal/model/meal_list_model.dart';
import 'package:sikcal/model/user_basic.dart';

final userRepoProvider = Provider((ref) => UserRepo(ref));
final userBasicProvider = StateNotifierProvider<UserBasic, User>((ref) => UserBasic()); // TODO from json
final currentMealListProvider = StateNotifierProvider<MealList, List<Meal>>((ref) => MealList(ref));
// final currentMealListProvider = StateProvider<List<Meal>>((ref) => <Meal>[]); // TODO Calorie 연결
final gainedCaloriesProvider = StateProvider<Map<String, int>>((ref) => {
  'carbohydrate': 0,
  'protein': 0,
  'fat': 0,
});
final loadingStateProvider = StateProvider((ref) => true);