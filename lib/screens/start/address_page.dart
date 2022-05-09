/*
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:app_v2/data/address_model.dart';
import 'package:app_v2/screens/start/address_service.dart';
import 'package:app_v2/utils/logger.dart';

class AddressPage extends StatefulWidget {
  AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController _addressController = TextEditingController();

  AddressModel? _addressModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        TextFormField(
          onFieldSubmitted: (text) async{
            _addressModel = await AddressService().SearchAddressByStr(text);
            setState(() {

            });
          },
          controller: _addressController,
              decoration: InputDecoration(
              prefixIconConstraints: BoxConstraints(minHeight: 24,minWidth: 24),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey
                  ),
                ),
                hintText: '도로명으로 검색하세요', //텍스트필드에 희미하게 텍스트 보이는 기능
                hintStyle: TextStyle(color: Theme.of(context).hintColor) ,
              ),
            ),
         SizedBox(

           height: 30,
           width: 150,
           child: TextButton(
             onPressed: (){},
             child: Text('현재위치로 찾기',
               style: TextStyle(color:  Colors.white),
             ),

           ),
         ),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 16),
            itemCount: (_addressModel == null ||
                _addressModel!.result == null ||
                _addressModel!.result!.items == null)
                ?0
                :_addressModel!.result!.items!.length,
              itemBuilder: (context, index){
                if(_addressModel == null ||
                    _addressModel!.result!.items == null ||
                    _addressModel!.result!.items![index].address == null)
                  return Container();
                return ListTile(
                  title: Text(_addressModel!.result!.items![index].address!.road??""),
                  subtitle: Text(_addressModel!.result!.items![index].address!.parcel??"") ,
                );
          },

          ),
        ),


      ],),
    );
  }
}
*/
