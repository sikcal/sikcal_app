class Diet {
  final int? member_id;
  final int? totalkcal;
  final String? requiredfood;
  final String? recipe;
  final String pictureuri;

  Diet({this.member_id, this.totalkcal, this.requiredfood, this.recipe, required this.pictureuri});

  factory Diet.fromJson(Map<String, dynamic> json) {
    return Diet(
      member_id: json['member_id'],
      totalkcal: json['totalkcal'],
      requiredfood: json['requiredfood'],
      recipe: json['recipe'],
      pictureuri: json['pictureuri']
    );
  }
  Diet.fromMap(Map<String, dynamic> map)
      : member_id = map['member_id'],
        totalkcal = map['totalkcal'],
        requiredfood = map['requiredfood'],
        recipe = map['recipe'],
        pictureuri = map['pictureuri'];
}