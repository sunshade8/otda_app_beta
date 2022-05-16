import 'package:app_v2/repo/user_service.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:app_v2/widget/bannerslider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:app_v2/widget/CarouselWithDotsPage.dart';


class ItemsPage extends StatelessWidget {
  const ItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: LayoutBuilder(

        builder: (context, constraints){

          Size size = MediaQuery.of(context).size;
          final imgSize = size.width / 3.2;

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 220,
              crossAxisSpacing: 0.1,
              mainAxisSpacing: 1.0,
            ),

            itemBuilder: (context, index){
              return InkWell(
                onTap: (){
                  UserService().fireStoreWriteTest();
                },
                child: SizedBox(
                  height: imgSize,
                  child: Column(
                    children: [
                      SizedBox(
                        height: imgSize,
                          width: imgSize,
                          child: ExtendedImage.network(
                            'https://picsum.photos/150',
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Text('메종키츠네 울 가디건', style: TextStyle(fontWeight: FontWeight.bold),),
                              ],
                            ),
                            Column(
                              children: [
                                Text('30,000원'),
                              ],
                            ),




                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },

          );
        },

      ),
    );

  }
}
class BanSlider extends StatelessWidget {
  const BanSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imgList
              .map((item) => Container(
            child: Center(
              child: Image.network(
                item,
                fit: BoxFit.cover,
                width: 2000,
              ),
            ),
          ))
              .toList(),
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
