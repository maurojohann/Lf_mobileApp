import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  final double lat;
  final double lng;

  const MapPage(
    this.lat,
    this.lng,
  );

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final LatLng _center = LatLng(widget.lat, widget.lng);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Localização Atual'),
          backgroundColor: Colors.green[700],
          actions: [
            IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 13.0,
          ),
          markers: {
            Marker(markerId: MarkerId('p1'), position: _center),
          },
        ),
      ),
    );
  }
}
