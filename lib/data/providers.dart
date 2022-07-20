import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/data/repo/auth_repo.dart';
import 'package:sikcal/data/repo/food_repo.dart';
import 'package:sikcal/data/repo/user_repo.dart';
import 'package:sikcal/model/meal.dart';
import 'package:sikcal/model/meal_list_model.dart';
import 'package:sikcal/model/user.dart';

const String host = '43.200.102.54:8080';

final authRepoProvider = Provider((ref) => AuthRepo(ref, host));
final userRepoProvider = Provider((ref) {
  final token = ref.watch(accessTokenProvider);
  return (token == null) ? null : UserRepo(host, token);
});
final foodRepoProvider = Provider.autoDispose((ref) {
  final token = ref.watch(accessTokenProvider);
  return (token == null) ? null : FoodRepo(host, token);
});

final userProvider = StreamProvider((ref) async* {
  yield null;
  final user = await ref.watch(userRepoProvider)?.getUserInfo();
  yield user;
});

final accessTokenProvider = StateProvider<String?>((ref) => null);
final refreshTokenProvider = StateProvider<String?>((ref) => null);

final currentMealListProvider = StateNotifierProvider<MealList, List<Meal>>((ref) => MealList(ref));
final gainedCaloriesProvider = StateProvider<Map<String, int>>((ref) => {
      'carbohydrate': 0,
      'protein': 0,
      'fat': 0,
    });
final loadingStateProvider = StateProvider((ref) => true);
