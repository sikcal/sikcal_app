class Diet {
  final String diet_image;
  final String diet_title;
  final int diet_protein;
  final int diet_carbohydrate;
  final int diet_fat;
  final int diet_total_kcal;

  Diet.fromMap(Map<String, dynamic> map)
    : diet_image = map['diet_image'],
      diet_title = map['diet_title'],
      diet_protein = map['diet_protein'],
      diet_carbohydrate = map['diet_carbohydrate'],
      diet_fat = map['diet_fat'],
      diet_total_kcal = map['diet_total_kcal'];

  @override
  String toString() => "Diet<$diet_title:$diet_image>";

}