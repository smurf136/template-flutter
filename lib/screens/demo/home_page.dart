import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:template/states/UserProvider.dart';
class HomePage extends StatelessWidget {
  var appBar = 'Home Page';
  get getAppBar => appBar;
  @override
  Widget build(BuildContext context) {
    UserProvider user = Provider.of<UserProvider>(context, listen: false);
    return Center(
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
      );
  }
}