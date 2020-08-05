import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../screens/main_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<bool> signInWithEmail(BuildContext context,
 {
   @required String email, @required password
 }) {
   return _auth.signInWithEmailAndPassword(email: email, password: password).then((result) {
     print("Welcome, " + result.user.uid);
     return Firestore.instance.collection("user")
      .document(result.user.uid).get().then((value) {
      Navigator.pop(context);
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          builder: (context) => MainPage(
            user: result.user,
            snap: value
          )
        ));
     }).catchError((e) {

     });
      // return true;
   }).catchError((e) {
     print(e);
     print(e.code);
   });
 }
