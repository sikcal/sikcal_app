import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/button_add_mydiet.dart';
import '../../model/diet.dart';


class MyPageUploadView extends ConsumerStatefulWidget {
  late final Diet diet;
  MyPageUploadView({required this.diet});

  @override
  ConsumerState<MyPageUploadView> createState() => _MyPageUploadView();
}

class _MyPageUploadView extends ConsumerState<MyPageUploadView> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(

        )
    );
  }
}