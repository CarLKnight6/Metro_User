import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

myLocationMarker(Set<Marker> markers, BuildContext context) async {
  Marker mark1 = const Marker(
      markerId: MarkerId('mark1'),
      infoWindow: InfoWindow(
        title: 'Your Current Location',
      ),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(37.42796133580664, -122.085749655962));

  markers.add(mark1);
}
