import 'package:flashchat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flashchat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              TextFormField(
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(color: Colors.black),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFormField(
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(color: Colors.black),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      //Implement login functionality.
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        final newUser = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (newUser != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatScreen()));
                        }
                      } catch (e) {
                        print(e.toString());
                        setState(() {
                          showSpinner = false;
                        });
                      }
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Log In',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
