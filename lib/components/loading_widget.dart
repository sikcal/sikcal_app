import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sikcal/data/constants.dart';
import 'package:sikcal/data/provider.dart';

class LoadingScreen extends ConsumerWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final loadingState = ref.watch(loadingStateProvider.state);

    //TODO : 애니메이션이나 좀 보기 이쁜거로 바꾸기

    if (loadingState.state) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black26,
        child: Center(
          child: Container(
            color: Colors.white,
            child: Text(
              '로딩중입니다...',
              style: defaultTextStyle.copyWith(fontSize: 30),
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
