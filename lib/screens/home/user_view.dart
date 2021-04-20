import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brewcrewtrue/models/user.dart';

// Displays the specific user's information when
class UserView extends StatefulWidget {
  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {

    final currUser = Provider.of<UserData>(context) ?? null;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Text('Pet Name: ' + currUser.name, style: TextStyle(color: Colors.brown[800], fontSize: 30.0, fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child: Text('Pet Location: ' + currUser.location, style: TextStyle(color: Colors.brown[800], fontSize: 30.0, fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
          child: Text('Pet Resting Time: ' + currUser.restingTime.toString(), style: TextStyle(color: Colors.brown[800], fontSize: 30.0, fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
          child: Text('Pet Temperature: ' + currUser.temperature.toString(), style: TextStyle(color: Colors.brown[800], fontSize: 30.0, fontWeight: FontWeight.bold),),
        )

      ],
    );
  }
}
