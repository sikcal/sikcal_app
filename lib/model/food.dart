class Food implements Comparable {
  final int hashId;
  final String name;
  final int carbohydrate;
  final int protein;
  final int fat;

  Food({
    required this.hashId,
    required this.name,
    required this.carbohydrate,
    required this.protein,
    required this.fat,
  });

  @override
  int compareTo(other) {
    Food o = other as Food;
    return hashId - o.hashId;
  }

  int getCalorie() {
    return carbohydrate * 4 + protein * 4 + fat * 9;
  }

  String toString() {
    return name;
  }

  // TODO : json parse 추가
}
