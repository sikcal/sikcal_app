import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/RoundedButton.dart';
import '../../components/RoundedText.dart';
import '../../components/mytextformfield.dart';
import '../../data/constants.dart';
import 'mypage_main_view.dart';

class MyPageUpdateView extends ConsumerStatefulWidget {
  const MyPageUpdateView({Key? key}) : super(key: key);

  @override
  _FormScreenStateWeight createState() => _FormScreenStateWeight();
}

class _FormScreenStateWeight extends ConsumerState<MyPageUpdateView> {
  final userweightcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('체중을 입력해주세요.', style: kLargeTextStyle),
            SizedBox(height: 50),
            Form(
              key: _formkey,
              child: MyTextFormField(
                obscureText: false,
                controller: userweightcontroller,
                label: '현재 체중을 입력해주세요',
                onSaved: (value) {
                  setState(() {});
                },
                validator: (value) {
                  if (value.length < 1) {
                    return '현재 체중은 필수사항입니다.';
                  }
                  if (!RegExp('[0-9]').hasMatch(value)) {
                    return '숫자를 입력해주세요';
                  }
                },
              ),
            ),
            SizedBox(height: 50),
            RoundedButton(
                text: '변경하기',
                color: const Color(0xff8BC34A),
                press: () {
                  final form = _formkey.currentState;
                  if (form != null && !form.validate()) {
                  } else {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MyPageMainView();
                        },
                      ),
                    );
                    return;
                  }
                }),
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