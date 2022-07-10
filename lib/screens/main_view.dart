import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/screen/mypage/mypage_main_view.dart';
import 'package:sikcal/screen/mydiet/mydiet_main_view.dart';
import 'package:sikcal/screens/home/home_view.dart';

class MainView extends ConsumerStatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  ConsumerState<MainView> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  int _currentPage = 2; // 현재 페이지 (bottom nav bar 관련)

  List<Widget> pages = [
    Container(),
    Container(),
    const HomeView(),
    const MyDietMainView(),
    const MyPageMainView(),
  ];

  @override
  Widget build(BuildContext context) {

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
              "식칼",
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
      body: pages.elementAt(_currentPage),
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

class _BottomPopup extends StatelessWidget {
  const _BottomPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () async {
                final image =
                    await _picker.pickImage(source: ImageSource.gallery);
                // TODO image 다른 화면으로 보내기
                Navigator.pop(context);
              },
              child: Text(
                '갤러리에서 눈바디 사진 찾기',
                style: defaultTextStyle,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 5),
            TextButton(
              onPressed: () async {
                final image =
                    await _picker.pickImage(source: ImageSource.camera);
                // TODO image 다른 화면으로 보내기
                Navigator.pop(context);
              },
              child: Text(
                '카메라로 촬영하기',
                style: defaultTextStyle,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
