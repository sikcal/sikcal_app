import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../data/constants.dart';

class SearchMenuView extends StatefulWidget {
  const SearchMenuView({Key? key}) : super(key: key);

  @override
  State<SearchMenuView> createState() => _SearchMenuViewState();
}

class _SearchMenuViewState extends State<SearchMenuView> {
  int _currentPage = 2;

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(
        itemPadding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
        backgroundColor: primaryColor,
        items: [
          BottomBarItem(
              icon: Icon(
                Icons.feed,
                color: Colors.white,
              ),
              title: Text("피드"),
              activeColor: Colors.white),
          BottomBarItem(
              icon: Icon(
                Icons.chat_bubble_outline,
                color: Colors.white,
              ),
              title: Text("그룹 채팅"),
              activeColor: Colors.white),
          BottomBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 30.0,
                color: Colors.white,
              ),
              title: Text("홈 화면"),
              activeColor: Colors.white),
          BottomBarItem(
              icon: Icon(
                Icons.star_outline,
                size: 30.0,
                color: Colors.white,
              ),
              title: Text("나의 식단"),
              activeColor: Colors.white),
          BottomBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: Text("마이페이지"),
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
