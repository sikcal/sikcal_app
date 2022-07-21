import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/constants.dart';
import '../../data/providers.dart';
import '../../model/diet.dart';
import '../../components/box_slider.dart';

import 'package:http/http.dart' as http;

class MyDietMainView extends ConsumerStatefulWidget {
  const MyDietMainView({Key? key}) : super(key: key);

  @override
  ConsumerState<MyDietMainView> createState() => _MyDietMainView();
}

class _MyDietMainView extends ConsumerState<MyDietMainView> {

  //즐겨 찾기한 식단
  //dummy data
  //TODO : DB 연결
  List<Diet> diets = [
    Diet.fromMap({
          'member_id' : 0,
          'totalkcal' : 000,
          'menu' : '토마토계란볶음',
          'requiredfood' : "00",
          'recipe' : "00",
          'pictureuri' : "tomatoegg.jpg"
    }),
    Diet.fromMap({
      'member_id' : 0,
      'totalkcal' : 123,
      'menu' : '토마토계란볶음',
      'requiredfood' : "l",
      'recipe' : "re",
      'pictureuri' : "tomatoegg.jpg"
    }),
    Diet.fromMap({
      'member_id' : 0,
      'totalkcal' : 123,
      'menu' : '토마토계란볶음',
      'requiredfood' : "l",
      'recipe' : "re",
      'pictureuri' : "tomatoegg.jpg"
    })
  ];

  //추천 식단_채식 주의
  //dummy data
  List<Diet> recomend_diets_planA = [
    Diet.fromMap({
      'member_id' : 0,
      'totalkcal' : 123,
      'menu' : '건강한 샐러드 무침',
      'requiredfood' : "00",
      'recipe' : "00",
      'pictureuri' : "vegeD.jpg"
    }),
    Diet.fromMap({
      'member_id' : 0,
      'totalkcal' : 123,
      'menu' : '스크램블 샐러드',
      'requiredfood' : "00",
      'recipe' : "00",
      'pictureuri' : "vegeE.jpg"
    }),
    Diet.fromMap({
      'member_id' : 0,
      'totalkcal' : 123,
      'menu' : '아보카도 샐러드',
      'requiredfood' : "00",
      'recipe' : "00",
      'pictureuri' : "vegeA.jpg"
    })
  ];

  //추천 식단_단백질 건강 식단
  //dummy data
  List<Diet> recomend_diets_planB = [
    Diet.fromMap({
      'member_id' : 0,
      'totalkcal' : 123,
      'menu' : '단백질 고등어 조림',
      'requiredfood' : "00",
      'recipe' : "00",
      'pictureuri' : "pdiet1.jpg"
    }),
    Diet.fromMap({
      'member_id' : 0,
      'totalkcal' : 00,
      'menu' : '갈치 구이',
      'requiredfood' : "00",
      'recipe' : "00",
      'pictureuri' : "pdiet_2.jpg"
    }),
    Diet.fromMap({
      'member_id' : 0,
      'totalkcal' : 00,
      'menu' : '닭가슴살 볶음',
      'requiredfood' : "00",
      'recipe' : "00",
      'pictureuri' : "pdiet_3.jpg"
    })
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              const Text('식단 즐겨찾기',
                  style: TextStyle(
                    color: Color(0xff41631A),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  )),
              Expanded(
                flex: 1,
                child: BoxSlider(diets: diets),
              ),
              const Text('추천 식단',
                  style: TextStyle(
                    color: Color(0xff41631A),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  )),
              const Text('채식주의 식단',
                  style: TextStyle(
                    color: Color(0xff41631A),
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  )),
              Expanded(
                  flex: 1,
                  child: BoxSlider(diets: recomend_diets_planA),
              ),
              const Text('단백질 건강 식단',
                  style: TextStyle(
                    color: Color(0xff41631A),
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  )),
              Expanded(
                  flex: 1,
                  child: BoxSlider(diets: recomend_diets_planB),
              ),
            ]
        ),
      ),
    );
  }
}