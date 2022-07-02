import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  String? text;
  Color? color;
  void Function()? press;

  RoundedButton({
    this.text,
    this.color,
    this.press
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: press,
        child: Text(text!),
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.all(10.0),
          textStyle: TextStyle(color: Colors.white),
          minimumSize: Size(250, 50),
        ),
      ),
    );
  }
}