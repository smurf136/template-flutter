import 'package:cloud_firestore/cloud_firestore.dart';

String getImage() {  
  Firestore.instance.collection('user').document("u1").get().then((snap) {
    return snap.data['url1'];
  });
}