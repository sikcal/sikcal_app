import 'package:flutter/material.dart';

class Button_Add_MyDiet extends StatelessWidget {
  void Function()? press;

  Button_Add_MyDiet({
    this.press,
    });


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          padding: EdgeInsets.all(10.0),
          minimumSize: Size(100, 50),
        ),
        child: Container(
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Icon(Icons.add,
                color: Colors.white,
                size: 25),
            Text('오늘의 식단에 추가하기',
              style: TextStyle(
                  color: Colors.white
              ))
          ],
        ),)

      ),
    );
  }
}