import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

myLocationMarker(
    Set<Marker> markers, BuildContext context, double lat, double lang) async {
  Marker mark1 = Marker(
      markerId: const MarkerId('mark1'),
      infoWindow: const InfoWindow(
        title: 'Your Current Location',
      ),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(lat, lang));

  markers.add(mark1);
}
