// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Food _$FoodFromJson(Map<String, dynamic> json) => Food(
      hashId: json['hashId'] as int,
      name: json['name'] as String,
      carbohydrate: json['carbohydrate'] as int,
      protein: json['protein'] as int,
      fat: json['fat'] as int,
      totalKcal: json['totalKcal'] as int,
    );

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
      'hashId': instance.hashId,
      'name': instance.name,
      'carbohydrate': instance.carbohydrate,
      'protein': instance.protein,
      'fat': instance.fat,
      'totalKcal': instance.totalKcal,
    };