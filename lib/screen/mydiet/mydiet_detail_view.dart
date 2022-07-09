import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/button_add_mydiet.dart';
import '../../data/constants.dart';
import '../../model/diet.dart';
import 'check_upload_mydiet.dart';


class MyDietDetailView extends ConsumerStatefulWidget {
  late final Diet diet;
  MyDietDetailView({required this.diet});

  @override
  ConsumerState<MyDietDetailView> createState() => _MyDietDetailView();
}

class _MyDietDetailView extends ConsumerState<MyDietDetailView> {

  int _currentPage = 3; // 현재 페이지 (bottom nav bar 관련)

  @override
  Widget build(BuildContext context) {

    String diet_total_kcal = widget.diet.diet_total_kcal.toString();
    String diet_carbohydrate = widget.diet.diet_carbohydrate.toString();
    String diet_protein = widget.diet.diet_protein.toString();
    String diet_fat = widget.diet.diet_fat.toString();

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
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('images/'+widget.diet.diet_image, height: 250, width: 200),
              Text(widget.diet.diet_title),
              Text('총 $diet_total_kcal kcal 탄수화물 : $diet_carbohydrate, 단백질 : $diet_protein, 지방 : $diet_fat'),
              Button_Add_MyDiet(
                press: () {
                  Navigator.of(context).push(MaterialPageRoute<Null>(
                      fullscreenDialog: true,
                      builder: (BuildContext context) {
                        return CheckUploadMyDiet(
                          diet: widget.diet,
                        );
                      }
                  )
                  );
                },
              ),
              Text('식단 정보'),
              Text('영양 성분'),
              //TODO : 영양 성분 출력
              Text('준비 재료'),
              //TODO : 준비 재료 출력
              Text('조리 순서')
              //TODO : 조리 순서 출력
          ],
        ))

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