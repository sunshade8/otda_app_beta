import 'package:app_v2/utils/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  UserProvider(){
    initUser();
  }
  User? _user;
 void initUser(){
   FirebaseAuth.instance.authStateChanges().listen((user){
     _user = user;
     logger.d('현재 유저상태: $user');
     notifyListeners();
   });
 }
 User? get user => _user;
}