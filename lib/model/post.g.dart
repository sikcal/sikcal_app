// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      postId: json['postId'] as int? ?? -1,
      menu: json['menu'] as String,
      numOfLike: json['numOfLike'] as int? ?? 0,
      recipe: json['recipe'] as String,
      picUri: json['picUri'] as String,
    )..meal = json['meal'] == null
        ? null
        : Meal.fromJson(json['meal'] as Map<String, dynamic>);

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'postId': instance.postId,
      'menu': instance.menu,
      'numOfLike': instance.numOfLike,
      'recipe': instance.recipe,
      'picUri': instance.picUri,
      'meal': instance.meal,
    };
