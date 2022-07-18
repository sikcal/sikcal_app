import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/components/RoundedButton.dart';
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/screen/InputUserInformation/input_start.dart';
import 'package:sikcal/screen/InputUserInformation/input_usergender.dart';

class InputUserGoalScreen extends ConsumerStatefulWidget {
  const InputUserGoalScreen({Key? key}) : super(key: key);

  @override
  _InputUserGoalScreen createState() => _InputUserGoalScreen();
}

class _InputUserGoalScreen extends ConsumerState<InputUserGoalScreen> {
  String? usergoal;
  List<Color> SelectedList = [Colors.grey, Colors.grey, Colors.grey];

  @override
  void initState() {
    super.initState();
    usergoal = ref.read(registerInfoUserProvider).goal;
    if (usergoal != null) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (usergoal == '현재 체중 유지하기') changeButtonColor(0); // TODO 서버 확인
        if (usergoal == '체중 감량하기') changeButtonColor(1);
        if (usergoal == '체중 상관없이 식단 관리하기') changeButtonColor(2);
      });
    }
  }

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
              '식칼',
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
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: [
                  const SizedBox(height: 100),
                  Text('식단을 관리하는 목표는 무엇인가요?', style: kLargeTextStyle),
                  const SizedBox(height: 50),
                  RoundedButton(
                    text: '현재 체중 유지하기',
                    color: SelectedList[0],
                    press: () {
                      usergoal = '현재 체중 유지하기';
                      changeButtonColor(0);
                    },
                  ),
                  const SizedBox(height: 25),
                  RoundedButton(
                    text: '체중 감량하기',
                    color: SelectedList[1],
                    press: () {
                      usergoal = '체중 감량하기';
                      changeButtonColor(1);
                    },
                  ),
                  const SizedBox(height: 25),
                  RoundedButton(
                    text: '체중 상관없이 식단 관리하기',
                    color: SelectedList[2],
                    press: () {
                      usergoal = '체중 상관없이 식단 관리하기';
                      changeButtonColor(2);
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  RoundedButton(
                    text: '다음',
                    color: const Color(0xff8BC34A),
                    press: () {
                      if (usergoal == null) {
                      } else {
                        print(usergoal);
                        ref.read(registerInfoUserProvider).goal = usergoal;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return InputUserGenderScreen();
                            },
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeButtonColor(value) {
    setState(() {
      for (int i = 0; i < SelectedList.length; i++) {
        if (i == value) {
          SelectedList[i] = const Color(0xffff9800);
        } else {
          SelectedList[i] = Colors.grey;
        }
      }
    });
  }
}
