import 'package:json_annotation/json_annotation.dart';
import 'package:sikcal/model/meal.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  int postId;
  String menu; // menuName
  int numOfLike; // 좋아요 개수
  String recipe; // 조리법
  String picUri;
  Meal? meal;

  Post({
    this.postId = -1,
    required this.menu,
    this.numOfLike = 0,
    required this.recipe,
    required this.picUri,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
