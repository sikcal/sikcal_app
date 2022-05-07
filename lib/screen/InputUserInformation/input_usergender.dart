import 'package:flutter/material.dart';
import 'package:sikcal/screen/InputUserInformation/input_userheight.dart';

class InputUserGenderScreen extends StatelessWidget {
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
          child: Text('성별을 선택해 주세요.'),
        ),
        SizedBox(height: 50),
        Container(
          margin: EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: () {
              null;
            },
            child: Text('여자'),
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
            child: Text('남자'),
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
                    return InputUserHeightScreen();
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