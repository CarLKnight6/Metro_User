import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_user/screens/booking_screens/convo_booking_screen.dart';
import 'package:taxi_user/services/cloud_function/advance_booking.dart';
import 'package:taxi_user/services/providers/date_provider.dart';
import 'package:taxi_user/widgets/buttons/button_widget.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:taxi_user/widgets/ticket_widget.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:uuid/uuid.dart';
import '../../services/providers/destination_provider.dart';
import '../delegate/search_destination.dart';
import '../dialogs/booking_details_dialog.dart';
import '../dialogs/normal_dialog.dart';
import '../text/text_bold.dart';
import '../text/text_regular.dart';

advanceBookingMarker(
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
  String pickupLocation,
  double payment,
  String date,
) async {
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

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  final box = GetStorage();

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
                    double rate = ratings / reviews;
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
                            height: 550,
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
                                      text:
                                          'Rating: ${rate.toStringAsFixed(2)} ★',
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
                                        padding: const EdgeInsets.all(5.0),
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
                                    height: 10,
                                  ),
                                  Center(
                                    child: SizedBox(
                                      height: 50,
                                      width: 300,
                                      child: DateTimePicker(
                                          type: DateTimePickerType
                                              .dateTimeSeparate,
                                          dateMask: 'd MMM, yyyy',
                                          initialValue:
                                              DateTime.now().toString(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2100),
                                          icon: const Icon(Icons.event),
                                          dateLabelText: 'Pickup Date',
                                          timeLabelText: "Pickup Time",
                                          onChanged: (val) {
                                            ref
                                                .read(dateProvider.notifier)
                                                .state = val;
                                          },
                                          validator: (val) {
                                            return ref
                                                .read(dateProvider.notifier)
                                                .state = val!;
                                          },
                                          onSaved: (val) {
                                            ref
                                                .read(dateProvider.notifier)
                                                .state = val!;
                                          }),
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
                                        label: 'Book',
                                        color: Colors.red[600]!,
                                        onPressed: () async {
                                          print(ref
                                              .watch(dateProvider.notifier)
                                              .state);
                                          List<Location> location =
                                              await locationFromAddress(
                                            ref
                                                .watch(destinationProvider
                                                    .notifier)
                                                .state,
                                          );

                                          double distance = calculateDistance(
                                              userLat,
                                              userLang,
                                              location[0].latitude,
                                              location[0].longitude);

                                          if (distance.toInt() > 20) {
                                            print(distance.toInt());
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return NormalDialog(
                                                      label:
                                                          'There is additional fee because you are travelling more than 20 km. Send a message to the driver about your fare',
                                                      buttonColor: Colors.red,
                                                      buttonText:
                                                          'I understand',
                                                      icon: Icons.warning,
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return BookingDetailsDialog(
                                                                  passengerName:
                                                                      userName,
                                                                  passengerContactNumber:
                                                                      userContactNumber,
                                                                  driverName:
                                                                      driverName,
                                                                  driverRating:
                                                                      rate,
                                                                  plateNumber:
                                                                      plateNumber,
                                                                  vehicleColor:
                                                                      vehicleColor,
                                                                  vehicleModel:
                                                                      vehicleModel,
                                                                  pickupLocation:
                                                                      'Your Current Location',
                                                                  destinationLocation: ref
                                                                      .watch(destinationProvider
                                                                          .notifier)
                                                                      .state,
                                                                  fare: ((distance *
                                                                              12) +
                                                                          50)
                                                                      .toStringAsFixed(
                                                                          2),
                                                                  onPressed:
                                                                      () {
                                                                    advanceBooking(
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
                                                                        location[0]
                                                                            .latitude,
                                                                        location[0]
                                                                            .longitude,
                                                                        ref
                                                                            .watch(destinationProvider
                                                                                .notifier)
                                                                            .state,
                                                                        pickupLocation,
                                                                        (distance *
                                                                                12) +
                                                                            50,
                                                                        ref
                                                                            .watch(dateProvider.notifier)
                                                                            .state);

                                                                    FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            'Drivers')
                                                                        .doc(
                                                                            driverId)
                                                                        .update({
                                                                      'ratings':
                                                                          reviews +
                                                                              1,
                                                                    });

                                                                    box.write(
                                                                        'uid',
                                                                        driverId);

                                                                    Navigator.of(
                                                                            context)
                                                                        .pushReplacement(MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                ConvoBookingPage()));

                                                                    showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return Scaffold(
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            body:
                                                                                Center(
                                                                              child: SizedBox(
                                                                                child: TicketWidget(
                                                                                    width: 350,
                                                                                    height: 500,
                                                                                    child: TicketData(
                                                                                      passenger: userName,
                                                                                      driver: driverName,
                                                                                      plateNum: plateNumber,
                                                                                      destination: ref.watch(destinationProvider.notifier).state,
                                                                                      distance: distance.toStringAsFixed(2),
                                                                                      fare: ((distance * 12) + 50).toStringAsFixed(2),
                                                                                    )),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        });
                                                                  });
                                                            });
                                                      },
                                                      iconColor: Colors.red);
                                                });
                                          } else {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return BookingDetailsDialog(
                                                      passengerName: userName,
                                                      passengerContactNumber:
                                                          userContactNumber,
                                                      driverName: driverName,
                                                      driverRating: rate,
                                                      plateNumber: plateNumber,
                                                      vehicleColor:
                                                          vehicleColor,
                                                      vehicleModel:
                                                          vehicleModel,
                                                      pickupLocation:
                                                          'Your Current Location',
                                                      destinationLocation: ref
                                                          .watch(
                                                              destinationProvider
                                                                  .notifier)
                                                          .state,
                                                      fare: ((distance *
                                                                  13.50) +
                                                              40)
                                                          .toStringAsFixed(2),
                                                      onPressed: () {
                                                        advanceBooking(
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
                                                            location[0]
                                                                .latitude,
                                                            location[0]
                                                                .longitude,
                                                            ref
                                                                .watch(
                                                                    destinationProvider
                                                                        .notifier)
                                                                .state,
                                                            pickupLocation,
                                                            (distance * 13.50) +
                                                                40,
                                                            ref
                                                                .watch(
                                                                    dateProvider
                                                                        .notifier)
                                                                .state);

                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                'Drivers')
                                                            .doc(driverId)
                                                            .update({
                                                          'ratings':
                                                              reviews + 1,
                                                        });

                                                        box.write(
                                                            'uid', driverId);

                                                        Navigator.of(context)
                                                            .pushReplacement(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            ConvoBookingPage()));

                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return Scaffold(
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                body: Center(
                                                                  child:
                                                                      SizedBox(
                                                                    child: TicketWidget(
                                                                        width: 350,
                                                                        height: 500,
                                                                        child: TicketData(
                                                                          passenger:
                                                                              userName,
                                                                          driver:
                                                                              driverName,
                                                                          plateNum:
                                                                              plateNumber,
                                                                          destination: ref
                                                                              .watch(destinationProvider.notifier)
                                                                              .state,
                                                                          distance:
                                                                              distance.toStringAsFixed(2),
                                                                          fare:
                                                                              ((distance * 12) + 50).toStringAsFixed(2),
                                                                        )),
                                                                  ),
                                                                ),
                                                              );
                                                            });
                                                      });
                                                });
                                          }
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
      icon: await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(
          size: Size(24, 24),
        ),
        'assets/images/driver.png',
      ),
      position: LatLng(driverLat, driverLang));

  markers.add(mark1);
}
