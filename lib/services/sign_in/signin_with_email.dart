import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:template/screens/main_page.dart';
import 'package:template/states/UserProvider.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<bool> signInWithEmail(BuildContext context,
    {@required String email, @required password}) {
  UserProvider user = Provider.of<UserProvider>(context, listen: false);
  return _auth
      .signInWithEmailAndPassword(email: email, password: password)
      .then((result) {
    print("Welcome, " + result.user.uid);
    user.setUser(result.user);
    return Firestore.instance
        .collection("user")
        .document(result.user.uid)
        .get()
        .then((value) {
      user.setSnap(value);
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/alpha_screen');
    }).catchError((e) {});
    // return true;
  }).catchError((e) {
    print(e);
    print(e.code);
  });
}
