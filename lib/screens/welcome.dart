import 'package:ajeeb/screens/CustEvent.dart';
import 'package:flutter/material.dart';


import '../main.dart';
//import 'package:flutter_fyp/main2.dart';
void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MyWelcome()
  ));
}

class MyWelcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body:
          Container(
              decoration: new BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/des.jpg')),
              ),
              child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 500.0,

                      //width: 400.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage('assets/bgimg9.jpg'))),
                    ),
//                    new Image.asset("assets/bgimg.jpg"),
                    Container(
                      margin: EdgeInsets.all(100.0),
                      // alignment:Alignment.bottomCenter,
                      // margin:  EdgeInsets.all(4.0),
                      height: 55.0,
                      width: 200.0,

                     child: RaisedButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0),

                          side: BorderSide(
                            color: Colors.white, //Color of the border
                            style: BorderStyle.solid, //Style of the border
                            width: 2.0, //width of the border
                          ),
                        ),
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return CustEvent();
                          }));
                        },
                        child: Text("Welcome",
                            style:TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            )),
                        elevation: 10.0,
                        //splashColor: Colors.black12,
                        color: Colors.teal,
                      ),



                    ),
            ]
    )

    )
    )
    );
  }
}