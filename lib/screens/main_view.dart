import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:sikcal/components/circular_progress.dart';
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/screens/search_menu_view.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentPage = 2; // 현재 페이지 (bottom nav bar 관련)

  int gainedCarbohydrate = 50; // 현재 섭취한 탄, 단, 지
  int gainedProtein = 30;
  int gainedFat = 20;

  int maxCarbohydrate = 180; // 하루 권장 섭취 탄, 단, 지
  int maxProtein = 150;
  int maxFat = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: "appBar",
          child: Row(
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
        ),
        backgroundColor: primaryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 원형의 형태로 현재 섭취량 알려주는 위젯
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircularProgress(
                      data: gainedCarbohydrate,
                      progress_value: gainedCarbohydrate / maxCarbohydrate,
                      color: Colors.red),
                  CircularProgress(
                      data: gainedProtein,
                      progress_value: gainedProtein / maxProtein,
                      color: Colors.blue),
                  CircularProgress(
                      data: gainedFat,
                      progress_value: gainedFat / maxFat,
                      color: Colors.amber),
                ],
              ),

              const SizedBox(height: 20.0),

              // 현재 섭취량을 문자로 나타낸 공간
              Container(
                color: primaryColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "탄수화물",
                            style: defaultTextStyle.copyWith(color: Colors.red),
                          ),
                          Text(
                            "권장 섭취량",
                            style:
                                defaultTextStyle.copyWith(color: Colors.white),
                          ),
                          Text(
                            ": ${maxCarbohydrate}g",
                            style:
                                defaultTextStyle.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "단백질",
                            style: defaultTextStyle.copyWith(
                                color: Colors.blueAccent),
                          ),
                          Text(
                            "권장 섭취량",
                            style:
                                defaultTextStyle.copyWith(color: Colors.white),
                          ),
                          Text(
                            ": ${maxProtein}g",
                            style:
                                defaultTextStyle.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "지방",
                            style:
                                defaultTextStyle.copyWith(color: Colors.amber),
                          ),
                          Text(
                            "권장 섭취량",
                            style:
                                defaultTextStyle.copyWith(color: Colors.white),
                          ),
                          Text(
                            ": ${maxFat}g",
                            style:
                                defaultTextStyle.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10.0),

              Text(
                "현재 섭취 칼로리 : ${gainedCarbohydrate * 4 + gainedProtein * 4 + gainedFat * 9}kcal",
              ),
              Text(
                "목표 섭취 칼로리 : ${maxCarbohydrate * 4 + maxProtein * 4 + maxFat * 9}kcal",
              ),

              const SizedBox(height: 5.0),

              Divider(
                thickness: 1.5,
                color: primaryColor,
              ),

              const SizedBox(height: 10.0),

              Expanded(
                  child: ListView(
                // TODO : 식단 리스트 추가하기
                children: [],
              )),

              const SizedBox(height: 10.0),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {}, // TODO : 카메라 켜서 사진 찍는 라이브러리 추가
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 65.0,
                        color: primaryColor,
                      ),
                    ),
                    FloatingActionButton(
                      child: const Icon(FontAwesomeIcons.plus),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchMenuView()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        itemPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
        backgroundColor: primaryColor,
        items: [
          BottomBarItem(
              icon: Icon(
                Icons.feed,
                color: Colors.white,
              ),
              title: Text("피드"),
              activeColor: Colors.white),
          BottomBarItem(
              icon: Icon(
                Icons.chat_bubble_outline,
                color: Colors.white,
              ),
              title: Text("그룹 채팅"),
              activeColor: Colors.white),
          BottomBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 30.0,
                color: Colors.white,
              ),
              title: Text("홈 화면"),
              activeColor: Colors.white),
          BottomBarItem(
              icon: Icon(
                Icons.star_outline,
                size: 30.0,
                color: Colors.white,
              ),
              title: Text("나의 식단"),
              activeColor: Colors.white),
          BottomBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text("마이페이지"),
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
