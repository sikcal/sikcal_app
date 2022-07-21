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
      margin: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: press,
        child: Text(text!),
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: const EdgeInsets.all(10.0),
          textStyle: const TextStyle(color: Colors.white),
          minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
        ),
      ),
    );
  }
}
