import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_user/screens/booking_screens/book_now2.dart';
import 'package:taxi_user/services/cloud_function/book_now.dart';
import 'package:taxi_user/widgets/buttons/button_widget.dart';

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
  double userDestinationLat,
  double userDestinationLang,
  String userDestination,
  double payment,
) async {
  Marker mark1 = Marker(
      markerId: MarkerId(driverContactNumber),
      infoWindow: InfoWindow(
        onTap: () {
          showModalBottomSheet(
              context: context,
              enableDrag: true,
              builder: (context) {
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
                        height: 520,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
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
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  child: Center(
                                    child: TextBold(
                                        text: 'Your current location',
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                  height: 40,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
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
                                onTap: () {},
                                child: Container(
                                  child: Center(
                                    child: TextBold(
                                        text: 'Cagayan De Oro City',
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                  height: 40,
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ListTile(
                                leading: TextRegular(
                                    text: 'Estimated Fare',
                                    fontSize: 14,
                                    color: Colors.black),
                                trailing: TextBold(
                                    text: '200.00php',
                                    fontSize: 18,
                                    color: Colors.black),
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
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return BookingDetailsDialog(
                                                passengerName: 'John Doe',
                                                passengerContactNumber:
                                                    '000000000',
                                                driverName: driverName,
                                                driverRating: ratings,
                                                plateNumber: plateNumber,
                                                vehicleColor: vehicleColor,
                                                vehicleModel: vehicleModel,
                                                pickupLocation:
                                                    'Your Current Location',
                                                destinationLocation:
                                                    'Cagayan De Oro City',
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
                                                      userDestinationLat,
                                                      userDestinationLang,
                                                      userDestination,
                                                      payment);
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
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
              });
        },
        snippet: driverContactNumber,
        title: driverName,
      ),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(driverLat, driverLang));

  markers.add(mark1);
}
