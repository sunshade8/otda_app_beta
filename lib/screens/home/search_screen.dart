import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextField(
        decoration: InputDecoration(
          hintText: "상품을 검색하세요",
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(Icons.search),
          ),


          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide.none,
          ),

        ),
      ),
    );
  }
}
