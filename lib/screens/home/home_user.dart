import 'package:brewcrewtrue/models/user.dart';
import 'package:brewcrewtrue/screens/home/map_view.dart';
import 'package:brewcrewtrue/screens/home/settings_form.dart';
import 'package:brewcrewtrue/screens/home/user_view.dart';
import 'package:brewcrewtrue/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//  Home screen for users
class HomeUser extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    final currUser = Provider.of<UserData>(context) ?? null;

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingForm(),
        );
      });
    }

//    Displaying the information of the specific user and allowing it to be
//    edited
    return Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Dollar User'),
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
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: UserView(),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Maps(lat: currUser.latLon[0], lon: currUser.latLon[1],))
            );
          },
          child: Icon(Icons.navigation),
        ),
      );
  }
}

