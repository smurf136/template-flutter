// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import './authentication.dart';

// class LoginSignupPage extends StatefulWidget {
//   LoginSignupPage({this.auth, this.loginCallback});

//   final BaseAuth auth;
//   final VoidCallback loginCallback;

//   @override
//   State<StatefulWidget> createState() => new _LoginSignupPageState();
// }

// class _LoginSignupPageState extends State<LoginSignupPage> {
//   final _formKey = new GlobalKey<FormState>();

//   String _name;
//   String _surname;
//   // String _idcard;
//   // String _patrolidcard;
//   String _email;
//   String _password;
//   String _errorMessage;

//   bool _isLoginForm;
//   bool _isLoading;

//   // Check if form is valid before perform login or signup
//   bool validateAndSave() {
//     final form = _formKey.currentState;
//     print(form.validate());
//     if (form.validate()) {
//       form.save();
//       return true;
//     }
//     return false;
//   }

//   // Perform login or signup
//   void validateAndSubmit() async {
//     setState(() {
//       _errorMessage = "";
//       _isLoading = true;
//     });
//     if (validateAndSave()) {
//       String userId = "";
//       try {
//         if (_isLoginForm) {
//           userId = await widget.auth.signIn(_email, _password);
//         } else {
//           userId = await widget.auth.signUp(_email, _password);

//           print('Signed up user: $userId');
//           //widget.auth.sendEmailVerification();
//           //_showVerifyEmailSentDialog();
//           var firebaseUser = await FirebaseAuth.instance.currentUser();
//           Firestore.instance
//               .collection('user')
//               .document(firebaseUser.uid)
//               .setData({
//             'uid': firebaseUser.uid,
//             'firstname': _name,
//             'surname': _surname,
//             'role': _selectedRole
//             // 'lat': _pickedLocation.geometry.location.lat,
//             // 'lng': _pickedLocation.geometry.location.lng
//           });
//           if (firebaseUser.uid != null) {
//             resetForm();
//             showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     title: Text("Account created!"),
//                     content: Text("Welcome $_name $_surname to Patrol App."),
//                     actions: <Widget>[
//                       FlatButton(
//                         child: Text("Ok"),
//                         onPressed: () {
//                           toggleFormMode();
//                           Navigator.of(context).pop();
//                         },
//                       )
//                     ],
//                   );
//                 });
//           }
//         }

//         if (userId.length > 0 && userId != null && _isLoginForm) {
//           widget.loginCallback();
//         }
//       } catch (e) {
//         print('Error: $e');
//         setState(() {
//           _isLoading = false;
//           _errorMessage = e.message;
//           _formKey.currentState.reset();
//         });
//       }
//     }
//   }

//   @override
//   void initState() {
//     _errorMessage = "";
//     _isLoading = false;
//     _isLoginForm = true;
//     super.initState();
//   }

//   void resetForm() {
//     _formKey.currentState.reset();
//     _errorMessage = "";
//   }

//   void toggleFormMode() {
//     resetForm();
//     setState(() {
//       _isLoginForm = !_isLoginForm;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         appBar: new AppBar(
//           title: new Text('Patrol App'),
//         ),
//         body: Stack(
//           children: <Widget>[
//             _isLoginForm == true ? _showForm() : _showSignUp()
//             // _showCircularProgress(),
//           ],
//         ));
//   }

//   Widget _showCircularProgress() {
//     if (_isLoading) {
//       return Center(child: CircularProgressIndicator());
//     }
//     return Container(
//       height: 0.0,
//       width: 0.0,
//     );
//   }

// //  void _showVerifyEmailSentDialog() {
// //    showDialog(
// //      context: context,
// //      builder: (BuildContext context) {
// //        // return object of type Dialog
// //        return AlertDialog(
// //          title: new Text("Verify your account"),
// //          content:
// //              new Text("Link to verify account has been sent to your email"),
// //          actions: <Widget>[
// //            new FlatButton(
// //              child: new Text("Dismiss"),
// //              onPressed: () {
// //                toggleFormMode();
// //                Navigator.of(context).pop();
// //              },
// //            ),
// //          ],
// //        );
// //      },
// //    );
// //  }

//   Widget _showForm() {
//     return new Container(
//         padding: EdgeInsets.all(16.0),
//         child: new Form(
//           key: _formKey,
//           child: new ListView(
//             shrinkWrap: true,
//             children: <Widget>[
//               showLogo(),
//               showEmailInput(),
//               showPasswordInput(),
//               showPrimaryButton(),
//               showSecondaryButton(),
//               showErrorMessage(),
//             ],
//           ),
//         ));
//   }

//   Widget _showSignUp() {
//     return new Container(
//         padding: EdgeInsets.all(16.0),
//         child: new Form(
//           key: _formKey,
//           child: new ListView(
//             shrinkWrap: true,
//             children: <Widget>[
//               showLogo(),
//               showEmailInput(),
//               showPasswordInput(),
//               showNameInput(),
//               showSurnameInput(),
//               showRoleSelect(),
//               showPrimaryButton(),
//               showSecondaryButton(),
//               showErrorMessage(),
//             ],
//           ),
//         ));
//   }

