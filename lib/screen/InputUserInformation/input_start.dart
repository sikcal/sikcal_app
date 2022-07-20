import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/components/RoundedButton.dart';
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/model/register_info_user.dart';
import 'package:sikcal/screen/InputUserInformation/Input_username.dart';

final registerInfoUserProvider = Provider<RegisterInfoUser>((ref) => RegisterInfoUser());

class InputStartScreen extends StatelessWidget {
  const InputStartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Image(
              image: AssetImage('images/fork.png'),
              height: 25.0,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Hero(
                  tag: 'title1',
                  child: Text(
                    '식',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Hero(
                  tag: 'title2',
                  child: Text(
                    '칼',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10.0,
            ),
            const Image(
              image: AssetImage('images/knife.png'),
              height: 25.0,
            ),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
        backgroundColor: primaryColor,
      ),
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
                  Text('반갑습니다!', style: kLargeTextStyle),
                  const SizedBox(height: 15),
                  Text('원활한 이용을 위해 일부 정보를 수집합니다.', style: kLargeTextStyle),
                ],
              ),
              Column(
                children: [
                  RoundedButton(
                    text: '알겠습니다',
                    color: const Color(0xff8BC34A),
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const InputUserNameScreen();
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
