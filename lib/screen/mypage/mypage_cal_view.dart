import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/RoundedText.dart';

class MyPageCalView extends ConsumerStatefulWidget {
  const MyPageCalView({Key? key}) : super(key: key);

  @override
  ConsumerState<MyPageCalView> createState() => _MyPageCalView();
}

class _MyPageCalView extends ConsumerState<MyPageCalView> {

  @override
  Widget build(BuildContext context) {
    String userimg = "images/profile.jpg";
    String username ="김유진";

    return Scaffold(
      body:Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      userimg,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  SizedBox(width: 100),
                  Text(username,
                    style: TextStyle(
                      color: Color(0xff8BC34A),
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.0),
              RoundedText(
                text: "YEAR     2022",
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              RoundedText(
                text: "MONTH    07",
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
      ),
    );
  }
}