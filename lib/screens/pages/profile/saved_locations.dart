import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_user/widgets/appbar/normal_appbar.dart';
import 'package:taxi_user/widgets/markers/my_location_marker.dart';

class SavedLocationsPage extends StatefulWidget {
  static const CameraPosition _camPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  State<SavedLocationsPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SavedLocationsPage> {
  final Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAppbar('Saved Locations', Colors.grey[300]!),
      body: GoogleMap(
        mapType: MapType.normal,
        markers: markers,
        initialCameraPosition: SavedLocationsPage._camPosition,
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            myLocationMarker(
                markers, context, 37.42796133580664, -122.085749655962);
          });
          _controller.complete(controller);
        },
      ),
    );
  }
}
