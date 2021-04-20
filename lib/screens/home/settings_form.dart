import 'package:brewcrewtrue/models/user.dart';
import 'package:brewcrewtrue/services/database.dart';
import 'package:brewcrewtrue/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:brewcrewtrue/shared/constants.dart';
import 'package:provider/provider.dart';

// Settings form to be displayed whenever an entry must be edited from a user
class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {

  final _formKey = GlobalKey<FormState>();

  // form values
  String _currentName;
  String _currentLocation;
  int _currentTemperature;
  int _currentRestingTime;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
//      uid provided by specific user's data
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if(snapshot.hasData){

            UserData userData = snapshot.data;

            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'update animal information',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration,
                    validator: (val) => val.isEmpty ? 'please enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(height: 5.0),

                  TextFormField(
                    initialValue: userData.location,
                    decoration: textInputDecoration,
                    validator: (val) => val.isEmpty ? 'please enter a location' : null,
                    onChanged: (val) => setState(() => _currentLocation = val),
                  ),
                  SizedBox(height: 5.0),

                  // Slider
                  Slider(
                    value: (_currentTemperature ?? userData.temperature).toDouble(),
                    activeColor: Colors.brown[(_currentTemperature == null || _currentTemperature <= 10) ? 100 : ((_currentTemperature - 10)*10 - (_currentTemperature*10)%100)],
                    inactiveColor: Colors.brown[100],
                    min: 20,
                    max: 100,
                    divisions: 300,
                    onChanged: (val) => setState(() => _currentTemperature = val.round()),
                  ),

                  Slider(
                    value: (_currentRestingTime ?? userData.restingTime).toDouble(),
                    activeColor: Colors.brown[(_currentRestingTime == 100 || _currentRestingTime == null) ? 100 : (_currentRestingTime - _currentRestingTime%100)],
                    inactiveColor: Colors.brown[100],
                    min: 100,
                    max: 900,
                    divisions: 16,
                    onChanged: (val) => setState(() => _currentRestingTime = val.round()),
                  ),

                  RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if(_formKey.currentState.validate()) {
                        await DatabaseService(uid: user.uid).updateUserData(
                          _currentLocation ?? userData.location,
                          _currentName ?? userData.name,
                          userData.isAdmin,
                          _currentTemperature ?? userData.temperature,
                          _currentRestingTime ?? userData.restingTime,
                          user.uid,
                        );
                        Navigator.pop(context);
                      }
                    },
                  )
                ],
              ),
            );
          } else {
//            Displays loading screen should data be unavailable
            return Loading();
          }

        }
    );
  }
}
