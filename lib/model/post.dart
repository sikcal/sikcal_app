import 'package:sikcal/model/food.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  int uid;
  String menuName;
  List<Food> foodList;
  int numOfLikes; // 좋아요 개수
  String recipe; // 조리법
  String imagePath;

  Post({
    required this.uid,
    required this.menuName,
    required this.foodList,
    required this.numOfLikes,
    required this.recipe,
    required this.imagePath,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
