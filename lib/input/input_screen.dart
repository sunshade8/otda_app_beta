import 'package:app_v2/constants/common_size.dart';
import 'package:app_v2/states/category_notifier.dart';
import 'package:beamer/src/beamer.dart';
import 'package:flutter/material.dart';
import 'package:app_v2/input/multi_image_select.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:provider/src/provider.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {

  var _divider = Divider(
      height: 1,
      color: Colors.grey,
      thickness: 1,
      indent: common_bg_padding,
      endIndent: common_bg_padding,

  );
  var _border = UnderlineInputBorder(
      borderSide: BorderSide(
          color: Colors.transparent
      )
  );

  bool _suggestPriceSelected = false;

  TextEditingController _priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: (){
            context.beamBack();
          },
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          ),
          child: Text(
            '뒤로',
            style: Theme.of(context).textTheme.bodyText2
            ),
          ),
        actions: [
          TextButton(
            onPressed: (){
              context.beamBack();
            },
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor
            ),
            child: Text('완료',
              style: Theme.of(context).textTheme.bodyText2
              ),
            ),
        ],
        title: Text(
          '상품 업로드', style: Theme.of(context).textTheme.headline6,),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          MultiImageSelect(),
          _divider,
          TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: common_sm_padding
              ),
              hintText: '상품 제목',
              border: _border,
              enabledBorder: _border,
              focusedBorder: _border,
            ),
          ),
          _divider,
          ListTile(
            onTap: (){
              context.beamToNamed('/input/category_input');
            },
            dense: true,
            title: Text(context.watch<CategoryNotifier>().currentCategoryInKor),
            trailing: Icon(Icons.navigate_next),
          ),//카테고리 선택
          _divider,
          Expanded(
              child: TextFormField(
                inputFormatters: [
                  MoneyInputFormatter(
                    trailingSymbol: '원',
                    mantissaLength: 0,
                  ),
                ],
                controller: _priceController,
                onChanged: (value){
                  setState(() {
                    if(value== '0원'){_priceController.clear();}
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: common_bg_padding,
                  ),
                  hintText: '판매가격을 입력하세요',
                  border: _border,
                  enabledBorder: _border,
                  focusedBorder: _border,
                ),

              ),
          ),//희망판매가격
          _divider,
          
          TextFormField(
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: common_bg_padding
              ),
              hintText: '제품 상태, 사이즈 팁, 등 세부 설명을 입력하세요 ',
              border: _border,
              enabledBorder: _border,
              focusedBorder: _border,
            ),
          ),
        ],
      ),
    );
  }
}


