import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../components/notification.dart';
import '../../services/register/register_with_email_demo.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();


  String _name = '';
  String _surname = '';
  String _role = 'Member';
  String _email = '';
  String _password = '';
  String _repassword = '';
  String _url_img =
      "https://firebasestorage.googleapis.com/v0/b/fir-85cd1.appspot.com/o/profile_img%2Fimage_picker_8CD576E7-D6C7-4250-882F-498E2E323318-30394-00000FD6E3D4CFB2.jpg?alt=media&token=18bbe512-f0e9-4dff-9788-fae741183af3";

  File _image;
  String _fileName;

  List<DropdownMenuItem<int>> _role_list = [];
  int _selectedRole = 0;

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      FirebaseUser user;
      try {
        user = await registerWithEmailDemo(context: context,
            email: _email, password: _password, repassword: _repassword);
        Firestore.instance.collection('user').document(user.uid).setData(
            {'firstname': _name, 'surname': _surname, 'role': _role, 'url': _url_img});
        Navigator.pop(context);
        showMessageBox(context,
            title: "Success", content: "Create user: $_name success.");
      } catch (e) {
        print(e.code);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Register Page")),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    showProfileImg(),
                    showNameInput(),
                    showSurnameInput(),
                    showEmailInput(),
                    showPasswordInput(),
                    showRepasswordInput(),
                    showDropDownInput(),
                    showSubmitButton()
                  ],
                ))));
  }

  Future uploadImage() async {
    if(Platform.isIOS) {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      setState(() {
        _image = File(pickedFile.path);
        // _fileName = getFileName(File(pickedFile.path))as String;
      });
    }else if(Platform.isAndroid){
      
    }
    print(_image);
    print("Choose Success!");
  }

  Future uploadFile() async {
    StorageReference storageReference = FirebaseStorage.instance.ref().child('profile_img/${_fileName}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print("File Upload!");
    storageReference.getDownloadURL().then((fileUrl) {
      setState(() {
        _url_img = fileUrl;
      });
      print(fileUrl);
    });
  }

  Widget showProfileImg() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Center(
        child: _image != null ?
        IconButton(
          icon: CircleAvatar(
            backgroundImage: AssetImage(_image.path),
            radius: 100,
          ),
          iconSize: 200,
          onPressed: uploadImage,
        )
        : IconButton(
            icon: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 100,
              child: Text('Upload Image'),
            ),
            iconSize: 200,
            onPressed: uploadImage,
          )
      )
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      child: TextFormField(
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: InputDecoration(
              hintText: 'Email', icon: Icon(Icons.mail, color: Colors.grey)),
          validator: (value) => value.isEmpty ? "Email can 't be empty" : null,
          onSaved: (value) => _email = value.trim()),
    );
  }

  Widget showPasswordInput() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
        child: TextFormField(
            maxLines: 1,
            obscureText: true,
            autofocus: false,
            decoration: InputDecoration(
                hintText: 'Password',
                icon: Icon(Icons.lock, color: Colors.grey)),
            validator: (value) =>
                value.isEmpty ? "Password can 't be empty" : null,
            onSaved: (value) => _password = value.trim()));
  }

  Widget showRepasswordInput() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
        child: TextFormField(
          maxLines: 1,
          obscureText: true,
          autofocus: false,
          decoration: InputDecoration(
              hintText: 'Repassword',
              icon: Icon(Icons.lock, color: Colors.grey)),
          validator: (value) =>
              value.isEmpty ? "Repassword can 't be empty" : null,
          onSaved: (value) => _repassword = value.trim(),
        ));
  }

  Widget showNameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
      child: TextFormField(
        maxLines: 1,
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Name',
            icon: Icon(
              Icons.account_circle,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? "Name can 't be empty" : null,
        onSaved: (value) => _name = value.trim(),
      ),
    );
  }

  Widget showSurnameInput() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
        child: TextFormField(
          maxLines: 1,
          autofocus: false,
          decoration: InputDecoration(
              hintText: "Surname",
              icon: Icon(Icons.card_membership, color: Colors.grey)),
          validator: (value) =>
              value.isEmpty ? "Surname can 't be empty." : null,
          onSaved: (value) => _surname = value.trim(),
        ));
  }

  void loadMemberList() {
    _role_list = [];
    _role_list.add(new DropdownMenuItem(
      child: Text('Member'), value: 0));
    _role_list.add(new DropdownMenuItem(
      child: Text('Store'), value: 1));
  }

  Widget showDropDownInput() {
    loadMemberList();
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
        child: DropdownButton(
          icon: Icon(Icons.account_box),
          hint: Text("Select your role"),
          items: _role_list,
          value: _selectedRole,
          isExpanded: true,
          onChanged: (value) {
            setState(() {
              _selectedRole = value;
              _role = value == 0 ? 'Member' : 'Store';
            });
          },
        ));
  }

  Widget showSubmitButton() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 45, 0, 0),
        child: SizedBox(
            height: 40,
            child: RaisedButton(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Text("Register"),
                onPressed: () => validateAndSubmit())));
  }
}
