// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:multi_image_picker/multi_image_picker.dart';

// class TestUpload extends StatefulWidget {
//   @override
//   _TestUploadState createState() => _TestUploadState();
// }

// class _TestUploadState extends State<TestUpload> {
//   var appBar = "Test Upload";
//   List<Asset> images = List<Asset>();
//   String _error = "No error detected";
  
//   get getAppBar => appBar;

//   @override
//   void initState() {
//     super.initState();
//   }
  
//   void _onTap() async {
//     List<Asset> resultList = List<Asset>();
//     String error = "No error detected";
     
//     try{
//       resultList = await MultiImagePicker.pickImages(
//         maxImages: 300,
//         enableCamera: true,
//         selectedAssets: images,
//         cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
//         materialOptions: MaterialOptions(
//           actionBarColor: "#abcdef",
//           actionBarTitle: "Example App",
//           allViewTitle: "All Photos",
//           useDetailsView: false,
//           selectCircleStrokeColor: "#000000",
//         )
//       );
//     }on Exception catch (e) {
//       error = e.toString();
//     }

//     if (!mounted) return;

//     setState(() {
//       images = resultList;
//       _error = error;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         children: [
//           Center(child: Text('Error: $_error')),
//           RaisedButton(
//             child: Text("Upload"),
//             onPressed: _onTap,
//           ),
//           Expanded(
//             child: GridView.count(
//               crossAxisCount: 3,
//               children: List.generate(images.length, (index){
//                 Asset asset = images[index];
//                 return AssetThumb(
//                   asset: asset,
//                   width: 300,
//                   height: 300
//                 );
//               })
//             )
//           )
//         ],
//       )
//     );
//   }
// }