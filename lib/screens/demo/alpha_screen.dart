import 'package:flutter/material.dart';

import 'package:template/components/notification.dart';
import 'package:template/screens/demo/profile.dart';
import 'package:template/screens/demo/notification_page.dart';
enum ActionBar {noti, profile}

class AlphaScreen extends StatefulWidget {
  static final routeName = "/alpha_screen";
  @override
  _AlphaScreenState createState() => _AlphaScreenState();
}

class _AlphaScreenState extends State<AlphaScreen> {
  int _selectedIndexPage = 0;
  var appBar = 'Home Page';
  static List widgetList = [HomePage(), NotificationPage(), Chat(), Profile()];

  void onItemSelect(int index) {
    setState(() {
      _selectedIndexPage = index;
      appBar = widgetList.elementAt(index).getAppBar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBar),
        automaticallyImplyLeading: false,
        actions: [
          appBar != 'Profile' ?
          IconButton(
            icon: Icon(Icons.notifications, 
              color: Colors.white,
              size: 35,),
            onPressed: () {
              showMessageBox(context, title: appBar, content: "Coming Soon!!");
            },
          )
          : IconButton(
            icon: Icon(Icons.account_circle,
              color: Colors.white,
              size: 35,
            ),
            onPressed: () {
              showMessageBox(context, title: appBar, content: "Coming Soon!!");
            },
          )
        ],
      ),
      body: Center(child: widgetList.elementAt(_selectedIndexPage)),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.orange[800],
          primaryColor: Color.fromRGBO(2, 249, 243, 1),
          textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(caption: new TextStyle(color: Colors.white))
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('HomePage')),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), title: Text("Notification")),
            BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text("Chat")),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), title: Text("Profile"))
          ],
          currentIndex: _selectedIndexPage,
          selectedItemColor: Color.fromRGBO(2, 249, 243, 1),
          unselectedItemColor: Colors.white,
          onTap: onItemSelect,
        ),
      )
    );
  }
}

class HomePage extends StatelessWidget {
  var appBar = 'Home Page';
  get getAppBar => appBar;
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Home Page"));
  }
}



class Chat extends StatelessWidget {
  var appBar = 'Chat';
  get getAppBar => appBar;
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Chat"));
  }
}

