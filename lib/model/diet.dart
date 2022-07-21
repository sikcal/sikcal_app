class Diet {
  final int member_id;
  final int totalkcal;
  final String menu;
  final String requiredfood;
  final String recipe;
  final String pictureuri;

  Diet({
    required this.member_id,
    required this.totalkcal,
    required this.menu,
    required this.requiredfood,
    required this.recipe,
    required this.pictureuri});

  factory Diet.fromJson(Map<String, dynamic> json) {
    return Diet(
      member_id: json['member_id'],
      totalkcal: json['totalkcal'],
      menu: json['menu'],
      requiredfood: json['requiredfood'],
      recipe: json['recipe'],
      pictureuri: json['pictureuri']
    );
  }

  Diet.fromMap(Map<String, dynamic> map)
      : member_id = map['member_id'],
        totalkcal = map['totalkcal'],
        menu = map['menu'],
        requiredfood = map['requiredfood'],
        recipe = map['recipe'],
        pictureuri = map['pictureuri'];
}
