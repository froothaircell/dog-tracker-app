import 'package:brewcrewtrue/models/user.dart';
import 'package:brewcrewtrue/screens/authenticate/authenticate.dart';
import 'package:brewcrewtrue/screens/secondary_wrapper.dart';
import 'package:brewcrewtrue/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//  Primary wrapper to determine the status of the app (has a user logged in?)
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    // return either home or authentication widget
    if (user == null) {
      return Authenticate();
    } else {
      return StreamProvider<UserData>.value(
        value: DatabaseService(uid: user.uid).userData,
        child: SecWrapper(),
      );


    }
  }
}
