import 'package:flutter/material.dart';

import '../buttons/button_widget.dart';
import '../text/text_bold.dart';
import '../text/text_regular.dart';

class BookingDetailsDialog extends StatelessWidget {
  late VoidCallback onPressed;
  late String passengerName;
  late String passengerContactNumber;
  late String driverName;
  late double driverRating;
  late String plateNumber;
  late String vehicleColor;
  late String vehicleModel;
  late String pickupLocation;
  late String destinationLocation;
  late String fare;

  BookingDetailsDialog(
      {required this.passengerName,
      required this.passengerContactNumber,
      required this.driverName,
      required this.driverRating,
      required this.plateNumber,
      required this.vehicleColor,
      required this.vehicleModel,
      required this.pickupLocation,
      required this.destinationLocation,
      required this.fare,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: SizedBox(
          height: 550,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: TextBold(
                      text: 'Booking Details',
                      fontSize: 18,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                TextBold(
                    text: 'Passengers Information',
                    fontSize: 16,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                TextRegular(
                    text: 'Name: $passengerName',
                    fontSize: 14,
                    color: Colors.black),
                const SizedBox(
                  height: 5,
                ),
                TextRegular(
                    text: 'Contact Number: $passengerContactNumber',
                    fontSize: 14,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
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
                  height: 5,
                ),
                TextRegular(
                    text: 'Rating: ${driverRating.toStringAsFixed(2)} ★',
                    fontSize: 14,
                    color: Colors.black),
                const SizedBox(
                  height: 5,
                ),
                TextRegular(
                    text: 'Plate Number: $plateNumber',
                    fontSize: 14,
                    color: Colors.black),
                const SizedBox(
                  height: 5,
                ),
                TextRegular(
                    text: 'Color of Vehicle: $vehicleColor',
                    fontSize: 14,
                    color: Colors.black),
                const SizedBox(
                  height: 5,
                ),
                TextRegular(
                    text: 'Model: $vehicleModel',
                    fontSize: 14,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                TextBold(
                  text: 'Location and Routes',
                  fontSize: 16,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextRegular(
                    text: "Pickup Location: $pickupLocation",
                    fontSize: 14,
                    color: Colors.black),
                const SizedBox(
                  height: 5,
                ),
                TextRegular(
                    text: "Destination Location: $destinationLocation",
                    fontSize: 14,
                    color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                const Divider(),
                ListTile(
                  leading: TextRegular(
                      text: 'Estimated Fare',
                      fontSize: 14,
                      color: Colors.black),
                  trailing: TextBold(
                      text: '$fare.00php', fontSize: 18, color: Colors.black),
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: ButtonWidget(
                    label: 'Continue',
                    color: Colors.red[600]!,
                    onPressed: onPressed,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
