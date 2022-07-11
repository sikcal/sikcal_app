import 'package:json_annotation/json_annotation.dart';

part 'food.g.dart';

@JsonSerializable()
class Food implements Comparable {
  final String foodName;
  final int carbohydrate;
  final int protein;
  final int fat;
  final int total_kcal;

  Food({
    required this.foodName,
    required this.carbohydrate,
    required this.protein,
    required this.fat,
    required this.total_kcal
  });

  @override
  int compareTo(other) {
    Food o = other as Food;
    return foodName.hashCode - o.foodName.hashCode;
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
