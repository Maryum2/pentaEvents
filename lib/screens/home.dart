// ignore: avoid_web_libraries_in_flutter
//import 'dart:html';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:ajeeb/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:image_picker/image_picker.dart';

//class Home extends StatefulWidget {

class Home extends StatefulWidget {
  _Home createState() => _Home();
}

class _Home extends State<Home> {


//  File imageFile;
////  File _image;
////  String _uploadedFileURL;
//  _openGallery(BuildContext context) async {
//    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
//    this.setState(() {
//      imageFile = picture ;
//    });
//    Navigator.of(context).pop();
//  }
//
//  _openCamera(BuildContext context) async {
//    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
//    this.setState(() {
//      imageFile = picture;
//    });
//    Navigator.of(context).pop();
//  }
//
//  Future<void> _showDialog(BuildContext context) {
//    return showDialog(
//        context: context,
//        builder: (BuildContext context) {
//          return AlertDialog(
//            shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.all(Radius.circular(10.0))
//            ),
//            backgroundColor: Colors.grey,
//            // contentPadding: EdgeInsets.all(10.0),
//            title: Text(
//              "Make a Choice!",
//              style: TextStyle(
//                fontWeight: FontWeight.bold,
//                fontStyle: FontStyle.italic,
//                fontSize: 25.0,
//              ),
//            ),
//            content: SingleChildScrollView(
//                child: ListBody(
//                    children: <Widget>[
//                      GestureDetector(
//
//                        child: Text("Gallery"),
//                        onTap: () {
//                          _openGallery(context);
//                        },
//                      ),
//                      Padding(padding: EdgeInsets.all(15.0)),
//                      GestureDetector(
//                        child: Text("Camera"),
//                        onTap: () {
//                          _openCamera(context);
//                        },
//                      ),
//                    ])),
//          );
//        });
//  }
//
//  Widget _decideImageView() {
//    // ignore: unrelated_type_equality_checks
//    if (imageFile == null) {
//      return Container(
//        height: 95.0,
//        width: 95.0,
//        decoration: BoxDecoration(
//            shape: BoxShape.circle,
//            image: DecorationImage(
//              fit: BoxFit.fill,
//              image: AssetImage('assets/noimg.jpg'),
////              fit: 400,
////              height: 400,
//              //Image.file(imageFile,width:400 ,height:400);
//            ),
//            border: Border.all(color: Colors.white, width: 3.0)),
//      );
//    } else {
//      return Container(
//        height: 95.0,
//        width: 95.0,
//        decoration: BoxDecoration(
//            shape: BoxShape.circle,
//            image: DecorationImage(
//                fit: BoxFit.fill,
//                image: FileImage(this.imageFile)
//              //image: Image.file(imageFile),
//            ),
//            border: Border.all(color: Colors.white, width: 3.0)),
//      );
//
//      //Image.file(imageFile,width:400 ,height:400);
//
//    }
//  }
//
//
//
//
//
//
//
//
//
//
//

  final AuthService _auth = AuthService();

//

  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("PENTA EVENTS");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        backgroundColor: Colors.grey[200],
      //resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                setState(() {
                  if (this.cusIcon.icon == Icons.search) {
                    this.cusIcon = Icon(Icons.arrow_back);
                    this.cusSearchBar = TextField(
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(

                        border: InputBorder.none,
//                      border: OutlineInputBorder(
//                          borderRadius: BorderRadius.all(Radius.circular(25.0))),
                        hintText: "Search",
                      ),

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    );
                  } else {
                    this.cusIcon = Icon(Icons.search);
                    this.cusSearchBar = Text("PENTA EVENTS");
                  }
                });
              },
              icon: cusIcon,
            ),
          ],
          title: cusSearchBar,
        ),

        drawer: new Drawer(
            child: new ListView(children: <Widget>[
              new UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.teal),
                //accountName: new Text("Harper"),
                //accountEmail: new Text("harper@gmail.com"),
                currentAccountPicture: new GestureDetector(
                    child: new CircleAvatar(
                      backgroundImage: new AssetImage('assets/cust.jpg'),
                    )),
              ),
              new ListTile(
                leading: Icon(Icons.phone_in_talk),
                title: new Text("Contact us"),
//      onTap: () {
//      Navigator.push(context, MaterialPageRoute(builder: (context) {
//      return Contact();
//      }));
//      },
              ),
              new ListTile(
                leading: Icon(Icons.people),
                title: new Text("About us"),
//      onTap: () {
//      Navigator.push(context, MaterialPageRoute(builder: (context) {
//      return About();
//      }));
//      },
              ),
              new ListTile(
                leading: Icon(Icons.comment),
                title: new Text("Reviews"),
//      onTap: () {
//      Navigator.push(context, MaterialPageRoute(builder: (context) {
//      return AddReview();
//      }));
//      },
              ),
              new ListTile(
                leading: Icon(Icons.star),
                title: new Text("Ratings"),
//      onTap: () {
//      Navigator.push(context, MaterialPageRoute(builder: (context) {
//      return Rate();
//      }));
//      },
              ),
//
              new ListTile(
                leading: Icon(Icons.edit),
                title: new Text("Edit Credentials"),
//      onTap: () {
//      Navigator.push(context, MaterialPageRoute(builder: (context) {
//      return EditCredentials();
//      }));
//      },
              ),
              new ListTile(
                leading: Icon(Icons.lock),
                title: new Text("Logout"),
                onTap: () async {
                  await _auth.signOut();
                },
//      onTap: () {
//      Navigator.push(context, MaterialPageRoute(builder: (context) {
//      return CustLogIn();
//      }));
//      },
              ),
            ])),

        body: Container(
          decoration: new BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/des.jpg')),
          ),







//  @override
//  Widget build(BuildContext context) {
//    return Container(
//        child: Scaffold(
//          backgroundColor: Colors.teal[50],
//          appBar: AppBar(
//            title: Text('Penta Events'),
//            backgroundColor: Colors.teal[400],
//            elevation: 0.0,
//            actions: <Widget>[
//            FlatButton.icon(
//              icon: Icon(Icons.person),
//              label: Text('logout'),
//              onPressed: () async {
//                await _auth.signOut();
//              },
//            ),
//
//
//            ],
        )
    );
  }
}


//              body: Swiper(
//                itemCount: 3,
//                itemBuilder: (BuildContext context,int index){
//                  return Row(
//                    children: <Widget>[
//                      Expanded(
//                          child: Stack(children: <Widget>[
//                            _decideImageView(),
//                            IconButton(
//                              icon: Icon(Icons.edit),
//                              color: Colors.white,
//                              onPressed: () {
//                                _showDialog(context);
//                              },
//                            )
//                          ]))
//                    ],
//                  );
//                },
//                viewportFraction: 0.8,
//                 scale: 0.9,
//                control: SwiperControl(),
//                pagination: SwiperPagination(),
//                itemHeight: 300.0,
//                itemWidth: 300.0,
//                layout: SwiperLayout.CUSTOM,
//                customLayoutOption: CustomLayoutOption(startIndex : -1,
//                stateCount: 3).addRotate([-45.0 /100 ,0.0,45.0/100]).addTranslate([
//                  Offset(-370.0 ,-40.0),
//                  Offset(0.0,0.0),
//                  Offset(370.0,-40.0)
//                ]),
//              )





































