import 'package:template/screens/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainPage extends StatelessWidget {

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Project"),
        actions: <Widget>[
          IconButton(
            tooltip: "Sign-out",
            icon: Icon(
              Icons.close,
              color: Colors.redAccent
            ),
            onPressed: () {
              // final FirebaseAuth _auth = FirebaseAuth.instance;

              print("Sign-out Successfully");
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SigninPage()
                )
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
                    image: NetworkImage(snap.data["url"])
                  )
                )
              ),
            ),
            Flexible(
              child: Text(
                snap.documentID ,
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
                    "Firstname: " + snap.data["firstname"],
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
                  child: Text(
                    "Surname: " + snap.data["surname"],
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
                    "Role: " + snap.data["role"],
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