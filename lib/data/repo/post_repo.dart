import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/data/providers.dart';
import 'package:sikcal/data/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sikcal/model/meal.dart';
import 'package:sikcal/model/post.dart';

class PostRepo {
  PostRepo(this.ref, this.host, this.refresh);

  final Ref ref;
  final String host;
  final Function refresh;

  clickLike(int postId) async {
    final url = Uri.http(host, '/api/user/record/post/likes', {'postId' : '$postId'});
    final req = http.Request('PUT', url);
    req.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';

    print(req);

    final res = await req.send();
    print('clickLike ${res.statusCode}');
    if (res.statusCode == 403) {
      if (!await refresh()) {
        return null;
      }
      return getBestPostList();
    }

    print(await res.stream.bytesToString());
    // TODO 새로고침
  }

  Future<List<Post>?> getBestPostList() async {
    final url = Uri.http(host, '/api/user/record/postlist');
    final req = http.Request('GET', url);
    req.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';

    final res = await req.send();
    print('getBestPostList ${res.statusCode}');
    if (res.statusCode == 403) {
      if (!await refresh()) {
        return null;
      }
      return getBestPostList();
    }

    final response = jsonDecode(await res.stream.bytesToString());
    List<Post> postList = [];
    for(Map<String, dynamic> r in response) {
      r['postId'] = r['id'];
      r['recordId'] = r['record']['id'];

      Post post = Post.fromJson(r);
      Meal? meal = await ref.read(mealRepoProvider).getMeal(r['recordId']);
      if (meal == null) continue;

      post.meal = meal;

      postList.add(post);
    }

    return postList;
  }

  void addPost(Post post) async {
    final url = Uri.http(host, '/api/user/record/post');
    final req = http.Request('POST', url);
    req.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken';
    req.headers[HttpHeaders.contentTypeHeader] = 'application/json';
    req.body = jsonEncode({
      "menu": post.menu,
      "picUri": post.picUri,
      "recipe": post.recipe,
      "recordId": post.meal!.recordId,
    });

    final res = await req.send();
    print('addPost ${res.statusCode}');
    if (res.statusCode == 403) {
      if (!await refresh()) {
        return null;
      }
      return addPost(post);
    }

    print(await res.stream.bytesToString());
  }
}
