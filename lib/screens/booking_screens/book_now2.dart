import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_user/widgets/drawer/drawer_widget.dart';
import 'package:taxi_user/widgets/markers/my_location_marker.dart';
import 'package:taxi_user/widgets/text/text_bold.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';

class BookNow2 extends StatefulWidget {
  static const CameraPosition _camPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  State<BookNow2> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<BookNow2> {
  final Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.grey[300],
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
            ),
          ]),
      body: Stack(
        children: [
          GoogleMap(
            markers: markers,
            mapType: MapType.normal,
            initialCameraPosition: BookNow2._camPosition,
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                myLocationMarker(markers, context);
              });
              _controller.complete(controller);
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 2.5),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBold(
                            text: 'Arriving by 2:45pm',
                            fontSize: 18,
                            color: Colors.black),
                        const SizedBox(
                          height: 5,
                        ),
                        TextRegular(
                            text: 'Driver on the way!',
                            fontSize: 14,
                            color: Colors.black),
                        const SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Image.asset('assets/images/Arrow 3.png'),
                        ),
                      ],
                    ),
                  ),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 2.5, 10, 10),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: const CircleAvatar(
                            minRadius: 25,
                            maxRadius: 25,
                            backgroundColor: Colors.black,
                          ),
                          title: TextBold(
                              text: 'Lance O. Olana',
                              fontSize: 18,
                              color: Colors.black),
                          subtitle: TextBold(
                              text: 'Honda 123456',
                              fontSize: 12,
                              color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 240,
                              height: 50,
                              child: TextFormField(
                                textCapitalization:
                                    TextCapitalization.sentences,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Quicksand'),
                                onChanged: (_input) {},
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.send),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.chat_rounded,
                                    color: Colors.grey,
                                  ),
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  hintText: 'Chat with your driver',
                                  hintStyle: const TextStyle(
                                    fontFamily: 'QRegular',
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.phone_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
