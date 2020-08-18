import 'package:flutter/material.dart';

import 'package:template/components/noti.dart';

class NotificationPage extends StatelessWidget {
  var appBar = 'Notification';
  get getAppBar => appBar;
  TextStyle head = TextStyle(fontSize: 20, fontWeight: FontWeight.w400);
  final List icon_list = [Icons.attach_money, Icons.tag_faces, Icons.settings];
  final List color_list = [Colors.yellow, Colors.red, Colors.blueGrey[500]];
  final List noti_list = ["Get 1 reward", "Promotion", "Update from Gozione"];
  final List description_list = [
    "from buying ...",
    "use normal service recieve sale 15%",
    "Gozoine has new updated"
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: icon_list.length,
        itemBuilder: (BuildContext context, int index) {
          return Noti(icon: icon_list[index],color: color_list[index], noti: noti_list[index], description: description_list[index]);
        });
  }
}