import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/data/providers.dart';
import 'package:sikcal/model/post.dart';
import 'package:sikcal/screens/components/search_field.dart';
import 'package:sikcal/screens/feed/post_widget.dart';

class FeedView extends ConsumerStatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  ConsumerState<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends ConsumerState<FeedView> {
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
            Expanded(
              child: FutureBuilder(
                future: ref.read(postRepoProvider).getBestPostList(),
                builder: (context, AsyncSnapshot<List<Post>?> bestPostList) {
                  if (bestPostList.data == null) {
                    return Container();
                  } else {
                    return ListView.builder(
                      itemCount: bestPostList.data!.length,
                      itemBuilder: (context, idx) {
                        return PostWidget(post: bestPostList.data!.reversed.elementAt(idx));
                      },
                    );
                  }
                },
              ),
            ),
            // PostWidget(post: PostRepo().getBestPost()),
          ],
        ),
      ),
    );
  }
}
