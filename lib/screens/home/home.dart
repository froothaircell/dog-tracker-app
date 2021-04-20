import 'package:brewcrewtrue/models/animal.dart';
import 'package:brewcrewtrue/screens/home/animal_list.dart';
import 'package:brewcrewtrue/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brewcrewtrue/services/database.dart';
import 'package:provider/provider.dart';

//  Home screen for administrators
class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

//    StreamProvider provides a stream of the specified data type to all
//    inheritor widgets. This allows all widgets inheriting from this widget to
//    access that data.
    return StreamProvider<List<Animal>>.value(
      value: DatabaseService().animals,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Dollar Admin'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: AnimalList(),
      ),
    );
  }
}
