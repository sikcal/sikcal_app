import 'package:flutter/material.dart';

class RoundedText extends StatelessWidget {

  String? text;
  TextStyle? textStyle;

  RoundedText({
    this.text,
    this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 45,
      decoration: BoxDecoration(
          color: Color(0xff8BC34A),
          borderRadius: BorderRadius.circular(30.0)
      ),
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.all(5),
      child: Center(
        child: Text(text!,
            style: textStyle),
      )
    );
  }
}