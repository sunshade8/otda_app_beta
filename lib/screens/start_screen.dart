import 'package:flutter/material.dart';
import 'package:app_v2/screens/start/intro_page.dart';
import 'package:app_v2/screens/start/address_page.dart';
import 'package:app_v2/screens/start/auth_page.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatelessWidget {

  //페이지 컨트롤러
   PageController _pageController = PageController();

   StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<PageController>.value(
      value: _pageController,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
          IntroPage(),
          //AddressPage(), //주소 입력
          AuthPage(),
          Center(child: Text('로그인 하세요'),),
          Container(color: Colors.accents[5],),
        ],
        ),
      ),
    );
  }
}
