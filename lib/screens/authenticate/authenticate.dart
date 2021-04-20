import 'package:brewcrewtrue/screens/authenticate/register.dart';
import 'package:brewcrewtrue/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

//  Authenticate Screen
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

//  Determines whether to show sign in screen or register screen
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn){
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
