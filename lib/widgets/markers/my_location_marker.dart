import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_user/widgets/buttons/button_widget.dart';

import '../dialogs/booking_details_dialog.dart';
import '../text/text_bold.dart';
import '../text/text_regular.dart';

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
