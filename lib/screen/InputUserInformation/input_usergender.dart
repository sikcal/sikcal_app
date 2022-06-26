import 'package:flutter/material.dart';

import '../../components/button_green.dart';
import '../../components/button_grey.dart';

import 'package:sikcal/screen/InputUserInformation/Input_username.dart';
import 'package:sikcal/screen/InputUserInformation/input_userheight.dart';


class InputUserGenderScreen extends StatefulWidget {
    _InputUserGenderScreen createState() => _InputUserGenderScreen();
}
class _InputUserGenderScreen extends State<InputUserGenderScreen> {

  String? usergender;
  List<Color> SelectedList =  [Colors.grey, Colors.grey];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: <Widget>[
        SizedBox(height: 200),
        Container(
          child: Text('성별을 선택해 주세요.'),
        ),
        SizedBox(height: 50),
        Button_Grey(
            text: '여자',
            press: () {
              usergender = '여자';
              changeButtonColor(0);
            },
            color: SelectedList[0]
        ),
        SizedBox(height: 25),
        Button_Grey(
            text: '남자',
            press: () {
              usergender = '남자';
              changeButtonColor(1);
            },
            color: SelectedList[1]
        ),
        SizedBox(height: 25),
        Button_Green(
            text: '다음',
            press: () {
              if (usergender == null) {

              }
              else {
                print(usergender);
                user.usergender = usergender;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return InputUserHeightScreen();
                    },
                  ),
                );
              }
            }
        ),
      ]
      ),
      ),
    );
  }
  void changeButtonColor(value){
    setState(() {
      for(int i = 0; i < SelectedList.length; i++) {
        if(i == value) {
          SelectedList[i] = Color(0xffff9800);
        }else {
          SelectedList[i] = Colors.grey;
        }
      }
    });
  }
}
