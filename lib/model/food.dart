import 'package:json_annotation/json_annotation.dart';

part 'food.g.dart';

@JsonSerializable()
class Food implements Comparable {
  final int foodId;
  final String foodName;
  final int carbohydrate;
  final int protein;
  final int fat;
  final int totalKcal;

  Food({
    required this.foodId,
    required this.foodName,
    required this.carbohydrate,
    required this.protein,
    required this.fat,
    required this.totalKcal
  });

  @override
  int compareTo(other) {
    Food o = other as Food;
    return foodId - o.foodId;
  }

  int getCalorie() {
    return carbohydrate * 4 + protein * 4 + fat * 9;
  }

  String toString() {
    return foodName;
  }

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);
  Map<String, dynamic> toJson() => _$FoodToJson(this);
}
