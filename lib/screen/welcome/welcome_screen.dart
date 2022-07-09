import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/data/provider.dart';
import 'package:sikcal/screens/loading_screen.dart';
import 'package:sikcal/screens/main_view.dart';

import '../../components/RoundedButton.dart';

import 'package:sikcal/screen/InputUserInformation/input_start.dart';

import '../login/login.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(userRepoProvider).getUser().then((user) {
      if (user.username != null) {
        ref.read(userBasicProvider.notifier).setUser(user);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const MainView())); // TODO 뒤로가기 버튼 없애기
      }
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          const SizedBox(height: 100),
          const Icon(
            Icons.restaurant,
            color: Colors.grey,
            size: 200,
          ),
          const SizedBox(height: 50),
          const Text('건강하고 즐거운 식단관리'),
          const SizedBox(height: 25),
          const Text('적절하고 건강한 양의 식단을 섭취하는데 도움을 드립니다.'),
          const SizedBox(height: 50),
          RoundedButton(
              text: '시작하기',
              color: const Color(0xff8BC34A),
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return InputStartScreen();
                    },
                  ),
                );
              }),
          RoundedButton(
              text: '계정이 이미 있어요',
              color: const Color(0xff8BC34A),
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              }),
        ]),
      ),
    );
  }
}
