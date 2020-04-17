//import 'package:ajeeb/screens/wrapper.dart';
import 'package:ajeeb/screens/wrapperEvent.dart';
import 'package:ajeeb/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ajeeb/models/eventManager.dart';

void main() => runApp(MyApp1());

class MyApp1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<EventManager>.value(
      value: AuthService().eventManager,
      child: MaterialApp(
        home: WrapperEvent(),
      ),
    );
  }
}