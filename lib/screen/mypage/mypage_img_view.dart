import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/RoundedTextButton.dart';
import '../../data/constants.dart';

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

    int _currentPage = 5;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Image(
              image: AssetImage('images/fork.png'),
              height: 25.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "식칼", // FIXME 화면 별로 title 변경
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Image(
              image: AssetImage('images/knife.png'),
              height: 25.0,
            ),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
        backgroundColor: primaryColor,
      ),
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
      bottomNavigationBar: BottomBar(
        itemPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
        backgroundColor: primaryColor,
        items: [
          BottomBarItem(
              icon: const Icon(
                Icons.feed,
                color: Colors.white,
              ),
              title: const Text("피드"),
              activeColor: Colors.white),
          BottomBarItem(
              icon: const Icon(
                Icons.chat_bubble_outline,
                color: Colors.white,
              ),
              title: const Text("그룹 채팅"),
              activeColor: Colors.white),
          BottomBarItem(
              icon: const Icon(
                Icons.home_outlined,
                size: 30.0,
                color: Colors.white,
              ),
              title: const Text("홈 화면"),
              activeColor: Colors.white),
          BottomBarItem(
              icon: const Icon(
                Icons.star_outline,
                size: 30.0,
                color: Colors.white,
              ),
              title: const Text("나의 식단"),
              activeColor: Colors.white),
          BottomBarItem(
              icon: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: const Text("마이페이지"),
              activeColor: Colors.white),
        ],
        onTap: (int value) {
          setState(() {
            _currentPage = value;
          });
        },
        selectedIndex: _currentPage,
      ),
    );
  }
}