import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/model/meal.dart';

class MealListView extends StatelessWidget {
  List<Meal> mealList;

  MealListView({Key? key, required this.mealList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mealList.length,
      itemBuilder: (context, idx) {
        Meal meal = mealList.elementAt(idx);
        return Container(
          decoration: const BoxDecoration(
            border: Border.symmetric(horizontal: BorderSide()),
          ),
          child: ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    for (var food in meal.foodList.keys)
                      Row(
                        children: [
                          Text(
                            food.name,
                            style: defaultTextStyle.copyWith(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(FontAwesomeIcons.xmark,
                              size: 13, color: accentColor),
                          Text(
                            meal.foodList[food].toString(),
                            style: defaultTextStyle.copyWith(
                              color: accentColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                  ],
                ),
                Column(
                  children: [
                    // TOOD : slider로 바꾸는 게 더 이쁠듯
                    InkWell(
                      onTap: () {

                      },
                      child: const Icon(
                        FontAwesomeIcons.pen,
                        color: Colors.black54,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // TODO : share to community
                      },
                      child: const Icon(
                        FontAwesomeIcons.shareNodes,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
