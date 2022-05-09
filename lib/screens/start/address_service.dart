/*
import 'package:app_v2/constants/keys.dart';
import 'package:dio/dio.dart';
import 'package:app_v2/utils/logger.dart';
import 'package:app_v2/data/address_model.dart';

class AddressService{
  //string 타입 검색주소 api 데이터 받기

  Future<AddressModel> SearchAddressByStr(String text) async{
    final formData = {
      'request' : 'search',
      'key' : VWORLD_KEY,
      'query' : text,
      'type' : 'ADDRESS',
      'category' : 'ROAD',
      'size' : 30,
    };
    final response = await Dio().get('http://api.vworld.kr/req/search', queryParameters: formData).catchError((e){
      logger.e(e.message);

    });
    logger.d(response);

    //api 오브젝트 모델 연동
    AddressModel addressModel = AddressModel.fromJson(response.data['response']);
    return addressModel;
  }
}*/
