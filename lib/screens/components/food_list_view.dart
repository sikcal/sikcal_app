import 'package:flutter/material.dart';
import 'package:sikcal/model/food.dart';

class FoodListView extends StatelessWidget {
  List<Food> foodList;
  Function? onTap;

  FoodListView({Key? key, required this.foodList, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foodList.length,
      itemBuilder: (context, idx) {
        int kcal = 0;
        kcal += foodList.elementAt(idx).carbohydrate * 4;
        kcal += foodList.elementAt(idx).protein * 4;
        kcal += foodList.elementAt(idx).fat * 9;

        return GestureDetector(
          onTap: () {
            if (onTap != null) onTap!(idx);
          },
          child: Container(
            color: (idx % 2 == 0) ? Colors.black12 : Colors.white,
            padding: const EdgeInsets.all(3.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${foodList.elementAt(idx).name} - ${kcal}kcal'),
                Text('탄수화물 : ${foodList.elementAt(idx).carbohydrate}'),
                Text('단백질 : ${foodList.elementAt(idx).protein}'),
                Text('지방 : ${foodList.elementAt(idx).fat}'),
              ],
            ),
          ),
        );
        return ListTile(
          title: Text('${foodList.elementAt(idx).name} - ${kcal}kcal'),
          subtitle: Column(
            children: [
              Text('탄수화물 : ${foodList.elementAt(idx).carbohydrate}'),
              Text('단백질 : ${foodList.elementAt(idx).protein}'),
              Text('지방 : ${foodList.elementAt(idx).fat}'),
            ],
          ),
        );
      },
    );
  }
}
