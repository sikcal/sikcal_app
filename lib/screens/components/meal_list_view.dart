import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/data/provider.dart';
import 'package:sikcal/model/meal.dart';
import 'package:sikcal/screens/home/search_menu_view.dart';

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
          background: Container(
            color: Colors.grey.shade400,
            height: double.infinity,
            padding: const EdgeInsets.only(left: 20),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Icon(FontAwesomeIcons.pen, color: Colors.white),
            ),
          ),
          secondaryBackground: Container(
            color: Colors.red.shade400,
            height: double.infinity,
            padding: const EdgeInsets.only(right: 20),
            child: const Align(
              alignment: Alignment.centerRight,
              child: Icon(FontAwesomeIcons.trash, color: Colors.white),
            ),
          ),
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.endToStart) {
              return showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('잠시만요!'),
                  content: const Text('정말 삭제하시겠어요?\n되돌릴 수 없습니다.'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: const Text(
                        '네!',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: Text(
                        '아니요!',
                        style: TextStyle(color: primaryColor),
                      ),
                    ),
                  ],
                ),
              );
            } else if (direction == DismissDirection.startToEnd) {
              Meal? meal = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchMenuView(
                    meal: mealList.elementAt(idx),
                  ),
                ),
              );
              if (meal != null) {
                mealList.removeAt(idx);
                mealList.insert(idx, meal);
                ref.read(currentMealListProvider.notifier).set([...mealList]);
              }
            }
            return Future.value(false);
          },
          dismissThresholds: const {
            DismissDirection.startToEnd: 0.5,
            DismissDirection.endToStart: 0.5,
          },
          onDismissed: (direction) async {
            if (direction == DismissDirection.endToStart) {
              mealList.removeAt(idx);
              ref.read(currentMealListProvider.notifier).set([...mealList]);
            }
          },
          child: ListTile(
            tileColor: (idx % 2 == 0) ? primaryColor.withOpacity(0.1) : Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    for (var food in meal.foodList.keys)
                      Row(
                        children: [
                          Text(
                            food.foodName,
                            style: kDefaultTextStyle.copyWith(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(FontAwesomeIcons.xmark, size: 13, color: accentColor),
                          Text(
                            meal.foodList[food].toString(),
                            style: kDefaultTextStyle.copyWith(
                              color: accentColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                  ],
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
          ),
        );
      },
    );
  }
}
