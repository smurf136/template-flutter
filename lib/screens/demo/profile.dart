import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:template/components/notification.dart';
import 'package:template/components/profile_list.dart';
import 'package:template/states/UserProvider.dart';
class Profile extends StatelessWidget {
  var appBar = 'Profile';
  get getAppBar => appBar;


  Widget choice_icon(BuildContext context, IconData icon, String label, Function handle){
    return InkWell(                   
            onTap: handle,
            child: Column(
              children: [
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: IconButton(
                    icon: Icon(icon),
                    iconSize: 20,
                    color: Colors.white,
                    onPressed: handle,
                  ),
                ),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white
                  )
                )
              ],
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    // return ListView(
    UserProvider user = Provider.of<UserProvider>(context, listen: false);
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
                            "${user.getSnap.data['firstname']} ${user.getSnap.data['surname']}".toUpperCase(),
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
                        profile_list(context, icon: Icons.account_box, title: "การซื้อของฉัน", isLast: false, widget: Padding(
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
                                  choice_icon(context, Icons.payment, "ที่ต้องชำระ",(){print("Sth");}),
                                  Container(width: 20, child: Divider(color:Colors.grey)),
                                  choice_icon(context, Icons.directions_bike, "ที่ต้องจัดส่ง", (){}),
                                  Container(width: 20, child: Divider(color:Colors.grey)),
                                  choice_icon(context, Icons.crop_square, "ที่ต้องได้รับ", (){}),
                                  Container(width: 20, child: Divider(color:Colors.grey)),
                                  choice_icon(context, Icons.rate_review, "ให้คะแนน", (){}),
                                ],
                              )
                            )
                          )
                        ),
                        profile_list(context, icon: Icons.favorite_border, title: "รายการโปรด", isLast: false),
                        profile_list(context, icon: Icons.account_balance, title: "เหรียญ Reward", isLast: false),
                        profile_list(context, icon: Icons.exit_to_app, title: "ออกจากระบบ", isLast: false),
                        profile_list(context, icon: Icons.info_outline, title: "เก่ียวกับเรา", isLast: true),
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