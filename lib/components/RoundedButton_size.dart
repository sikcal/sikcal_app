import 'package:flutter/material.dart';

class Button_Grey_Size extends StatelessWidget {

  String? text;
  void Function()? press;
  Color? color;


  Button_Grey_Size({
    this.text,
    this.press,
    this.color
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
          minimumSize: Size(50, 50),
        ),
        // style : ButtonStyle(
        //   padding: MaterialStateProperty.all(const EdgeInsets.all(10.0)),
        //   minimumSize: MaterialStateProperty.all(const Size(250, 50)),
        //   foregroundColor: MaterialStateProperty.all(Colors.white),
        //   // backgroundColor: MaterialStateProperty.resolveWith(
        //   //   (states) {
        //   //     if(states.contains(MaterialState.pressed)) {
        //   //       return Colors.blue;
        //   //     }else {
        //   //       return Colors.grey;
        //   //     }
        //   // })
        // ),
      ),
    );
  }
}