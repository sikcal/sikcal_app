import 'package:flutter/material.dart';

class InputUserActivityScreen extends StatelessWidget {
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
          child: Text('활동량이 어떻게 되나요?'),
        ),
        SizedBox(height: 50),
        Container(
          margin: EdgeInsets.all(5),
          child: ElevatedButton(
            onPressed: () {
              null;
            },
            child: Text('가벼운 활동'),
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
            child: Text('중증도 활동'),
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
            child: Text('강한 활동'),
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
            child: Text('아주 강한 활동'),
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
              null; //메인페이지로 이동
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