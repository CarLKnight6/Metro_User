import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_user/screens/booking_screens/book_now2.dart';
import 'package:taxi_user/services/cloud_function/book_now.dart';
import 'package:taxi_user/services/providers/destination_provider.dart';
import 'package:taxi_user/widgets/buttons/button_widget.dart';
import 'package:taxi_user/widgets/delegate/search_destination.dart';
import 'package:uuid/uuid.dart';

import '../dialogs/booking_details_dialog.dart';
import '../text/text_bold.dart';
import '../text/text_regular.dart';

bookNowMarker(
  Set<Marker> markers,
  BuildContext context,
  String profilePicture,
  String driverName,
  String driverContactNumber,
  double ratings,
  int reviews,
  String plateNumber,
  String vehicleColor,
  String vehicleModel,
  double driverLat,
  double driverLang,
  String driverId,
  String userName,
  String userContactNumber,
  String userProfilePicture,
  String userId,
  double userLat,
  double userLang,
  double payment,
) async {
  String _street = '';
  String _city = '';

  final box = GetStorage();

  showToast() {
    Fluttertoast.showToast(
        msg: "Booked succesfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Marker mark1 = Marker(
      markerId: MarkerId(driverContactNumber),
      infoWindow: InfoWindow(
        onTap: () {
          showModalBottomSheet(
              context: context,
              enableDrag: true,
              builder: (context) {
                return Consumer(
                  builder: ((context, ref, child) {
                    return Container(
                      height: 750,
                      color: Colors.red[600],
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                        child: SingleChildScrollView(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 450,
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextBold(
                                    text: 'Driver and Taxi Information',
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextRegular(
                                      text: 'Name: $driverName',
                                      fontSize: 14,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextRegular(
                                      text: 'Rating: $ratings ★',
                                      fontSize: 14,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextRegular(
                                      text: 'Plate Number: $plateNumber',
                                      fontSize: 14,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextRegular(
                                      text: 'Color of Vehicle: $vehicleColor',
                                      fontSize: 14,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextRegular(
                                      text: 'Model: $vehicleModel',
                                      fontSize: 14,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextBold(
                                    text: 'Location and Routes',
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextRegular(
                                      text: 'Current Location',
                                      fontSize: 14,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    child: Center(
                                      child: TextBold(
                                          text: 'Your Current Location',
                                          fontSize: 12,
                                          color: Colors.black),
                                    ),
                                    height: 40,
                                    width: 350,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextRegular(
                                      text: 'Destination Location',
                                      fontSize: 14,
                                      color: Colors.black),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      final sessionToken = const Uuid().v4();
                                      showSearch(
                                          context: context,
                                          delegate:
                                              AddressSearch(sessionToken));
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Center(
                                          child: TextBold(
                                              text: ref
                                                  .watch(destinationProvider
                                                      .notifier)
                                                  .state,
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                      ),
                                      height: 40,
                                      width: 350,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30, right: 30),
                                      child: ButtonWidget(
                                        label: 'Book Now',
                                        color: Colors.red[600]!,
                                        onPressed: () async {
                                          List<Location> location =
                                              await locationFromAddress(
                                            ref
                                                .watch(destinationProvider
                                                    .notifier)
                                                .state,
                                          );

                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return BookingDetailsDialog(
                                                    passengerName: userName,
                                                    passengerContactNumber:
                                                        userContactNumber,
                                                    driverName: driverName,
                                                    driverRating: ratings,
                                                    plateNumber: plateNumber,
                                                    vehicleColor: vehicleColor,
                                                    vehicleModel: vehicleModel,
                                                    pickupLocation:
                                                        'Your Current Location',
                                                    destinationLocation: ref
                                                        .watch(
                                                            destinationProvider
                                                                .notifier)
                                                        .state,
                                                    fare: '200',
                                                    onPressed: () {
                                                      bookNow(
                                                          profilePicture,
                                                          driverName,
                                                          driverContactNumber,
                                                          ratings,
                                                          reviews,
                                                          plateNumber,
                                                          vehicleColor,
                                                          vehicleModel,
                                                          driverLat,
                                                          driverLang,
                                                          driverId,
                                                          userName,
                                                          userContactNumber,
                                                          userProfilePicture,
                                                          userId,
                                                          userLat,
                                                          userLang,
                                                          location[0].latitude,
                                                          location[0].longitude,
                                                          ref
                                                              .watch(
                                                                  destinationProvider
                                                                      .notifier)
                                                              .state,
                                                          payment);

                                                      FirebaseFirestore.instance
                                                          .collection('Drivers')
                                                          .doc(driverId)
                                                          .update({
                                                        'ratings': reviews + 1,
                                                      });

                                                      showToast();
                                                      Navigator.of(context)
                                                          .pushReplacement(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          BookNow2()));
                                                    });
                                              });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                );
              });
        },
        snippet: driverContactNumber,
        title: driverName,
      ),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(driverLat, driverLang));

  markers.add(mark1);
}
