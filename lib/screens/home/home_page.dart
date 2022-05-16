import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:app_v2/widget/bannerslider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:app_v2/widget/CarouselWithDotsPage.dart';
import 'items_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BannerSlider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ItemsPage(),
        ),
      ],
    );
  }
}
