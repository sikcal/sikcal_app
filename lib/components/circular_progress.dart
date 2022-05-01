import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class CircularProgress extends StatefulWidget {
  int data; // 중간에 표시될 데이터 (g)
  double progress_value;
  Color color;

  CircularProgress(
      {Key? key,
      required this.data,
      required this.progress_value,
      required this.color})
      : super(key: key);

  @override
  State<CircularProgress> createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.0,
      height: 110.0,
      child: LiquidCircularProgressIndicator(
        value: widget.progress_value,
        // Defaults to 0.5.
        valueColor: AlwaysStoppedAnimation(widget.color),
        // Defaults to the current Theme's accentColor.
        backgroundColor: Colors.white,
        // Defaults to the current Theme's backgroundColor.
        borderColor: Colors.white,
        borderWidth: 0.7,
        center: CircleAvatar(
          child: Text(
            "${widget.data}g",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: widget.color,
        ),
      ),
    );
  }
}
