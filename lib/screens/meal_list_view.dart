import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/data/provider.dart';
import 'package:sikcal/model/meal.dart';
import 'package:sikcal/screens/search_menu_view.dart';

class MealListView extends ConsumerWidget {
  List<Meal> mealList;

  MealListView({Key? key, required this.mealList}) : super(key: key);

  @override
  Widget build(context, ref) {
    return ListView.builder(
      itemCount: mealList.length,
      itemBuilder: (context, idx) {
        Meal meal = mealList.elementAt(idx);
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            // TODO : 삭제 할지 묻는 거 필요
            mealList.removeAt(idx);
            ref.read(currentMealListProvider.notifier).set([...mealList]);
          },
          child: ListTile(
            tileColor: (idx % 2 == 0) ? primaryColor.withOpacity(0.1): Colors.white,
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
                    InkWell(
                      onTap: () async {
                        Meal? meal = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchMenuView(
                                      meal: mealList.elementAt(idx),
                                    )));
                        if (meal != null) {
                          mealList.removeAt(idx);
                          mealList.insert(idx, meal);
                          ref.read(currentMealListProvider.notifier).set([...mealList]);
                        }
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
