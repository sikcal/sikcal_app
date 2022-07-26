import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/data/providers.dart';
import 'package:sikcal/screen/mypage/mypage_cal_view.dart';

import '../../components/RoundedButton.dart';
import '../../components/RoundedText.dart';
import '../../components/RoundedTextButton.dart';
import '../../components/mytextformfield.dart';
import '../../data/constants.dart';
import 'mypage_img_view.dart';
import 'mypage_update_view.dart';

class MyPageMainView extends ConsumerStatefulWidget {
  const MyPageMainView({Key? key}) : super(key: key);

  @override
  ConsumerState<MyPageMainView> createState() => _MyPageMainView();
}

class _MyPageMainView extends ConsumerState<MyPageMainView> {
  String userimg = "images/profile.jpg";
  String userweight = "00";
  String userTweight = "00";

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    String username = user?.name ?? "사용자";

    return SafeArea(
      child:Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  userimg,
                  fit: BoxFit.cover,
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(height: 25),
              Text(username,
                style: TextStyle(
                  color: Color(0xff8BC34A),
                  fontSize: 25.0,
                ),
              ),
              SizedBox(height: 25),
              RoundedText(
                text: "현재 체중      $userweight kg",
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              TextButton(
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute<Null>(
                    //     fullscreenDialog: true,
                    //     builder: (BuildContext context) {
                    //       return MyPageUpdateView(
                    //         // diet: diets[i],
                    //       );
                    //     }
                    // )
                    // );
                    showUserInfoUpdateView(context);
                  },
                  child: Text('현재 체중 변경하기',
                        style : TextStyle(
                          color: Color(0xff8BC34A),
                        ))
              ),

              RoundedText(
                text: "목표 체중      $userTweight kg",
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute<Null>(
                          fullscreenDialog: true,
                          builder: (BuildContext context) {
                            return MyPageCalView(
                            );
                          }
                      )
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff8BC34A),
                      padding:EdgeInsets.all(15.0),
                    ),
                    child: Column(
                      children: [
                        Text('CAL'),
                        Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.white,
                          size: 50,
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 50.0,),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute<Null>(
                          fullscreenDialog: true,
                          builder: (BuildContext context) {
                            return MyPageImgView(
                            );
                          }
                      )
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff8BC34A),
                      padding:EdgeInsets.all(15.0),
                    ),
                    child: Column(
                      children: [
                        Text('VIEW'),
                        Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 50,
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }
  void showUserInfoUpdateView(BuildContext context) {
    showModalBottomSheet(
      context: context,
      // isScrollControlled를 true로 설정.
      isScrollControlled: true,

      builder: (BuildContext context) {
        final userweightcontroller = TextEditingController();
        final _formkey = GlobalKey<FormState>();

        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Center(
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

                        Navigator.pop(context);
                        return;
                      }
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
  void showUserCal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      // isScrollControlled를 true로 설정.
      isScrollControlled: true,

      builder: (BuildContext context) {
        final userweightcontroller = TextEditingController();
        final _formkey = GlobalKey<FormState>();

        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Center(
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

                        Navigator.pop(context);
                        return;
                      }
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}