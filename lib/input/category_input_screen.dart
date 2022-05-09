import 'package:app_v2/states/category_notifier.dart';
import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class CategoryInputScreen extends StatelessWidget {
  const CategoryInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '제품 카테고리 선택',
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            return ListTile(
              onTap: (){
                context.read<CategoryNotifier>().setNewCategoryWithKor(
                  categoriesMapEngToKor.values.elementAt(index));
                Beamer.of(context).beamBack();
              },
                title: Text(
                    categoriesMapEngToKor.values.elementAt(index),
                    style: TextStyle(
                      color: context.read<CategoryNotifier>().setNewCategoryWithKor == categoriesMapEngToKor.values.elementAt(index)
                          ?Theme.of(context).primaryColor:Colors.black87),//선택된 카테고리 진하게 표시
                ),
            );
          },
          separatorBuilder: (context, index){
            return Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey[300]
            );
          },
          itemCount: categoriesMapEngToKor.length),
    );
  }
}

