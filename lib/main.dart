import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/screens/email/register_email_demo.dart';
import 'package:template/screens/email/signin_email.dart';
import 'package:template/screens/main_page.dart';

import 'package:template/screens/signin_page.dart';
import 'package:template/states/UserProvider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider())
      ],
      child: Consumer<UserProvider>(
        builder: (context, user, _) => MaterialApp(
          title: "My Demo Alpha",
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: user.isAuth 
              ? MainPage()
              : SigninPage(),
          initialRoute: '/main_sign_in',
          routes: {
            SigninPage.routeName: (context) => SigninPage(),
            SignInWithEmail.routeName: (context) => SignInWithEmail(),
            RegisterPage.routeName: (context) => RegisterPage(),
            MainPage.routeName: (context) => MainPage()
          },
        )
      )
    );
  }

}
  class HomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Container(
        child: Text("Hello"),
      );
    }
  }
