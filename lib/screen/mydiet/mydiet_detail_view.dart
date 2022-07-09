import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/button_add_mydiet.dart';
import '../../model/diet.dart';
import 'check_upload_mydiet.dart';


class MyDietDetailView extends ConsumerStatefulWidget {
  late final Diet diet;
  MyDietDetailView({required this.diet});

  @override
  ConsumerState<MyDietDetailView> createState() => _MyDietDetailView();
}

class _MyDietDetailView extends ConsumerState<MyDietDetailView> {

  @override
  Widget build(BuildContext context) {

    String diet_total_kcal = widget.diet.diet_total_kcal.toString();
    String diet_carbohydrate = widget.diet.diet_carbohydrate.toString();
    String diet_protein = widget.diet.diet_protein.toString();
    String diet_fat = widget.diet.diet_fat.toString();

    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(8.0),
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/'+widget.diet.diet_image, height: 250, width: 200),
                  Text(widget.diet.diet_title,
                      style: TextStyle(color: Colors.black)
                  ),
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
      )
    );
  }
}