import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/constants.dart';
import '../../model/diet.dart';
import '../../widget/box_slider.dart';

class MyDietMainView extends ConsumerStatefulWidget {
  const MyDietMainView({Key? key}) : super(key: key);

  @override
  ConsumerState<MyDietMainView> createState() => _MyDietMainView();
}

class _MyDietMainView extends ConsumerState<MyDietMainView> {

  int _currentPage = 2; // 현재 페이지 (bottom nav bar 관련)

  List<Diet> diets = [
    Diet.fromMap({
          'diet_image' : 'tomato.jpg',
          'diet_title' : '토마토계란볶음',
          'diet_protein' : 0,
          'diet_carbohydrate' : 0,
          'diet_fat' : 0,
          'diet_total_kcal' : 0
    })
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center( child : Row(
          children: const [
            Image(
              image: AssetImage('images/fork.png'),
              height: 25.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "나의 식단",
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
        ),),
        backgroundColor: primaryColor,
      ),
      body: Column(children: <Widget> [
        SizedBox(height: 50),
        BoxSlider(diets: diets),
        SizedBox(height: 50),
        Container()
      ])
      ,
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