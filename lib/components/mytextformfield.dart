import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {

  String? label;
  FormFieldSetter? onSaved;
  FormFieldValidator? validator;
  TextEditingController? controller;
  bool obscureText;

  MyTextFormField({
    this.label,
    this.onSaved,
    this.validator,
    this.controller,
    required this.obscureText
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: label
        ),
      )
    );
  }
}