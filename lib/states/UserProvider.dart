import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserProvider with ChangeNotifier {
  FirebaseUser user;
  DocumentSnapshot snap;

  FirebaseUser get getUser => user;
  DocumentSnapshot get getSnap => snap;
  bool get isAuth => user != null;

  void setUser(FirebaseUser firebaseUser){
    user = firebaseUser;
  }
  void setSnap(DocumentSnapshot dataSnap){
    snap = dataSnap;
  }
  // void signOut(BuildContext context){
  void signOut(){
    FirebaseAuth.instance.signOut();
    setUser(null);
    notifyListeners();
  }
}