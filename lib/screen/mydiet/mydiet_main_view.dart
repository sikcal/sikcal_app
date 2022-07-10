import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/constants.dart';
import '../../model/diet.dart';
import '../../components/box_slider.dart';

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
          'diet_image' : 'tomatoegg.jpg',
          'diet_title' : '토마토계란볶음',
          'diet_protein' : 0,
          'diet_carbohydrate' : 0,
          'diet_fat' : 0,
          'diet_total_kcal' : 0
    }),
    Diet.fromMap({
      'diet_image' : 'dietfood.jpg',
      'diet_title' : '샐러두',
      'diet_protein' : 0,
      'diet_carbohydrate' : 0,
      'diet_fat' : 0,
      'diet_total_kcal' : 0
    }),
    Diet.fromMap({
      'diet_image' : 'dietfood2.jpg',
      'diet_title' : '당근당근당근',
      'diet_protein' : 0,
      'diet_carbohydrate' : 0,
      'diet_fat' : 0,
      'diet_total_kcal' : 0
    })
  ];

  //추천 식단_채식 주의
  //dummy data
  //TODO : DB 연결
  List<Diet> recomend_diets_planA = [
    Diet.fromMap({
      'diet_image' : 'tomatoegg.jpg',
      'diet_title' : '토마토계란볶음',
      'diet_protein' : 0,
      'diet_carbohydrate' : 0,
      'diet_fat' : 0,
      'diet_total_kcal' : 0
    }),
    Diet.fromMap({
      'diet_image' : 'dietfood.jpg',
      'diet_title' : '샐러두',
      'diet_protein' : 0,
      'diet_carbohydrate' : 0,
      'diet_fat' : 0,
      'diet_total_kcal' : 0
    }),
    Diet.fromMap({
      'diet_image' : 'dietfood2.jpg',
      'diet_title' : '당근당근당근',
      'diet_protein' : 0,
      'diet_carbohydrate' : 0,
      'diet_fat' : 0,
      'diet_total_kcal' : 0
    })
  ];

  //추천 식단_단백질 건강 식단
  //dummy data
  //TODO : DB 연결
  List<Diet> recomend_diets_planB = [
    Diet.fromMap({
      'diet_image' : 'tomatoegg.jpg',
      'diet_title' : '토마토계란볶음',
      'diet_protein' : 0,
      'diet_carbohydrate' : 0,
      'diet_fat' : 0,
      'diet_total_kcal' : 0
    }),
    Diet.fromMap({
      'diet_image' : 'dietfood.jpg',
      'diet_title' : '샐러두',
      'diet_protein' : 0,
      'diet_carbohydrate' : 0,
      'diet_fat' : 0,
      'diet_total_kcal' : 0
    }),
    Diet.fromMap({
      'diet_image' : 'dietfood2.jpg',
      'diet_title' : '당근당근당근',
      'diet_protein' : 0,
      'diet_carbohydrate' : 0,
      'diet_fat' : 0,
      'diet_total_kcal' : 0
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
              SizedBox(height: 10),
              const Text('식단 즐겨찾기',
                  style: TextStyle(
                    color: Color(0xff41631A),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  )),
              SizedBox(height: 5),
              BoxSlider(diets: diets),
              const Text('추천 식단',
                  style: TextStyle(
                    color: Color(0xff41631A),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  )),
              SizedBox(height: 5),
              const Text('채식주의 식단',
                  style: TextStyle(
                    color: Color(0xff41631A),
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  )),
              SizedBox(height: 5),
              BoxSlider(diets: recomend_diets_planA),
              SizedBox(height: 5),
              const Text('단백질 건강 식단',
                  style: TextStyle(
                    color: Color(0xff41631A),
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  )),
              SizedBox(height: 5),
              BoxSlider(diets: recomend_diets_planB),
            ]
        ),
      ),
    );
  }
}