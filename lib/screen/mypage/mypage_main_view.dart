import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/screen/mypage/mypage_cal_view.dart';

import '../../components/RoundedText.dart';
import '../../components/RoundedTextButton.dart';
import 'mypage_img_view.dart';
import 'mypage_update_view.dart';

class MyPageMainView extends ConsumerStatefulWidget {
  const MyPageMainView({Key? key}) : super(key: key);

  @override
  ConsumerState<MyPageMainView> createState() => _MyPageMainView();
}

class _MyPageMainView extends ConsumerState<MyPageMainView> {
  String userimg = "images/profile.jpg";
  String username ="김유진";
  String userweight = "00";
  String userTweight = "00";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Container(
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
              // TextButton(
              //     onPressed: () {
              //       Navigator.of(context).push(MaterialPageRoute<Null>(
              //           fullscreenDialog: true,
              //           builder: (BuildContext context) {
              //             return MyPageUploadView(
              //               // diet: diets[i],
              //             );
              //           }
              //       )
              //       );
              //     },
              //     child: Text('현재 체중 변경하기',
              //           style : TextStyle(
              //             color: Color(0xff8BC34A),
              //           ))
              // ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MyPageCalView();
                          },
                        ),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MyPageImgView();
                          },
                        ),
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
}