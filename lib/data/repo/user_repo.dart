import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/data/provider.dart';
import 'package:sikcal/model/user_basic.dart';

class UserRepo {
  UserRepo(this.ref);

  Ref ref;

  Future<User> getUser() {
    final loadingState = ref.watch(loadingStateProvider.state);

    loadingState.state = true;
    // TODO : 서버에서 받아오기
    return Future.delayed(Duration(seconds: 1), () {
      return User(
        username: 'hi-jin',
        carbohydrate: 250,
        protein: 180,
        fat: 60,
      );
    }).whenComplete(() => loadingState.state = false);
  }
}

// String? username;
// DateTime? userbirth;
// String? usergoal;
// String? usergender;
// String? userheight;
// String? userweight;
// String? useractivity;
