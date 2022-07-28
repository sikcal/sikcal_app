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
      onTap: () async {
        await showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: PostDetail(post: post),
            );
          },
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(Icons.thumb_up_alt_outlined, color: darkPrimaryColor),
              const SizedBox(width: 5),
              Text('${post.numOfLike}', style: TextStyle(color: darkPrimaryColor)),
              const SizedBox(width: 15),
            ],
          ),
          AspectRatio(aspectRatio: 1.5 / 1, child: Image.network(post.picUri, fit: BoxFit.cover)),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '총 ${post.meal!.foodList.keys.map((e) => e.totalKcal * post.meal!.foodList[e]!).reduce((a, b) => a + b)}kcal',
                    style: TextStyle(color: darkPrimaryColor, fontSize: 16),
                  ),
                  Text(
                    '탄수화물 ${post.meal!.foodList.keys.map((e) => e.carbohydrate * post.meal!.foodList[e]!).reduce((a, b) => a + b)}g',
                    style: TextStyle(color: darkPrimaryColor, fontSize: 16),
                  ),
                  Text(
                    '단백질 ${post.meal!.foodList.keys.map((e) => e.protein * post.meal!.foodList[e]!).reduce((a, b) => a + b)}g',
                    style: TextStyle(color: darkPrimaryColor, fontSize: 16),
                  ),
                  Text(
                    '지방 ${post.meal!.foodList.keys.map((e) => e.fat * post.meal!.foodList[e]!).reduce((a, b) => a + b)}g',
                    style: TextStyle(color: darkPrimaryColor, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...post.meal!.foodList.keys.map(
                      (e) => Text(
                        '${e.foodName} * ${post.meal!.foodList[e]}',
                        style: TextStyle(color: darkPrimaryColor, fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            thickness: 3,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
