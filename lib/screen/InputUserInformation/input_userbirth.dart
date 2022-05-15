import 'package:flutter/material.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

import '../../components/button_green.dart';

import 'package:sikcal/screen/InputUserInformation/Input_username.dart';
import 'package:sikcal/screen/InputUserInformation/input_usergoal.dart';


class InputUserBirthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  Screen createState() => Screen();
}

class Screen extends State<Body>{
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: <Widget>[
        SizedBox(height: 200),
        Container(
          child: Text('생일이 언제인가요?'),
        ),
        SizedBox(height: 25),
        Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 48),
            ),
            SizedBox(
              height: 250,
              child: ScrollDatePicker(
                selectedDate: _selectedDate,
                locale: DatePickerLocale.koKR,
                onDateTimeChanged: (DateTime value) {
                  setState(() {
                    _selectedDate = value;
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 25),
        Button_Green(
            text: '다음',
            press: () {
              print(_selectedDate);
              user.userbirth = _selectedDate;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return InputUserGoalScreen();
                  },
                ),
              );
            }
        ),
      ]
      ),
      ),
    );
  }
}


