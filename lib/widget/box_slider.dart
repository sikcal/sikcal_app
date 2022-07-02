import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/diet.dart';

class BoxSlider extends StatelessWidget {
  final List<Diet> diets;
  BoxSlider({required this.diets});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('test'),
            Container(
                height: 120,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: makeBoxImages(diets),
                )
            )
        ]
      )
    );
  }
}

List<Widget> makeBoxImages(List<Diet> diets) {
  List<Widget> results = [];
  for(var i = 0; i < diets.length; i++) {
    results.add(InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(right: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset('assets/images/' + diets[i].diet_image),
        )
      )
    ));
  }
  return results;
}