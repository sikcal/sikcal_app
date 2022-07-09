import 'package:flutter/material.dart';
import 'package:sikcal/screens/main_view.dart';

import '../../components/RoundedButton.dart';

import 'package:sikcal/screen/InputUserInformation/Input_username.dart';


class InputUserActivityScreen extends StatefulWidget {
  const InputUserActivityScreen({Key? key}) : super(key: key);

  @override
  _InputUserActivityScreen createState() => _InputUserActivityScreen();
}

class _InputUserActivityScreen extends State<InputUserActivityScreen> {

  String? useractivity;
  List<Color> SelectedList =  [Colors.grey, Colors.grey, Colors.grey, Colors.grey];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: <Widget>[
        const SizedBox(height: 200),
        const Text('활동량이 어떻게 되나요?'),
        const SizedBox(height: 50),
        RoundedButton(
            text: '가벼운 활동',
            color: SelectedList[0],
            press: () {
              useractivity = '가벼운 활동';
              changeButtonColor(0);
            },
        ),
        const SizedBox(height: 25),
        RoundedButton(
            text: '중증도 활동',
            color: SelectedList[1],
            press: () {
              useractivity = '중증도 활동';
              changeButtonColor(1);
            },
        ),
        const SizedBox(height: 25),
        RoundedButton(
            text: '강한 활동',
            color: SelectedList[2],
            press: () {
              useractivity = '강한 활동';
              changeButtonColor(2);
            },
        ),
        const SizedBox(height: 25),
        RoundedButton(
            text: '아주 강한 활동',
            color: SelectedList[3],
            press: () {
              useractivity = '아주 강한 활동';
              changeButtonColor(3);
            },
        ),
        const SizedBox(height: 25),
        RoundedButton(
            text: '다음',
            color: Color(0xff8BC34A),
            press: () {
              if (useractivity == null) {

              }
              else {
                print(useractivity);
                user.useractivity = useractivity;
                print('username : ${user.username}, userbirth : ${user
                    .userbirth}, usergoal :${user.usergoal}, '
                    'usergender : ${user.usergender}, userheight: ${user
                    .userheight}, userweight : ${user.userweight}, useractivity: ${user.useractivity}');
                null; //메인페이지로 이동
              }
            }
        )
      ]
      ),
      ),
    );
  }
  void changeButtonColor(value){
    setState(() {
      for(int i = 0; i < SelectedList.length; i++) {
        if(i == value) {
          SelectedList[i] = const Color(0xffff9800);
        }else {
          SelectedList[i] = Colors.grey;
        }
      }
    });
  }
}
