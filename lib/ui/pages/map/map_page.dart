// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapPage extends StatefulWidget {
//   @override
//   State<MapPage> createState() => MapPageState();
// }

// class MapPageState extends State<MapPage> {
//   Completer<GoogleMapController> _controller = Completer();

//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   static final CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: GoogleMap(
//         mapType: MapType.hybrid,
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: _goToTheLake,
//         label: Text('To the lake!'),
//         icon: Icon(Icons.directions_boat),
//       ),
//     );
//   }

//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
// }

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:mobile_app/ui/repository/vehicles_repository.dart';

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
            }
            //  Marker(markerId: MarkerId('p1'), position: _center),
            ),
      ),
    );
  }
}
