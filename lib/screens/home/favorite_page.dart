import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';



class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
        child: Text('찜한 옷 없음', style:
        TextStyle(
            height: 5,
            fontSize: 30

        ),
        ),
    );

  }
}
