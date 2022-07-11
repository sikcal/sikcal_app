import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sikcal/model/food.dart';
import 'package:sikcal/model/meal.dart';
import 'package:sikcal/screens/components/food_list_view.dart';

import '../../data/constants.dart';

class SearchMenuView extends StatefulWidget {
  SearchMenuView({Key? key, this.meal}) : super(key: key);

  Meal? meal;

  @override
  State<SearchMenuView> createState() => _SearchMenuViewState();
}

class _SearchMenuViewState extends State<SearchMenuView> {
  int _currentPage = 2;

  late Meal meal;

  @override
  void initState() {
    meal = widget.meal ?? Meal();
  }

  // TODO : 서버에서 받아오기
  List<Food> currentFoodList = [
    Food(
      hashId: 1,
      name: '햇반(CJ) 1팩 (200g)',
      carbohydrate: 67,
      protein: 5,
      fat: 1,
      totalKcal: 300,
    ),
    Food(
      hashId: 2,
      name: '햇반(햇반) 1팩 (210g)',
      carbohydrate: 70,
      protein: 5,
      fat: 1,
      totalKcal: 315,
    ),
    Food(
      hashId: 3,
      name: '햇반(오뚜기) 1인분 (200g)',
      carbohydrate: 68,
      protein: 5,
      fat: 1,
      totalKcal: 310,
    ),
    Food(
      hashId: 4,
      name: '닭 가슴살 (100g)당',
      carbohydrate: 1,
      protein: 31,
      fat: 4,
      totalKcal: 250,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeeeeee),
      appBar: AppBar(
        title: Row(
          children: const [
            Image(
              image: AssetImage('images/fork.png'),
              height: 25.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "식칼",
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Image(
              image: AssetImage('images/knife.png'),
              height: 25.0,
            ),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FoodListView(
                foodList: currentFoodList,
                onTap: (idx) {
                  setState(() {
                    meal.addFood(currentFoodList.elementAt(idx));
                  });
                  print(meal);
                },
              ),
            ), // TODO 서버에서 받아오기
            const Divider(thickness: 3),
            if (meal.foodList.keys.length > 0) ...[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: meal.foodList.keys.length,
                          itemBuilder: (context, idx) {
                            int count = meal.foodList[meal.foodList.keys.elementAt(idx)]!;

                            return ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '${meal.foodList.keys.elementAt(idx)}',
                                        style: defaultTextStyle.copyWith(
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        ' * $count',
                                        style: defaultTextStyle.copyWith(
                                          color: accentColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            meal.addFood(meal.foodList.keys.elementAt(idx));
                                          });
                                        },
                                        child: const Icon(FontAwesomeIcons.plus, size: 20),
                                      ),
                                      const SizedBox(width: 5),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            meal.subFood(meal.foodList.keys.elementAt(idx));
                                          });
                                        },
                                        child: const Icon(FontAwesomeIcons.minus, size: 20),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '총 ${meal.foodList.keys.elementAt(idx).getCalorie() * count}kcal',
                                  ),
                                  Text(
                                    '탄수화물 : ${meal.foodList.keys.elementAt(idx).carbohydrate * count}g',
                                  ),
                                  Text(
                                    '단백질 : ${meal.foodList.keys.elementAt(idx).protein * count}g',
                                  ),
                                  Text(
                                    '지방 : ${meal.foodList.keys.elementAt(idx).fat * count}g',
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, meal);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: accentColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '식단에 추가하기',
                                style: defaultTextStyle.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        itemPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
        backgroundColor: primaryColor,
        items: [
          BottomBarItem(
              icon: const Icon(
                Icons.feed,
                color: Colors.white,
              ),
              title: const Text("피드"),
              activeColor: Colors.white),
          BottomBarItem(
              icon: const Icon(
                Icons.chat_bubble_outline,
                color: Colors.white,
              ),
              title: const Text("그룹 채팅"),
              activeColor: Colors.white),
          BottomBarItem(
              icon: const Icon(
                Icons.home_outlined,
                size: 30.0,
                color: Colors.white,
              ),
              title: const Text("홈 화면"),
              activeColor: Colors.white),
          BottomBarItem(
              icon: const Icon(
                Icons.star_outline,
                size: 30.0,
                color: Colors.white,
              ),
              title: const Text("나의 식단"),
              activeColor: Colors.white),
          BottomBarItem(
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: const Text("마이페이지"),
              activeColor: Colors.white),
        ],
        onTap: (int value) {
          setState(() {
            _currentPage = value;
          });
        },
        selectedIndex: _currentPage,
      ),
    );
  }
}
