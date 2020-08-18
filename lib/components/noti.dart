import 'package:flutter/material.dart';

class Noti extends StatelessWidget {
  Noti({Key key, this.icon, this.color,this.noti, this.description}) : super(key : key);
  IconData icon;
  Color color;
  String noti;
  String description;
  BoxDecoration box = BoxDecoration(
    color: Colors.grey[300],
    borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50), bottomLeft: Radius.circular(50))
  );
  TextStyle head = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: box,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(50))
            ),
            child: IconButton(
              icon: Icon(icon),
              color: Colors.white,
              iconSize: 65,
              onPressed: () {
                
              },
            )
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(noti),
              Text(description),
            ],
          )
        ],
      ),
    );
  }
}