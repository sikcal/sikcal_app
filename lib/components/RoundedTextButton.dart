import 'package:flutter/material.dart';

class RoundedTextButton extends StatelessWidget {

  String? text;
  Color? color;
  void Function()? press;
  Size size;
  TextStyle? textStyle;

  RoundedTextButton({
    this.text,
    this.color,
    this.press,
    required this.size,
    this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: press,
        child: Text(text!),
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.all(10.0),
          textStyle: textStyle,
          minimumSize: size,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}