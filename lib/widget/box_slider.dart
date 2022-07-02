import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/diet.dart';
import '../screen/mydiet/mydiet_detail_view.dart';

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
              Container(
                  height: 130,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: makeBoxImages(context, diets),
                  )
              )
            ]
        )
    );
  }
}

List<Widget> makeBoxImages(BuildContext context, List<Diet> diets) {
  List<Widget> results = [];
  for(var i = 0; i < diets.length; i++) {
    results.add(InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute<Null>(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return MyDietDetailView(
                  diet: diets[i],
                );
              }
          )
          );
        },
        child: Container(
            padding: EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Image.asset('images/' + diets[i].diet_image, width: 200, height: 100),
                  Text(diets[i].diet_title)
                ],
              ),
            )
        )
    ));
  }
  return results;
}