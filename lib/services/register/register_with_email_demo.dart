import 'package:template/components/notification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../components/notification.dart';

Future<FirebaseUser> registerWithEmailDemo({
  @required BuildContext context,
  @required String email, @required String password, @required String repassword
}) {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  return _auth.createUserWithEmailAndPassword(email: email, password: password).then((data) {
    print("Register Success");
    print(data.user.uid);
    return data.user;
  }).catchError((e){
    print('service');
    print(e.code);
    switch(e.code){
      case "ERROR_EMAIL_ALREADY_IN_USE":
        showMessageBox(context, title: "Email already in use.", content: "The email address is already in use by another account");
    }
  });
}