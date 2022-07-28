import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/data/providers.dart';
import 'package:sikcal/model/food.dart';
import 'package:sikcal/model/post.dart';

class PostDetail extends ConsumerWidget {
  const PostDetail({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context, ref) {
    int total = 0;
    int carbohydrate = 0;
    int protein = 0;
    int fat = 0;
    for (Food food in post.meal!.foodList.keys) {
      total += food.totalKcal * post.meal!.foodList[food]!;
      carbohydrate += food.carbohydrate * post.meal!.foodList[food]!;
      protein += food.protein * post.meal!.foodList[food]!;
      fat += food.fat * post.meal!.foodList[food]!;
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(aspectRatio: 1.5 / 1, child: Image.network(post.picUri, fit: BoxFit.cover)),
            Text(post.menu, style: kTitleTextStyle.copyWith(fontWeight: FontWeight.normal)),
            Text('총 ${total}kcal | 탄수화물 ${carbohydrate}g | 단백질 : ${protein}g | 지방 : ${fat}g'),
            const SizedBox(height: 20),
            Text('식단 설명', style: kTitleTextStyle.copyWith(fontWeight: FontWeight.normal)),
            const SizedBox(height: 5),
            Text(post.recipe),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                ref.read(postRepoProvider).clickLike(post.postId);
              },
              child: Row(
                children: [
                  Icon(Icons.thumb_up_alt_outlined, color: darkPrimaryColor),
                  const SizedBox(width: 5),
                  Text('${post.numOfLike}', style: TextStyle(color: darkPrimaryColor)),
                  const SizedBox(width: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
