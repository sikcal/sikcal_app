import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/components/RoundedButton.dart';
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/screen/InputUserInformation/input_start.dart';
import 'package:sikcal/screen/InputUserInformation/input_userheight.dart';

class InputUserGenderScreen extends ConsumerStatefulWidget {
  const InputUserGenderScreen({Key? key}) : super(key: key);

  @override
  _InputUserGenderScreen createState() => _InputUserGenderScreen();
}

class _InputUserGenderScreen extends ConsumerState<InputUserGenderScreen> {
  String? usergender;
  List<Color> SelectedList = [Colors.grey, Colors.grey];

  @override
  void initState() {
    super.initState();
    usergender = ref.read(registerInfoUserProvider).sex;
    if (usergender == '여자') changeButtonColor(0);
    if (usergender == '남자') changeButtonColor(1);
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
                  Text('성별을 선택해 주세요.', style: kLargeTextStyle),
                  const SizedBox(height: 50),
                  RoundedButton(
                    text: '여자',
                    color: SelectedList[0],
                    press: () {
                      usergender = '여자';
                      changeButtonColor(0);
                    },
                  ),
                  const SizedBox(height: 25),
                  RoundedButton(
                    text: '남자',
                    color: SelectedList[1],
                    press: () {
                      usergender = '남자';
                      changeButtonColor(1);
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
                      if (usergender == null) {
                      } else {
                        print(usergender);
                        ref.read(registerInfoUserProvider).sex = usergender;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return InputUserHeightScreen();
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
