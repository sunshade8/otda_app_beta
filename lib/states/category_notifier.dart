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
  'tshirt & top' : '티셔츠 & 탑',
  'shirt' : '셔츠',
  'sweatshirt' : '스웨트셔츠',
  'knitwear' : '니트',
  'jacket' : '재킷',
  'coat' : '코트',
  'pants' : '하의',

};

const Map<String,String> categoriesMapKorToEng = {
  '선택' : 'none',
  '남성' : 'men',
  '여성' : 'women',
  '티셔츠 & 탑' : 'tshirt & top',
  '셔츠' : 'shirt',
  '스웨트셔츠' : 'sweatshirt',
  '니트' : 'knitwear',
  '재킷' : 'jacket',
  '코트' : 'coat',
  '하의' : 'pants',
};


