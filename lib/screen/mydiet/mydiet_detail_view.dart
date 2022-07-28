import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/button_add_mydiet.dart';
import '../../data/constants.dart';
import '../../model/diet.dart';
import '../../screens/feed/feed_view.dart';
import '../../screens/home/home_view.dart';
import '../mypage/mypage_main_view.dart';
import 'check_upload_mydiet.dart';
import 'mydiet_main_view.dart';


class MyDietDetailView extends ConsumerStatefulWidget {
  late final Diet diet;
  MyDietDetailView({required this.diet});

  @override
  ConsumerState<MyDietDetailView> createState() => _MyDietDetailView();
}

class _MyDietDetailView extends ConsumerState<MyDietDetailView> {

  int _currentPage = 3; // 현재 페이지 (bottom nav bar 관련)

  List<Widget> pages = [
    FeedView(),
    Container(),
    const HomeView(),
    const MyDietMainView(),
    const MyPageMainView(),
  ];

  @override
  Widget build(BuildContext context) {

    String diet_total_kcal = widget.diet.totalkcal.toString();
    // String diet_carbohydrate = widget.diet.diet_carbohydrate.toString();
    // String diet_protein = widget.diet.diet_protein.toString();
    // String diet_fat = widget.diet.diet_fat.toString();

    return Scaffold(
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
                "식칼", // FIXME 화면 별로 title 변경
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
      body: Container(
          padding: EdgeInsets.all(8.0),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/'+widget.diet.pictureuri, height: 250, width: 200),
                  Text(widget.diet.menu,
                      style: TextStyle(color: Colors.black)
                  ),
                  // Text('총 $diet_total_kcal kcal 탄수화물 : $diet_carbohydrate, 단백질 : $diet_protein, 지방 : $diet_fat'),
                  Text('총 $diet_total_kcal kcal 탄수화물'),
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
    );
  }
}