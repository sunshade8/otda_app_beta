import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroPage extends StatelessWidget {


   IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //logger.d('current user state: ${context.read<UserProvider>().userState}');
    return LayoutBuilder(
      builder: (context, constraints){

        Size size = MediaQuery.of(context).size;

        final imgOne = size.width -32;
        final imgTwo = imgOne *0.1;

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //앱 이름
                Text('app_v2',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1eaa12)),
                ),
                //이미지
                SizedBox(
                  width: imgOne,
                  height: imgOne,

                  child: Stack(
                    children: [
                      ExtendedImage.asset('assets/images/closetbetaimg.jpeg'),
                      Positioned(
                          width: imgTwo,
                          height: imgTwo,
                          left: imgOne*0.45,
                          top: imgOne*0.45,
                          child: ExtendedImage.asset('')
                      ),
                    ],
                  ),
                ),

                //앱 한줄 요약
                Text('우리의 공유 옷장',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500 ),
                ),
                //앱 설명
                Text('app_v2는 갖고 있는 옷을 빌려주고 입고 싶은 옷을 빌려입고, \n마음에 들면 구매도 가능한 서비스에요 ',
                  style: TextStyle(
                      fontSize:  16,
                      fontWeight: FontWeight.w100),
                  textAlign: TextAlign.center,

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                      onPressed: (){
                        context.read<PageController>().animateToPage(1, duration: Duration(milliseconds:  700), curve: Curves.easeOut);
                      },
                      child: Text('서비스 시작하기',
                        style: TextStyle(color:  Colors.white),
                      ),

                    ),
                  ],
                ),

              ],
            ),
          ),
        );
      },

    );
  }
}
