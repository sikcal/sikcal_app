import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/data/provider.dart';
import 'package:sikcal/screens/loading_screen.dart';
import 'package:sikcal/screens/main_view.dart';

import '../../components/button_green.dart';

import 'package:sikcal/screen/InputUserInformation/input_start.dart';

class WelcomeScreen extends ConsumerStatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends ConsumerState<WelcomeScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(userRepoProvider).setUser().whenComplete(() {
      if (ref.read(userBasicProvider).username != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const MainView())); // TODO 뒤로가기 버튼 없애기
      }
    });
  }

  @override
  Widget build(context) {
    final userRepo = ref.watch(userRepoProvider);
    final user = ref.watch(userBasicProvider);
    final loadingState = ref.watch(loadingStateProvider.state);

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
          Container(
            child: const Text('건강하고 즐거운 식단관리'),
          ),
          const SizedBox(height: 25),
          Container(
            child: const Text('적절하고 건강한 양의 식단을 섭취하는데 도움을 드립니다.'),
          ),
          const SizedBox(height: 50),
          Button_Green(
              text: '구글 계정으로 시작하기',
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
          Button_Green(
              text: '계정이 이미 있어요',
              press: () {
                //계정이 이미 있는 경우 로그인후 바로 홈페이지로 이동
              }),
        ]),
      ),
    );
  }
}
