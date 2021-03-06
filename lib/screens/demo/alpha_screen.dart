import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:template/components/notification.dart';
import 'package:template/screens/demo/profile.dart';
import 'package:template/screens/demo/notification_page.dart';
import 'package:template/screens/demo/home_page.dart';
import 'package:template/states/UserProvider.dart';
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
    UserProvider user = Provider.of<UserProvider>(context);
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
      body: Center(child: filtering(context, user, widgetList, _selectedIndexPage)),
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

Widget filtering(BuildContext context, UserProvider user, List widget_list, int selected_page){
  if(user.isAuth){
    return widget_list.elementAt(selected_page);
  }else {
    WidgetsBinding.instance.addPostFrameCallback((_){
      print(_);
      Navigator.of(context).pushReplacementNamed('/main_sign_in');
    });
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

