import 'package:app_v2/screens/home/favorite_page.dart';
import 'package:app_v2/screens/home/search_screen.dart';
import 'package:app_v2/states/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_v2/screens/home/items_page.dart';
import 'package:app_v2/screens/home/closet_page.dart';
import 'package:app_v2/widget/expandablefab.dart';
import 'package:app_v2/widget/bannerslider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _bottomSelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTDA'),
        actions: [
          IconButton(
            onPressed: (){
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.notifications),

          )
        ],
      ),
      body: IndexedStack(
        index: _bottomSelectedIndex,
        /*GridView.count
        crossAxisCount: 2,
        mainAxisSpacing: 6.0,
        crossAxisSpacing: 6.0,*/
        children: [
          ItemsPage(),
          SearchPage(),
          FavoritePage(),
          ClosetPage(),



        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomSelectedIndex,
        onTap: (index){
          setState(() {
            _bottomSelectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈',activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: '검색',activeIcon: Icon(Icons.search_rounded)),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '찜',activeIcon: Icon(Icons.favorite)),
          BottomNavigationBarItem(icon: Icon(Icons.checkroom), label: '내 옷장',activeIcon: Icon(Icons.checkroom)),


        ],
      ),
    );
  }
}
/*onPressed: (){
context.read<UserProvider>().SetUserAuth(false);
},
icon: Icon(Icons.logout), -> 로그아웃할때 실행하는 함수*/