import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/data/provider.dart';

class UserRepo {
  UserRepo(this.ref);

  Ref ref;

  Future<void> setUser() {
    final user = ref.watch(userBasicProvider);
    final loadingState = ref.watch(loadingStateProvider.state);

    loadingState.state = true;

    // TODO : 서버에서 받아오기
    return Future.delayed(Duration(seconds: 1), () {
      user.username = '안형진';
      user.carbohydrate = 150;
      user.protein = 120;
      user.fat = 40;
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
