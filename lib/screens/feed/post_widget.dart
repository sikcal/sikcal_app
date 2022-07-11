import 'package:flutter/material.dart';
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/model/post.dart';
import 'package:sikcal/screens/feed/post_detail.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key, required this.post}) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetail(post: post)));
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(Icons.thumb_up_alt_outlined, color: darkPrimaryColor),
              const SizedBox(width: 5),
              Text('${post.numOfLikes}', style: TextStyle(color: darkPrimaryColor)),
              const SizedBox(width: 15),
              Text('HOT!!!', style: TextStyle(color: accentColor)),
            ],
          ),
          AspectRatio(aspectRatio: 1.5 / 1, child: Image.network(post.imagePath, fit: BoxFit.cover)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '총 ${post.foodList.map((e) => e.total_kcal).reduce((a, b) => a + b)}kcal',
                    style: TextStyle(color: darkPrimaryColor, fontSize: 16),
                  ),
                  Text(
                    '탄수화물 ${post.foodList.map((e) => e.carbohydrate).reduce((a, b) => a + b)}g',
                    style: TextStyle(color: darkPrimaryColor, fontSize: 16),
                  ),
                  Text(
                    '단백질 ${post.foodList.map((e) => e.protein).reduce((a, b) => a + b)}g',
                    style: TextStyle(color: darkPrimaryColor, fontSize: 16),
                  ),
                  Text(
                    '지방 ${post.foodList.map((e) => e.fat).reduce((a, b) => a + b)}g',
                    style: TextStyle(color: darkPrimaryColor, fontSize: 16),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...post.foodList.map((e) => Text(
                        '${e.foodName} : ${e.total_kcal}kcal',
                        style: TextStyle(color: darkPrimaryColor, fontSize: 16),
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