//   Widget showErrorMessage() {
//     if (_errorMessage.length > 0 && _errorMessage != null) {
//       return new Text(
//         _errorMessage,
//         style: TextStyle(
//             fontSize: 13.0,
//             color: Colors.red,
//             height: 1.0,
//             fontWeight: FontWeight.w300),
//       );
//     } else {
//       return new Container(
//         height: 0.0,
//       );
//     }
//   }

//   Widget showLogo() {
//     return new Hero(
//       tag: 'hero',
//       child: Padding(
//         padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
//         child: CircleAvatar(
//           backgroundColor: Colors.transparent,
//           radius: 48.0,
//           child: Image.asset('images/flutter-logo.png'),
//         ),
//       ),
//     );
//   }

//   Widget showEmailInput() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
//       child: new TextFormField(
//         maxLines: 1,
//         keyboardType: TextInputType.emailAddress,
//         autofocus: false,
//         decoration: new InputDecoration(
//             hintText: 'Email',
//             icon: new Icon(
//               Icons.mail,
//               color: Colors.grey,
//             )),
//         validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
//         onSaved: (value) => _email = value.trim(),
//       ),
//     );
//   }

//   Widget showPasswordInput() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
//       child: new TextFormField(
//         maxLines: 1,
//         obscureText: true,
//         autofocus: false,
//         decoration: new InputDecoration(
//             hintText: 'Password',
//             icon: new Icon(
//               Icons.lock,
//               color: Colors.grey,
//             )),
//         validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
//         onSaved: (value) {
//           _password = value.trim();
//           print("password: " + value.trim());
//         },
//       ),
//     );
//   }

//   Widget showNameInput() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
//       child: new TextFormField(
//         maxLines: 1,
//         obscureText: false,
//         autofocus: false,
//         decoration: new InputDecoration(
//             hintText: 'Name',
//             icon: new Icon(
//               Icons.short_text,
//               color: Colors.grey,
//             )),
//         validator: (value) => value.isEmpty ? 'Name can\'t be empty' : null,
//         onSaved: (value) => _name = value.trim(),
//       ),
//     );
//   }

//   Widget showSurnameInput() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
//       child: new TextFormField(
//         maxLines: 1,
//         obscureText: false,
//         autofocus: false,
//         decoration: new InputDecoration(
//             hintText: 'Surname',
//             icon: new Icon(
//               Icons.short_text,
//               color: Colors.grey,
//             )),
//         validator: (value) => value.isEmpty ? 'Surname can\'t be empty' : null,
//         onSaved: (value) => _surname = value.trim(),
//       ),
//     );
//   }

//   int _selectedRole = 0;

//   List<DropdownMenuItem<int>> roleList = [];

//   void loadGenderList() {
//     roleList = [];
//     roleList.add(new DropdownMenuItem(
//       child: new Text('Member'),
//       value: 0,
//     ));
//     roleList.add(new DropdownMenuItem(
//       child: new Text('Store'),
//       value: 1,
//     ));
//   }
//   Widget showRoleSelect() {
//     loadGenderList();
//     return Form(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(children: <Widget>[
//           DropdownButton(
//               icon: new Icon(Icons.account_box),
//               hint: Text('Select your role'),
//               items: roleList,
//               value: _selectedRole,
//               isExpanded: true,
//               onChanged: (value) {
//                 setState(() {
//                   _selectedRole = value; 
//                 });
//               })
//         ]),
//       ),
//     );
//   }

//   // Widget showRoleSelect() {
//   //   return Padding(
//   //     padding: const EdgeInsets.all(8.0),
//   //     child: Column(children: <Widget>[
//   //       DropdownButtonFormField(
//   //         hint: Text('Select your role'),
//   //         items: <DropdownMenuItem>[
//   //           // Put widgets in the drop down menu here

//   //         ],
//   //         onChanged: null,
//   //       )
//   //     ]),
//   //   );
//   // }

//   Widget showSecondaryButton() {
//     return new FlatButton(
//         child: new Text(
//             _isLoginForm ? 'Register' : 'Have an Account? Sign In',
//             style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
//         onPressed: toggleFormMode);
//   }

//   Widget showPrimaryButton() {
//     return new Padding(
//         padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
//         child: SizedBox(
//           height: 40.0,
//           child: new RaisedButton(
//             elevation: 5.0,
//             shape: new RoundedRectangleBorder(
//                 borderRadius: new BorderRadius.circular(30.0)),
//             color: Colors.orange[400],
//             child: new Text(_isLoginForm ? 'Sign In' : 'Register',
//                 style: new TextStyle(fontSize: 20.0, color: Colors.white)),
//             onPressed: () {
//               validateAndSubmit();
//             },
//           ),
//         ));
//   }
// }
