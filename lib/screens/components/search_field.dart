import 'package:flutter/material.dart';
import 'package:sikcal/data/constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Material(
        elevation: 5,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: TextField(
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
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
