import 'package:ajeeb/authenticate/register_as_customer.dart';
import 'package:ajeeb/authenticate/register_as_event_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:ajeeb/services/auth.dart';
import 'package:ajeeb/shared/constants.dart';
import 'package:ajeeb/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class SignIn extends StatefulWidget {
  final Function toggleView1;
  SignIn({this.toggleView1});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  //String dropdownValue = '';
//  List<String> _SignUpOptions = ['As Customer', 'As Event Manager']; // Option 2
//  String _selectedOption; // Option 2

  TextEditingController emailEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal[400],
          elevation: 0.0,
          title: Text('Sign in to Penta Events'),
//              actions: <Widget>[
//                DropdownButton<String>(
//                  value: dropdownValue,
//                  icon: Icon(Icons.arrow_downward),
//                  iconSize: 24,
//                  elevation: 16,
//                  style: TextStyle(color: Colors.deepPurple),
//                  underline: Container(
//                    height: 2,
//                    color: Colors.deepPurpleAccent,
//                  ),
//                  onChanged: (String newValue) {
//                    setState(() {
//                      dropdownValue = newValue;
//                    });
//                  },
//                  items: <String>['As Customer', 'As Event Manager']
//                      .map<DropdownMenuItem<String>>((String value) {
//                    return DropdownMenuItem<String>(
//                      value: value,
//                      child: Text(value),
//                    );
//                  }).toList(),
//                )

//                FlatButton.icon(
//                  icon: Icon(Icons.person, color: Colors.white),
//                  label: Text(
//                    'Dont have an account? SignUp',
//                    style: TextStyle(color: Colors.white, fontSize: 14.0),
//                  ),
//                  onPressed: () => widget.toggleView(),
//                ),
//              ],
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: new BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('assets/des.jpg')),
            ),
            child: Column(
              children: <Widget>[
                Center(
                    child: SingleChildScrollView(
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(24),
                        // child: Center(
                        //child: Padding,
                        //padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                        //padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 20.0),
                              TextFormField(
                                maxLines: 1,
                                keyboardType: TextInputType.emailAddress,
                                controller: emailEditingController,
                                autofocus: false,
                                decoration: new InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(1.0)),
                                    borderSide: BorderSide(
                                      color: Colors.teal,
                                      //Color of the border
                                      style: BorderStyle.solid,
                                      //Style of the border
                                      width: 2.5, //width of the border
                                    ),
                                  ),
                                  labelText: "Email",
                                  hintText: 'Email...',
                                  icon: new Icon(
                                    Icons.mail,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),),
//                decoration: textInputDecoration.copyWith(hintText: 'Email...'),
                                validator: (val) =>
                                val.isEmpty ? 'Enter an email' : null,
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                              ),
                              SizedBox(height: 20.0),
                              TextFormField(
                                maxLines: 1,
                                obscureText: true,
                                autofocus: false,
                                keyboardType: TextInputType.text,
                                //controller: emailEditingController,
                                decoration: new InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(1.0)),
                                    borderSide: BorderSide(
                                      color: Colors.teal,
                                      //Color of the border
                                      style: BorderStyle.solid,
                                      //Style of the border
                                      width: 2.5, //width of the border
                                    ),
                                  ),
                                  labelText: "Password",
                                  hintText: 'Password...',
                                  icon: new Icon(
                                    Icons.lock,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                                // decoration: textInputDecoration.copyWith(hintText: 'Password...'),
                                // validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null ,
                                validator: (val) {
                                  if (val.isEmpty) {
                                    return 'Please enter a Password';
                                  } else if (val.length < 6) {
                                    return 'Enter a password 6+ chars long';
                                  }
                                  return null;
                                },
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                              ),
                              SizedBox(height: 20.0),
                              RaisedButton(
                                  color: Colors.teal,
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0,
                                        color: Colors.white),
                                  ),

                                elevation: 10.0,

                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(15.0),
                                  ),
                                  //color: Colors.teal,
                                  // textColor: Colors.white,

                                  onPressed: () async {
                                    if (_formKey.currentState.validate())
                                    {
                                      setState(() => loading = true);
                                      dynamic result =
                                      await _auth.signInWithEmailAndPassword(
                                          email, password);
                                      if (result == null) {
                                        setState(() {
                                          loading = false;
                                          error = 'Incorrect Email/Password';
                                        });
                                      }
                                    }
                                  }),
                              SizedBox(height: 12.0),
                              Text(
                                error,
                                style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                              ),




//                Column(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  mainAxisAlignment: MainAxisAlignment.center,
//                ),
//                SizedBox(height: 12.0),
//                Text('Dont have an account?',
//                  style: TextStyle(color: Colors.black, fontSize: 14.0),
//                ),

//                    DropdownButton(
//                      //color: Colors.white,
//                      hint: Text('Dont have an Account? Sign Up',
//                          style: TextStyle(color: Colors.black, fontSize: 14.0),
//
//                      ),
//                      value: _selectedOption,
//                      onChanged: (newValue) {
//                        setState(() {
//                          _selectedOption = newValue;
//                        });
//                      },
//                      items: _SignUpOptions.map((location) {
//                        return DropdownMenuItem(
//                          child: new Text(location),
//                          value: location,
//                        );
//                      }).toList(),
//                    ),

                            ],
                          ),
                        ),
                      ),


                    )
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.all(8.0),
                      height: 55.0,
                      width: 200.0,
                      child: RaisedButton(
                        onPressed: () {
                          widget.toggleView1();
                          //SignUpAs(context);
                        },
                        color: Colors.teal,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(15.0),
                        ),
                        textColor: Colors.white,
                        child: const Text('Dont have an account? Sign Up!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              color: Colors.white),
                        ),
                        elevation: 10.0,


                      ),
                    )
                ),

              ],
            ),
          ),
        )
    );

  }
}


//void SignUpAs(BuildContext context) {
//  var alertDialog = AlertDialog(
//      title: Text("SignUp As...."),
//      //content: Text("Now press Okay for going to login screen or press cancel for going to main screen. "),
//      actions: <Widget>[
//
//
//
//
//        RaisedButton(
//          shape: new RoundedRectangleBorder(
//            borderRadius: new BorderRadius.circular(15.0),
//          ),
//          child: Text('Event Manager'),
//          onPressed: () {
//            Navigator.push(context, MaterialPageRoute(builder: (context) {
//              return RegisterAsEventManager();
//            }));
//          },
//          elevation: 10.0,
//          color: Colors.teal,
//        ),
//
//        RaisedButton(
//          shape: new RoundedRectangleBorder(
//            borderRadius: new BorderRadius.circular(15.0),
//          ),
//          child: Text('Customer'),
//          onPressed: () {
//            Navigator.push(context, MaterialPageRoute(builder: (context) {
//              return RegisterAsCustomer();
//            }));
//          },
//          elevation: 10.0,
//          color: Colors.teal,
//        )
//
//      ]
//  );
//  //Navigator.of(context).pop();
//  showDialog(
//      context: context,
//      builder: (BuildContext context) {
//        return alertDialog;
//      }
//  );
//}