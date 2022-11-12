import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_user/widgets/appbar/normal_appbar.dart';
import 'package:taxi_user/widgets/drawer/drawer_widget.dart';
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
      drawer: const DrawerWidget(),
      appBar: NormalAppbar('Saved Locations', Colors.white),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: SavedLocationsPage._camPosition,
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                myLocationMarker(markers, context);
              });
              _controller.complete(controller);
            },
          ),
          SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Icon(
                              Icons.location_on_rounded,
                              size: 32,
                              color: Colors.red[700],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Image.asset('assets/images/Arrow 3.png'),
                          const SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(
                              Icons.local_taxi_rounded,
                              size: 32,
                              color: Colors.green[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    height: 120,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
