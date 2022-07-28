import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/data/repo/auth_repo.dart';
import 'package:sikcal/data/repo/food_repo.dart';
import 'package:sikcal/data/repo/meal_repo.dart';
import 'package:sikcal/data/repo/post_repo.dart';
import 'package:sikcal/data/repo/user_repo.dart';
import 'package:sikcal/model/meal.dart';
import 'package:sikcal/model/meal_list_model.dart';
import 'package:sikcal/model/user.dart';

const String host = '43.200.102.54:8080';

final authRepoProvider = Provider((ref) => AuthRepo(ref, host));
final userRepoProvider = Provider((ref) => UserRepo(host, ref.read(authRepoProvider).refresh));
final foodRepoProvider = Provider((ref) => FoodRepo(host, ref.read(authRepoProvider).refresh));
final mealRepoProvider = Provider((ref) => MealRepo(ref, host, ref.read(authRepoProvider).refresh));
final postRepoProvider = Provider((ref) => PostRepo(ref, host, ref.read(authRepoProvider).refresh));

final userProvider = StateProvider<User?>((ref) => null);

final currentMealListProvider = StateNotifierProvider<MealList, List<Meal>>((ref) => MealList(ref));
final gainedCaloriesProvider = StateProvider<Map<String, int>>((ref) => {
      'carbohydrate': 0,
      'protein': 0,
      'fat': 0,
    });
final loadingStateProvider = StateProvider((ref) => true);

final storageRefProvider = Provider((ref) => FirebaseStorage.instance.ref());