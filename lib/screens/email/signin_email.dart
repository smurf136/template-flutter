import 'package:template/components/notification.dart';
import 'package:flutter/material.dart';

import '../../services/sign_in/signin_with_email.dart';

class SignInWithEmail extends StatelessWidget {

  static const routeName = '/sign_in_email_page'; 

  var emailTextController  = TextEditingController();
  var passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In with Email")
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            "Please Sign-in with your Email/Password",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    )
                  ),
                  TextFormField(
                    controller: emailTextController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "example@naja.com"
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                  ),
                  TextFormField(
                    controller: passwordTextController,
                    decoration: InputDecoration(
                      labelText: "Password"
                    ),
                    obscureText: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Colors.amberAccent,
                          child: Text("Sign-in"),
                          onPressed: () async {
                            if (emailTextController.text == "" || passwordTextController.text == "") {
                              return showMessageBox(context,
                               title: "Failed", content: "Please fill in all of the information");
                            }else if(emailTextController.text == null || passwordTextController.text == null){
                              return showMessageBox(context, title: "Failed to Sign In", content: "Please fill in all of the information");
                            }
                            if(emailTextController.text != null && passwordTextController.text != null){
                              await signInWithEmail(context, email: emailTextController.text, password: passwordTextController.text);
                            }
                          }
                        )
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: FlatButton(
                      child: Text("Register now"),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          '/register_email_page'
                        );
                      }
                    )
                  )
                ],
              )
            )
          )
        )
      ),
    )  ;
  }
}