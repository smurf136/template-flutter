import 'package:flutter/material.dart';

import 'email/signin_email.dart';
import 'package:template/components/signin_button.dart';
import 'package:template/screens/demo/EligibilityScreen.dart';
class SigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In Pages")
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Image.asset('assets/images/christmas_cover.jpg'),
              )
            ),
            // If more than one way to sign in add container
            signInButton(
              context, 
              title: "Sign-in with Email", 
              icon: Icons.email, 
              handle: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInWithEmail()
                  )
                );
              }
            ),
            Container(
              width: double.infinity,
              child: FlatButton(
                child: Text("Demo"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EligibilityScreen()
                    )
                  );
                }
              )
            )
          ],
        ),
      )
    );
  }
}