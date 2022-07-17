import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserRepo {
  UserRepo(this.ref);

  Ref ref;

  // Future<User> getUser() {
  //   final loadingState = ref.watch(loadingStateProvider.state);
  //
  //   loadingState.state = true;
  //   // TODO : 서버에서 받아오기
  //   return Future.delayed(Duration(seconds: 1), () {
  //     return User(name, height, weight, birth, sex, activity, goal);
  //   }).whenComplete(() => loadingState.state = false);
  // }
}

// String? username;
// DateTime? userbirth;
// String? usergoal;
// String? usergender;
// String? userheight;
// String? userweight;
// String? useractivity;
