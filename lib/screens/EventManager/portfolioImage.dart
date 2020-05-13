import 'package:ajeeb/models/eventManager.dart';
import 'package:ajeeb/screens/EventManager/ViewProfile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:http/http.dart' as http;



class UploadPortfolio extends StatefulWidget {
   @override
   _UploadPortfolioState createState() => _UploadPortfolioState();
 }

 class _UploadPortfolioState extends State<UploadPortfolio> {
   String _path;
   Map<String, String> _paths;
   String _extension;
   FileType _pickType;
   bool _multiPick = false;
   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
   List<StorageUploadTask> _tasks = <StorageUploadTask>[];

   void openFileExplorer() async {
     try {
       _path = null;
       if (_multiPick) {
         _paths = await FilePicker.getMultiFilePath(
             type: FileType.any, allowedExtensions: ['jpg', 'jpeg', 'png','webm','mpg','ogg','mp4','avi','mov']);
       } else {
         _path = await FilePicker.getFilePath(
             type: _pickType, allowedExtensions: ['jpg', 'jpeg', 'png','webm','mpg','ogg','mp4','avi','mov']);
       }
       uploadToFirebase();
     } on PlatformException catch (e) {
       print("Unsupported operation" + e.toString());
     }
     if (!mounted){ return;}
   }

   uploadToFirebase() {
     if (_multiPick) {
       _paths.forEach((fileName, filePath) => {upload(fileName, filePath)});
     } else {
       String fileName = _path.split('/').last;
       String filePath = _path;
       upload(fileName, filePath);
     }
   }

   upload(fileName, filePath) {
     _extension = fileName.toString().split('.').last;
     final StorageReference storageRef=FirebaseStorage.instance.ref().child("Portfolio").child(fileName);
     final StorageUploadTask uploadTask = storageRef.putFile(
       File(filePath),
       StorageMetadata(
         contentType: '$_pickType/$_extension',
       ),
     );
     setState(() {
       _tasks.add(uploadTask);
     });
   }

   dropDown() {
     return DropdownButton(
       hint: new Text('Select'),
       value: _pickType,
       items: <DropdownMenuItem>[
         new DropdownMenuItem(
           child: new Text('Image'),
           value: FileType.image,
         ),
         new DropdownMenuItem(
           child: new Text('Video'),
           value: FileType.video,
         ),
         new DropdownMenuItem(
           child: new Text('Any'),
           value: FileType.any,
         ),
       ],
       onChanged: (value) => setState(() {
         _pickType = value;
       }),
     );
   }





     @override
   Widget build(BuildContext context) {
     return Scaffold(
       key: _scaffoldKey,
       appBar: new AppBar(
         title: new Text('Penta Events'),
         backgroundColor: Colors.teal,
       ),
       body: Container(
           padding: EdgeInsets.all(7.0),
           //alignment: Alignment.topLeft,
           child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               children: <Widget>[
             Text(
               "Porfolio:",
               style: TextStyle(
                   fontSize: 30.0,
                   fontWeight: FontWeight.bold),
             ),
             //leading: new Icon(Icons.color_lens),
            dropDown(),
             SwitchListTile.adaptive(
               title: Text('Pick multiple files', textAlign: TextAlign.left),
               onChanged: (bool value) => setState(() => _multiPick = value),
               value: _multiPick,
             ),
             OutlineButton(
               onPressed: () => openFileExplorer(),
               child: new Text("Open file picker"),
             ),
           ])),

     );
   }
 }
