import 'package:flutter/material.dart';
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/data/repo/post_repo.dart';
import 'package:sikcal/screens/components/search_field.dart';
import 'package:sikcal/screens/feed/post_widget.dart';

class FeedView extends StatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            SearchField(controller: controller, onSubmit: () {}), // TODO
            const SizedBox(height: 25),
            Text('오늘의 추천 식단', style: TextStyle(color: darkPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            PostWidget(post: PostRepo().getBestPost()),
          ],
        ),
      ),
    );
  }
}
