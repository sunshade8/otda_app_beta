import 'package:beamer/beamer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:app_v2/screens/splash_screen.dart';
import 'package:app_v2/router/location.dart';
import 'package:app_v2/screens/home_screen.dart';
import 'package:app_v2/screens/start_screen.dart';
import 'package:app_v2/screens/start/address_page.dart';
import 'package:app_v2/states/user_provider.dart';
import 'package:provider/provider.dart';
//비머 전역 선언


final _routerDelegate = BeamerDelegate(
  guards: [BeamGuard(
      pathBlueprints: ['/'],
      check: (context, location) {return context.watch<UserProvider>().user != null;
      },
    showPage: BeamPage(child: StartScreen())
  )],
    locationBuilder: BeamerLocationBuilder(
        beamLocations: [HomeLocation(), InputLocation(),]
    )
);

//메인함수 빌드
void main() {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

//마이앱 클래스 선언(정적위젯)
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  @override
  Widget build(BuildContext context) {

    //첫화면 로딩구현
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          return AnimatedSwitcher(
          duration: Duration(milliseconds: 900), //페이드인아웃
          child: _splashLoadingWidget(snapshot), //스냅샷실행 위젯지정
    );
    }
    );
  }
}
//스플래쉬로딩위젯 클래스 선언 (인스턴)
StatelessWidget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
  if(snapshot.hasError) {print('에러가 발생했습니다'); return Text('Error');}
  else if(snapshot.connectionState == ConnectionState.done) {return ShopApp();}
  else{return SplashScreen();}
}
//홈페이지 클래스
class ShopApp extends StatelessWidget {
  const ShopApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context){
        return UserProvider();
      },
      child: MaterialApp.router(
        theme: ThemeData(
            hintColor: Colors.grey[350],
            fontFamily: 'SpoqaMedium',
            primarySwatch: Colors.green,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                primary: Colors.white,
                minimumSize: Size(48,48)
              ),
            ),
            textTheme: TextTheme(
              headline5: TextStyle(fontFamily: 'SpoqaMedium'),
              subtitle1: TextStyle(fontSize: 17, color: Colors.black87),
              subtitle2: TextStyle(fontSize: 17, color: Colors.black38),
              button: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
              bodyText2: TextStyle(fontSize: 13, color: Colors.black87, fontWeight: FontWeight.w300),
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black87,
              titleTextStyle: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w700),
              elevation: 2,
              actionsIconTheme: IconThemeData(color: Colors.black),
            ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.black87,
            unselectedItemColor: Colors.black38,
          ),
        ),
        debugShowCheckedModeBanner: false, //에뮬레이터 디버스 표시 삭제
        routeInformationParser: BeamerParser(),
        routerDelegate: _routerDelegate,
      ),
    );
  }
}
