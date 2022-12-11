import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:taxi_user/services/cloud_function/add_message.dart';
import 'package:taxi_user/widgets/drawer/drawer_widget.dart';
import 'package:taxi_user/widgets/markers/my_location_marker.dart';
import 'package:taxi_user/widgets/text/text_bold.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';
import 'package:url_launcher/url_launcher.dart';

class BookNow2 extends StatefulWidget {
  @override
  State<BookNow2> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<BookNow2> {
  final Completer<GoogleMapController> _controller = Completer();

  Set<Marker> markers = {};

  final box = GetStorage();

  final msgController = TextEditingController();

  late String myName = '';

  getData1() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('Users')
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid);

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          myName = data['firstName'] + ' ' + data['lastName'];
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData1();
  }

  @override
  Widget build(BuildContext context) {
    final Stream<DocumentSnapshot> userData = FirebaseFirestore.instance
        .collection('Bookings')
        .doc(box.read('bookingId'))
        .snapshots();
    return StreamBuilder<Object>(
        stream: userData,
        builder: (context, snapshot) {
          dynamic data = snapshot.data;
          return Scaffold(
            drawer: const DrawerWidget(),
            appBar: AppBar(
                centerTitle: true,
                title: TextRegular(
                    text: data['bookingStatus'],
                    fontSize: 18,
                    color: data['bookingStatus'] == 'Rejected'
                        ? Colors.red
                        : Colors.black),
                foregroundColor: Colors.black,
                backgroundColor: Colors.grey[300],
                actions: [
                  IconButton(
                    onPressed: () {
                      Share.share(
                          'My Ride\nDriver: ${data['driverName']}\nVehicle: ${data['vehicleModel']} ${data['plateNumber']}\nDestination: ${data['userDestination']}\nDate: ${data['dateTime']}');
                    },
                    icon: const Icon(Icons.share),
                  ),
                ]),
            body: Stack(
              children: [
                GoogleMap(
                  markers: markers,
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(data['userLat'], data['userLang']),
                    zoom: 14.4746,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    setState(() {
                      myLocationMarker(
                          markers, context, data['userLat'], data['userLang']);
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
                              data['bookingStatus'] != 'Pending'
                                  ? TextBold(
                                      text: 'Arriving by 2:45pm',
                                      fontSize: 18,
                                      color: Colors.black)
                                  : const SizedBox(),
                              const SizedBox(
                                height: 5,
                              ),
                              data['bookingStatus'] != 'Pending'
                                  ? TextRegular(
                                      text: 'Driver on the way!',
                                      fontSize: 14,
                                      color: Colors.black)
                                  : TextRegular(
                                      text: '${data['bookingStatus']}. . .',
                                      fontSize: 14,
                                      color: data['bookingStatus'] == 'Rejected'
                                          ? Colors.red
                                          : Colors.black),
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
                                leading: CircleAvatar(
                                  minRadius: 25,
                                  maxRadius: 25,
                                  backgroundImage:
                                      NetworkImage(data['profilePicture']),
                                  backgroundColor: Colors.black,
                                ),
                                title: TextBold(
                                    text: data['driverName'],
                                    fontSize: 18,
                                    color: Colors.black),
                                subtitle: TextBold(
                                    text: data['vehicleModel'] +
                                        ' - ' +
                                        data['plateNumber'],
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
                                      controller: msgController,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Quicksand'),
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            addMessage(
                                                data['profilePicture'],
                                                data['driverName'],
                                                msgController.text,
                                                data['driverId'],
                                                myName);
                                            addMessage1(
                                                data['profilePicture'],
                                                data['driverName'],
                                                msgController.text,
                                                data['driverId'],
                                                myName);

                                            msgController.clear();
                                          },
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              width: 1, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                  GestureDetector(
                                    onTap: () async {
                                      final _text =
                                          "tel:${data['driverContactNumber']}";
                                      if (await canLaunch(_text)) {
                                        await launch(_text);
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      child: IconButton(
                                        onPressed: () async {
                                          final _text =
                                              "tel:${data['driverContactNumber']}";
                                          if (await canLaunch(_text)) {
                                            await launch(_text);
                                          }
                                        },
                                        icon: const Icon(
                                          Icons.phone_outlined,
                                          color: Colors.grey,
                                        ),
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
        });
  }
}
