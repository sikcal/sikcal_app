import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/components/RoundedButton.dart';
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/screen/InputUserInformation/input_start.dart';
import 'package:sikcal/screen/InputUserInformation/input_userid.dart';

class InputUserActivityScreen extends ConsumerStatefulWidget {
  const InputUserActivityScreen({Key? key}) : super(key: key);

  @override
  _InputUserActivityScreen createState() => _InputUserActivityScreen();
}

class _InputUserActivityScreen extends ConsumerState<InputUserActivityScreen> {
  String? useractivity;
  List<Color> SelectedList = [Colors.grey, Colors.grey, Colors.grey, Colors.grey];

  @override
  void initState() {
    super.initState();
    useractivity = ref.read(registerInfoUserProvider).activity;
    if (useractivity == '가벼운 활동') changeButtonColor(0);
    if (useractivity == '중증도 활동') changeButtonColor(1);
    if (useractivity == '강한 활동') changeButtonColor(2);
    if (useractivity == '아주 강한 활동') changeButtonColor(3);
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
                  Text('평소 활동량을 선택해주세요.', style: kLargeTextStyle),
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
                ],
              ),
              Column(
                children: [
                  RoundedButton(
                    text: '다음',
                    color: Color(0xff8BC34A),
                    press: () {
                      if (useractivity == null) {
                      } else {
                        print(useractivity);
                        ref.read(registerInfoUserProvider).activity = useractivity;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const InputUserIdScreen()));
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
