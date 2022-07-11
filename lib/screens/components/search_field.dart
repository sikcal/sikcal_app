import 'package:flutter/material.dart';
import 'package:sikcal/data/constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key, required this.controller, required this.onSubmit}) : super(key: key);

  final TextEditingController controller;
  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          hintText: '검색어를 추가해보세요 ex) 닭',
          prefixIcon: const Icon(Icons.search, color: Colors.white),
          prefixIconColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          fillColor: primaryColor,
          filled: true,
          hintStyle: const TextStyle(color: Colors.white),
          hoverColor: Colors.white,
          suffixIcon: IconButton(onPressed: () => onSubmit(), icon: const Icon(Icons.send, color: Colors.white)),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
