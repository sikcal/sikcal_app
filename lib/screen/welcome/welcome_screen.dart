import 'package:flutter/material.dart';
import 'package:sikcal/components/RoundedButton.dart';
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/screen/InputUserInformation/input_start.dart';
import 'package:sikcal/screen/login/login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 100),
                  const Icon(
                    Icons.restaurant,
                    color: Colors.grey,
                    size: 200,
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Hero(tag: 'title1', child: Text('식', style: kTitleTextStyle.copyWith(color: primaryColor))),
                      Text('단을 ', style: kLargeTextStyle),
                      Hero(tag: 'title2', child: Text('칼', style: kTitleTextStyle.copyWith(color: primaryColor))),
                      Text('같이 ', style: kLargeTextStyle),
                    ],
                  ),
                  const SizedBox(height: 45),
                  Text('건강하고 즐거운 식단관리', style: kLargeTextStyle),
                  const SizedBox(height: 15),
                  Text('적절하고 건강한 식단 관리에 도움을 드립니다.', style: kLargeTextStyle),
                ],
              ),
              Column(
                children: [
                  RoundedButton(
                    text: '시작하기',
                    color: const Color(0xff8BC34A),
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const InputStartScreen();
                          },
                        ),
                      );
                    },
                  ),
                  RoundedButton(
                    text: '계정이 이미 있어요',
                    color: const Color(0xff8BC34A),
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const LoginScreen();
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
