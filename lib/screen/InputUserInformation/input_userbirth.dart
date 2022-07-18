import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:sikcal/components/RoundedButton.dart';
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/screen/InputUserInformation/input_start.dart';
import 'package:sikcal/screen/InputUserInformation/input_usergoal.dart';

class InputUserBirthScreen extends StatelessWidget {
  const InputUserBirthScreen({Key? key}) : super(key: key);

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
      body: Body(),
    );
  }
}

class Body extends ConsumerStatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Screen createState() => Screen();
}

class Screen extends ConsumerState<Body> {
  late DateTime _selectedDate;

  @override
  void initState(){
    super.initState();
    _selectedDate = ref.read(registerInfoUserProvider).birth ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: [
                  const SizedBox(height: 100),
                  Text('생일이 언제인가요?', style: kLargeTextStyle),
                  const SizedBox(height: 25),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 48),
                  ),
                  SizedBox(
                    height: 250,
                    child: ScrollDatePicker(
                      selectedDate: _selectedDate,
                      // locale: DatePickerLocale.koKR,
                      onDateTimeChanged: (DateTime value) {
                        setState(() {
                          _selectedDate = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  RoundedButton(
                      text: '다음',
                      color: const Color(0xff8BC34A),
                      press: () {
                        print(_selectedDate);
                        ref.read(registerInfoUserProvider).birth = _selectedDate;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return InputUserGoalScreen();
                            },
                          ),
                        );
                      }),
                  const SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
