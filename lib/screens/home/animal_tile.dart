import 'package:brewcrewtrue/screens/home/map_view.dart';
import 'package:brewcrewtrue/screens/home/settings_form_admin.dart';
import 'package:flutter/material.dart';
import 'package:brewcrewtrue/models/animal.dart';

//  Animal tile structure per each animal on the animal list
class AnimalTile extends StatefulWidget {

  final Animal animal;
  AnimalTile({ this.animal });

  @override
  _AnimalTileState createState() => _AnimalTileState();
}

class _AnimalTileState extends State<AnimalTile> {

//  Settings panel
  void _showSettingsPanel() {
    showModalBottomSheet(context: context, builder: (context) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
        child: SettingFormAdmin(uid: widget.animal.animalId),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(widget.animal.animalId);
    return Container(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),

//        List Structure
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.blue[widget.animal.restingTime - widget.animal.restingTime%100],
          ),
          title: Text(widget.animal.name + ' - ' + widget.animal.temperature.toString() + ' - ' + widget.animal.restingTime.toString()),
          subtitle: Text(widget.animal.location),

//          Map displayed on tap
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Maps(lat: widget.animal.latLon[0], lon: widget.animal.latLon[1],))
            );
          },

//          Settings displayed on long press
          onLongPress: () {
            _showSettingsPanel();
          },
        ),
      ),
    );
  }
}
