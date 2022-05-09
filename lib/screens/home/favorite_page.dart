import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';



class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){

        Size size = MediaQuery.of(context).size;
        final imgSize = size.width / 3.2;

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 220,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
          ),

          itemBuilder: (context, index){
            return SizedBox(
              height: imgSize,
              child: Column(
                children: [
                  SizedBox(
                      height: imgSize,
                      width: imgSize,
                      child: ExtendedImage.network(
                        'https://picsum.photos/150',
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                      )
                  ),
                  Column(
                    children: [
                      Column(
                        children: [
                          Text('찜한 옷', style: Theme.of(context).textTheme.subtitle1,),
                        ],
                      ),
                      Column(
                        children: [
                          Text('대여 가격: '),
                        ],
                      ),
                      Column(
                        children: [
                          Text('판매 가격: '),
                        ],
                      ),



                    ],
                  )
                ],
              ),
            );
          },

        );
      },

    );

  }
}
