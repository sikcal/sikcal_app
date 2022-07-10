import 'package:sikcal/model/food.dart';
import 'package:sikcal/model/post.dart';

class PostRepo {
  Post getBestPost() {
    return Post(
      uid: 1,
      menuName: "맛있는 토마토 계란 볶음",
      foodList: [
        Food(hashId: 1, name: "닭가슴살", carbohydrate: 10, protein: 30, fat: 2, totalKcal: 250),
        Food(hashId: 2, name: "토마토", carbohydrate: 10, protein: 30, fat: 2, totalKcal: 100),
        Food(hashId: 3, name: "계란", carbohydrate: 10, protein: 30, fat: 2, totalKcal: 120),
        Food(hashId: 4, name: "발아현미", carbohydrate: 10, protein: 30, fat: 2, totalKcal: 130),
      ],
      numOfLikes: 275,
      recipe: "조리순서\n달군 팬에 마늘과 버터를 넣고 고루 볶아줍니다.\n손질한 닭가슴살을 넣고 완전히 익도록 볶아줍니다.\n토마토와 청양고추를 썰어서 넣어줍니다.\n소금으로 약간의 간을 한후 계란을 부어줍니다.\n스크램블 하듯 고루 볶아 계란을 익혀줍니다.",
      imagePath: "https://cloudfront.haemukja.com/vh.php?url=https://d1hk7gw6lgygff.cloudfront.net/uploads/direction/image_file/58139/pad_thumb_0.JPG&convert=jpgmin&rt=600",
    );
  }
}
