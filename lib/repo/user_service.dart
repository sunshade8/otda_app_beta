import 'package:cloud_firestore/cloud_firestore.dart';

class UserService{
  Future fireStoreWriteTest() async{
    FirebaseFirestore.instance
        .collection('TEST_COLLECTION')
        .add({
      'test': 'testing value',
      'number': '1234567'});
  }
  //void fireStoreReadTest(){
//     FirebaseFirestore.instance
//         .collection('TEST_COLLECTION')
//         .doc
//   }
}