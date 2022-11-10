import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_user/widgets/buttons/button_widget.dart';
import 'package:taxi_user/widgets/textfields/contactnumber_field.dart';
import 'package:taxi_user/widgets/textfields/normal_field.dart';

import '../dialogs/booking_details_dialog.dart';
import '../text/text_bold.dart';
import '../text/text_regular.dart';

bookAFriendMarker(Set<Marker> markers, BuildContext context, _nameController,
    _contactNumController) async {
  Marker mark1 = Marker(
      markerId: const MarkerId('mark1'),
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
                                  text: 'Name: Lance Olana',
                                  fontSize: 14,
                                  color: Colors.black),
                              const SizedBox(
                                height: 10,
                              ),
                              TextRegular(
                                  text: 'Rating: 4.5 ★',
                                  fontSize: 14,
                                  color: Colors.black),
                              const SizedBox(
                                height: 10,
                              ),
                              TextRegular(
                                  text: 'Plate Number: 12345',
                                  fontSize: 14,
                                  color: Colors.black),
                              const SizedBox(
                                height: 10,
                              ),
                              TextRegular(
                                  text: 'Color of Vehicle: White',
                                  fontSize: 14,
                                  color: Colors.black),
                              const SizedBox(
                                height: 10,
                              ),
                              TextRegular(
                                  text: 'Model: Honda Civic 192',
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
                                  text: "Friend's Current Location",
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
                                  text: "Friend's Destination Location",
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
                                    label: 'Continue',
                                    color: Colors.red[600]!,
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              backgroundColor: Colors.grey[200],
                                              title: TextBold(
                                                  text:
                                                      "Friend's personal Details",
                                                  fontSize: 16,
                                                  color: Colors.black),
                                              content: SizedBox(
                                                height: 180,
                                                child: Column(
                                                  children: [
                                                    NormalTextField(
                                                        controller:
                                                            _nameController,
                                                        label:
                                                            'Name of Friend'),
                                                    ContactNumberField(
                                                        controller:
                                                            _contactNumController,
                                                        label:
                                                            'Contact Number of Friend'),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                FlatButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(true),
                                                  child: TextRegular(
                                                      text: 'Close',
                                                      color: Colors.black,
                                                      fontSize: 12),
                                                ),
                                                FlatButton(
                                                  onPressed: () async {
                                                    // Navigator.of(context).pushReplacement(
                                                    //     MaterialPageRoute(
                                                    //         builder: (context) => LoginPage()));
                                                    Navigator.of(context)
                                                        .pop(true);
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return BookingDetailsDialog(
                                                              passengerName:
                                                                  'Lance Olana',
                                                              passengerContactNumber:
                                                                  '09090104355',
                                                              driverName:
                                                                  'John Doe',
                                                              driverRating: 4.5,
                                                              plateNumber:
                                                                  '123456',
                                                              vehicleColor:
                                                                  'White',
                                                              vehicleModel:
                                                                  'Honda Civic 123',
                                                              pickupLocation:
                                                                  'Your Current Location',
                                                              destinationLocation:
                                                                  'Cagayan De Oro City',
                                                              fare: '200',
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              });
                                                        });
                                                  },
                                                  child: TextBold(
                                                      text: 'Continue',
                                                      color: Colors.black,
                                                      fontSize: 14),
                                                ),
                                              ],
                                            );
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
        snippet: '09090104355',
        title: 'Lance Olana',
      ),
      icon: BitmapDescriptor.defaultMarker,
      position: const LatLng(37.42796133580664, -122.085749655962));

  markers.add(mark1);
}
