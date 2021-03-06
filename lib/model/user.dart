import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String name;
  final int height;
  final int weight;
  final DateTime birth;
  final String sex;
  final String activity;
  final String goal;
  final int carbohydrate;
  final int protein;
  final int fat;

  User(this.name, this.height, this.weight, this.birth, this.sex, this.activity, this.goal, this.carbohydrate, this.protein, this.fat);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}