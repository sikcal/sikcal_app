import 'package:flutter/material.dart';
import 'package:sikcal/screen/InputUserInformation/input_usergender.dart';

class InputUserGoalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: <Widget>[
        SizedBox(height: 200),
        Container(
          child: Text('식단을 관리하는 목표는 무엇인가요?'),
        ),
        SizedBox(height: 50),
        Container(
          margin: EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: () {
              null;
            },
            child: Text('현재 체중 유지하기'),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey,
              padding: EdgeInsets.all(10.0),
              textStyle: TextStyle(color: Colors.white),
              minimumSize: Size(250, 50),
            ),
          ),
        ),
        SizedBox(height: 25),
        Container(
          margin: EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: () {
              null;
            },
            child: Text('체중 감량하기'),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey,
              padding: EdgeInsets.all(10.0),
              textStyle: TextStyle(color: Colors.white),
              minimumSize: Size(250, 50),
            ),
          ),
        ),
        SizedBox(height: 25),
        Container(
          margin: EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: () {
              null;
            },
            child: Text('체중 상관없이 식단 관리하기'),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey,
              padding: EdgeInsets.all(10.0),
              textStyle: TextStyle(color: Colors.white),
              minimumSize: Size(250, 50),
            ),
          ),
        ),
        SizedBox(height: 25),
        Container(
          margin: EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return InputUserGenderScreen();
                  },
                ),
              );
            },
            child: Text('다음'),
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              padding: EdgeInsets.all(10.0),
              textStyle: TextStyle(color: Colors.white),
              minimumSize: Size(250, 50),
            ),
          ),
        ),
      ]
      ),
      ),
    );
  }
}