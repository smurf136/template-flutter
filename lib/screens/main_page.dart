import 'package:template/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import 'package:template/states/UserProvider.dart';
class MainPage extends StatelessWidget {

  static const routeName = '/main_page';

  MainPage({Key key, @required this.user, @required this.snap}) : super(key : key);
  final FirebaseUser user;
  final DocumentSnapshot snap;

  TextStyle bold24Roboto = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w900
  );

  @override
  Widget build(BuildContext context) {
    UserProvider user = Provider.of<UserProvider>(context, listen:false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, " + user.getSnap.data["firstname"]),
        actions: <Widget>[
          IconButton(
            tooltip: "Sign-out",
            icon: Icon(
              Icons.close,
              color: Colors.redAccent
            ),
            onPressed: () {
              // final FirebaseAuth _auth = FirebaseAuth.instance;
              print(FirebaseAuth.instance.currentUser());
              print("Sign-out Successfully");
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(
                context,
                '/main_sign_in'
              );
            }
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(user.getSnap.data["url"])
                  )
                )
              ),
            ),
            Flexible(
              child: Text(
                user.getSnap.documentID ,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center
              )
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                  child: Text(
                    "Firstname: " + user.getSnap.data["firstname"],
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                  child: Text(
                    "Surname: " + user.getSnap.data["surname"],
                    style: TextStyle(
                      fontSize: 20
                    )
                  )
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
                  child: Text(
                    "Role: " + user.getSnap.data["role"],
                    style: TextStyle(
                      fontSize: 20
                    )
                  )
                )
              ],
            )
          ],
        )
      )
    );
  }
}