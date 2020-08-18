import 'package:flutter/material.dart';

import 'package:template/components/notification.dart';
class Profile extends StatelessWidget {
  var appBar = 'Profile';
  get getAppBar => appBar;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.yellow[600]
            ),
            child: Column(
              children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [ 
                      Container(
                          width: 90,
                          margin: EdgeInsets.fromLTRB(20, 20, 0, 20),
                          decoration: BoxDecoration(
                            // color: Colors.red
                          ),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/images/christmas_cover.jpg'),
                          ),
                          // margin: EdgeInsets.all(40),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 35, 0, 35),
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Center(
                          child: Text(
                            "pum wntk".toUpperCase(),
                            style: TextStyle(
                              fontSize: 18
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ),
                      Container(
                        width: 53,
                        padding: EdgeInsets.only(top: 5, right: 5),
                        decoration: BoxDecoration(
                          // color: Colors.red
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              iconSize: 30,
                              onPressed: () {
                                showMessageBox(context, title: "Edit", content: "Coming soon !!");
                              },
                            ),
                          ]
                        )
                      )
                    ],
                  )
                ),
                Container(
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(40, 40, 40, 10),
                                child:Row(
                                  children: [
                                    Icon(Icons.account_box),
                                    Padding(padding: EdgeInsets.all(10),),
                                    Text("การซื้อของฉัน")
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(40,10,10,10),
                                child: Container(
                                  width: 270,
                                  height: 75,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.payment),
                                            iconSize: 20,
                                            color: Colors.white,
                                            onPressed: (){},
                                          ),
                                          Text(
                                            "ที่ต้องชำระ",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white
                                            )
                                          )
                                        ],
                                      ),
                                      Container(width: 20, child: Divider(color:Colors.grey)),
                                      Column(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.directions_bike),
                                            iconSize: 20,
                                            color: Colors.white,
                                            onPressed: (){},
                                          ),
                                          Text(
                                            "ที่ต้องจัดส่ง",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(width: 20, child: Divider(color:Colors.grey)),
                                      Column(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.crop_square),
                                            iconSize: 20,
                                            color: Colors.white,
                                            onPressed: (){},
                                          ),
                                          Text(
                                            "ที่ต้องได้รับ",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                            )
                                          )
                                        ],
                                      ),
                                      Container(width: 20, child: Divider(color:Colors.grey)),
                                      Column(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.rate_review),
                                            iconSize: 20,
                                            color: Colors.white,
                                            onPressed: (){},
                                          ),
                                          Text(
                                            "ให้คะแนน",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                )
                              )
                            ],
                          )
                        ),
                        Divider(
                          thickness: 3,
                          indent: 75,
                          endIndent: 55,
                        ),
                        Padding(
                          padding: EdgeInsets.all(30),
                          child: Container(
                            child: Row(
                              children: [
                                Icon(Icons.favorite_border),
                                Padding(padding: EdgeInsets.all(10),),
                                Text("รายการโปรด")
                              ],
                            )
                          ),
                        ),
                        Divider(
                          thickness: 3,
                          indent: 75,
                          endIndent: 55,
                        ),
                        Padding(
                          padding: EdgeInsets.all(30),
                          child: Container(
                            child: Row(
                              children: [
                                Icon(Icons.account_balance),
                                Padding(padding: EdgeInsets.all(10),),
                                Text("เหรียญ Reward")
                              ],
                            )
                          ),
                        ),
                        Divider(
                          thickness: 3,
                          indent: 75,
                          endIndent: 65,
                        ),
                        Padding(
                          padding: EdgeInsets.all(30),
                          child: Container(
                            child: Row(
                              children: [
                                Icon(Icons.exit_to_app),
                                Padding(padding: EdgeInsets.all(10),),
                                Text("ออกจากระบบ")
                              ],
                            )
                          ),
                        ),
                        Divider(
                          thickness: 3,
                          indent: 75,
                          endIndent: 55,
                        ),
                        Padding(
                          padding: EdgeInsets.all(30),
                          child: Container(
                            child: Row(
                              children: [
                                Icon(Icons.info_outline),
                                Padding(padding: EdgeInsets.all(10),),
                                Text("เกี่ยวกับเรา")
                              ],
                            )
                          )
                        ),
                      ],
                    )
                  )
                )
              ],
            )
          )
        )
      ],
    );
  }
}