import 'package:flutter/material.dart';
import 'package:app_v2/widget/bannerslider.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        BannerSlider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.green,
                  ),
                  hintText: "상품을 검색해보세요",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  fillColor: Colors.white,
                  filled: true,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

          ),
        ),
      ],
    );

  }
}
