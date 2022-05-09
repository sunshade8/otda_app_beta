import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            ExtendedImage.asset('assets/images/app_beta_image.png'),
          ],
        )
      ),
    );
  }
}
