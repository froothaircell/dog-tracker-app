import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//  Displays Location on map according to provided coordinates
class Maps extends StatefulWidget {

  final double lat;
  final double lon;

  Maps({ this.lat, this.lon });

  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  GoogleMapController _controller;
  MapType _currentMapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:  Text('Maps'),
        backgroundColor: Colors.brown[400],
      ),
      body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:  GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(widget.lat, widget.lon),
                zoom: 15.0,
              ),
              mapType: _currentMapType,
              onMapCreated: (GoogleMapController controller){
                setState(() {
                  _controller = controller;
                  _controller.getVisibleRegion();
                });
              },
            ),
          )
      ),
    );
  }
}
