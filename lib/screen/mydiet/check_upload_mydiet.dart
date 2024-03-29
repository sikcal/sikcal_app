import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/components/RoundedButton.dart';
import 'package:sikcal/components/RoundedButton_size.dart';
import 'package:sikcal/components/CheckboxWithText.dart';
import '../../components/button_add_mydiet.dart';
import '../../data/constants.dart';
import '../../model/diet.dart';
import '../../screens/feed/feed_view.dart';
import '../../screens/home/home_view.dart';
import '../mypage/mypage_main_view.dart';
import 'mydiet_main_view.dart';


class CheckUploadMyDiet extends ConsumerStatefulWidget {
  late final Diet diet;
  CheckUploadMyDiet({required this.diet});

  @override
  ConsumerState<CheckUploadMyDiet> createState() => _CheckUploadMyDiet();
}

class _CheckUploadMyDiet extends ConsumerState<CheckUploadMyDiet> {

  List<Color> SelectedList =  [Color(0xff8BC34A), Color(0xff8BC34A), Color(0xff8BC34A)];
  List DietIngredients = ['토마토', '계란', '마늘', '닭가슴살', '청양고추'];

  String? MealTime;

  int _currentPage = 3; // 현재 페이지 (bottom nav bar 관련)


  List _isSelected = [false, false, false];


  List<Widget> pages = [
    FeedView(),
    Container(),
    const HomeView(),
    const MyDietMainView(),
    const MyPageMainView(),
  ];

  @override
  Widget build(BuildContext context) {

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
      body : Container(
          padding: EdgeInsets.all(8.0),
          child: Center(
              child: Column(
                children: [
                  SizedBox(height: 50),
                  const Text("제외하고 싶은 식단 성분이 있나요?\n자유롭게 선택해 주세요!",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xff41631A),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height:8),
                  Column(
                    children: [
                      CheckboxWithText(
                        label: '제외성분1',
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        value: _isSelected[0],
                        onChanged: (bool newValue) {
                          setState(() {
                            _isSelected[0] = newValue;
                          });
                        },
                      ),
                      CheckboxWithText(
                        label: '제외성분2',
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        value: _isSelected[1],
                        onChanged: (bool newValue) {
                          setState(() {
                            _isSelected[1] = newValue;
                          });
                        },
                      ),
                      CheckboxWithText(
                        label: '제외성분3',
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        value: _isSelected[2],
                        onChanged: (bool newValue) {
                          setState(() {
                            _isSelected[2] = newValue;
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 50), //제외할 식단 성분 선택하는 부분 들어갈 곳
                  const Text("어느끼니로 추가할까요?",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xff41631A),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                      children: [
                        Container(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Button_Grey_Size(
                                  text: '아침',
                                  color: SelectedList[0],
                                  press: () {
                                    MealTime = '아침';
                                    changeButtonColor(0);
                                  },
                                ),
                                Button_Grey_Size(
                                  text: '점심',
                                  color: SelectedList[1],
                                  press: () {
                                    MealTime = '점심';
                                    changeButtonColor(1);
                                  },
                                ),
                                Button_Grey_Size(
                                  text: '저녁',
                                  color: SelectedList[2],
                                  press: () {
                                    MealTime = '저녁';
                                    changeButtonColor(2);
                                  },
                                ),
                              ],
                            )
                        ),
                        Button_Add_MyDiet(
                          press: () {
                            popDialog(context);
                          },
                        ),
                      ]
                  )
                ],
              ))
      ),
    );
  }
  void changeButtonColor(value){
    setState(() {
      for(int i = 0; i < SelectedList.length; i++) {
        if(i == value) {
          SelectedList[i] = Color(0xffff9800);
        }else {
          SelectedList[i] = Color(0xff8BC34A);
        }
      }
    });
  }
  popDialog(BuildContext context) {
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Text(
                  "이 식단을 오늘의 식단에\n 추가하겠습니까?",
                ),
              ],
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: new Text("예"),
                    onPressed: () {
                      //DB에 정보 업로드 후 페이지 이동
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: new Text("아니오"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
          );
        });
  }
}