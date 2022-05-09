import 'package:flutter/cupertino.dart';

CategoryNotifier categoryNotifier = CategoryNotifier();
class CategoryNotifier extends ChangeNotifier{

  String _selectedCategoryInEng = 'none';

  String get currentCategoryInEng => _selectedCategoryInEng;
  String get currentCategoryInKor => categoriesMapEngToKor[_selectedCategoryInEng]!;

  void setNewCategoryWithEng(String newCategory) {
    if(categoriesMapEngToKor.keys.contains(newCategory)){
      _selectedCategoryInEng = newCategory;
      notifyListeners();
    }
  }
  void setNewCategoryWithKor(String newCategory) {
    if(categoriesMapEngToKor.values.contains(newCategory)){
      _selectedCategoryInEng = categoriesMapKorToEng[newCategory]!;
      notifyListeners();
    }
  }
}

const Map<String,String> categoriesMapEngToKor = {
  'none' : '선택',
  'men' : '남성',
  'women' : '여성'
};

const Map<String,String> categoriesMapKorToEng = {
  '선택' : 'none',
  '남성' : 'men',
  '여성' : 'women'
};


