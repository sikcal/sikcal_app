import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/model/meal.dart';

class UserBasic extends StateNotifier<User> {
  UserBasic() : super(User());

  void setUser(User user) {
    state = user;
  }
}

@immutable
class User {
  String? uid;
  String? username;
  DateTime? userbirth;
  String? usergoal;
  String? usergender;
  String? userheight;
  String? userweight;
  String? useractivity;
  int carbohydrate;
  int protein;
  int fat;

  User({
    this.uid,
    this.username,
    this.userbirth,
    this.usergoal,
    this.usergender,
    this.userheight,
    this.userweight,
    this.useractivity,
    this.carbohydrate = 0,
    this.protein = 0,
    this.fat = 0,
  });
}
