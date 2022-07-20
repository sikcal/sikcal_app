import 'package:json_annotation/json_annotation.dart';

part 'register_info_user.g.dart';

@JsonSerializable()
class RegisterInfoUser {
  String? name;
  int? height;
  int? weight;
  DateTime? birth;
  String? sex;
  String? activity;
  String? goal;
  String? id;
  String? password;
  List roles = [];

  RegisterInfoUser();

  factory RegisterInfoUser.fromJson(Map<String, dynamic> json) => _$RegisterInfoUserFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterInfoUserToJson(this);
}