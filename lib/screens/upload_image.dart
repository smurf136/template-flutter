import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UploadImage extends StatefulWidget {
  UploadImage({Key key, @required this.uid}) : super(key : key);
  final uid;
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  // _UploadImageState({Key key, @required this.uid});
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  File _image;
  final picker = ImagePicker();
  String _uploadedFileURL;
  String _fileName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Firestore File Upload")),
        body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Selected Image'),
                _image != null
                    ? Image.asset(
                        _image.path,
                        height: 150,
                      )
                    : Container(height: 150),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: RaisedButton(
                          child: Text("Choose File"),
                          onPressed: chooseFile,
                          color: Colors.cyan,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                          child: RaisedButton(
                            child: Text("Upload File"),
                            onPressed: uploadFile,
                            color: Colors.cyan,
                          ))
                    ],
                  ),
                Text("Upload Image"),
                _uploadedFileURL != null
                    ? Image.network(_uploadedFileURL, height: 150)
                    : Container(),
              ],
          )));
  }

  Future chooseFile() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile.path);
      _fileName = basename(pickedFile.path);
    });
    print("Choose Success!");
  }

  Future uploadFile() async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child('profile_img/${_fileName}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
      });
      print(fileURL);
    });
    FirebaseUser user = await _auth.currentUser();
    String uid = user.uid;
    print(uid);
    Firestore.instance.collection("user").document(uid).updateData({'url': _uploadedFileURL}).then((value){
      print("Update firestore success.");
    }).catchError((e) {
      print(e);
    });
  }
}
