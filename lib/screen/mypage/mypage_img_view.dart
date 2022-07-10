import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/RoundedTextButton.dart';

class MyPageImgView extends ConsumerStatefulWidget {
  const MyPageImgView({Key? key}) : super(key: key);

  @override
  ConsumerState<MyPageImgView> createState() => _MyPageImgView();
}

class _MyPageImgView extends ConsumerState<MyPageImgView> {

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
            RoundedTextButton(
              color: const Color(0xff8BC34A),
              text: "날짜로 사진 검색하기",
              textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              size: const Size(250, 50),
              press: (){},
            ),
            RoundedTextButton(
              color: const Color(0xff8BC34A),
              text: "사진 추가하기",
              textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              size: const Size(250, 50),
              press: (){},
            ),
          ],
        ),
      ),
    );
  }
}