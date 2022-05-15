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
  int gainedCarbohydrate = 0;
  int gainedProtein = 0;
  int gainedFat = 0;

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
