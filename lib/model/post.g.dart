// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      uid: json['uid'] as int,
      menuName: json['menuName'] as String,
      foodList: (json['foodList'] as List<dynamic>)
          .map((e) => Food.fromJson(e as Map<String, dynamic>))
          .toList(),
      numOfLikes: json['numOfLikes'] as int,
      recipe: json['recipe'] as String,
      imagePath: json['imagePath'] as String,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'uid': instance.uid,
      'menuName': instance.menuName,
      'foodList': instance.foodList,
      'numOfLikes': instance.numOfLikes,
      'recipe': instance.recipe,
      'imagePath': instance.imagePath,
    };
