// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_info_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterInfoUser _$RegisterInfoUserFromJson(Map<String, dynamic> json) =>
    RegisterInfoUser()
      ..name = json['name'] as String?
      ..height = json['height'] as int?
      ..weight = json['weight'] as int?
      ..birth =
          json['birth'] == null ? null : DateTime.parse(json['birth'] as String)
      ..sex = json['sex'] as String?
      ..activity = json['activity'] as String?
      ..goal = json['goal'] as String?
      ..id = json['id'] as String?
      ..pw = json['pw'] as String?
      ..roles = json['roles'] as List<dynamic>;

Map<String, dynamic> _$RegisterInfoUserToJson(RegisterInfoUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
      'birth': instance.birth?.toIso8601String(),
      'sex': instance.sex,
      'activity': instance.activity,
      'goal': instance.goal,
      'id': instance.id,
      'pw': instance.pw,
      'roles': instance.roles,
    };
