import 'package:flutter/material.dart';

class PlainTextField extends StatelessWidget {

  TextEditingController? controller;
  String? text;

  PlainTextField({
    this.controller,
    this.text});


  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: text
          ),
        )
    );
  }
}