import 'package:flutter/material.dart';

Widget profile_list(BuildContext context,{
  @required IconData icon,
  @required String title,
  @required bool isLast,
  Widget widget,
  Function handle
}){
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.all(30),
        child: InkWell(
          onTap: handle,
          child: Container(
            child: Row(
              children: [
                Icon(icon),
                Padding(padding: EdgeInsets.all(10),),
                Text(title)
              ],
            )
          ),
        )
      ),
      widget != null ?
      widget : Container(),
      isLast ?
      Container() :
      Divider(
        thickness: 3,
        indent: 75,
        endIndent: 55,
      ),
    ],
  );
}