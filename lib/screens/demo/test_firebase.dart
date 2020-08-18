// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:template/services/demo/firebase.dart';
// class TestFirebase extends StatelessWidget {
//   var appBar = "Firebase Test";
//   var test;

//   get getAppBar => appBar;

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: Firestore.instance.collection('user').document('u1').get(),
//       builder: (context, snapshot) {
//         if(snapshot.hasData){
//           if(snapshot.data['url1'] != null){
//             return Expanded(
//               child: Column(
//                 children: [
//                   Image.network(snapshot.data['url1']),
//                   Image.network(snapshot.data['url2']),
//                 ],
//               )
//             );
//           }
//         }
//       },
//     );
//   }
// }