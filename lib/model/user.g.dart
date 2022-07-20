// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['name'] as String,
      json['height'] as int,
      json['weight'] as int,
      DateTime.parse(json['birth'] as String),
      json['sex'] as String,
      json['activity'] as String,
      json['goal'] as String,
      json['carbohydrate'] as int,
      json['protein'] as int,
      json['fat'] as int,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
      'birth': instance.birth.toIso8601String(),
      'sex': instance.sex,
      'activity': instance.activity,
      'goal': instance.goal,
      'carbohydrate': instance.carbohydrate,
      'protein': instance.protein,
      'fat': instance.fat,
    };
