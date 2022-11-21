import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taxi_user/services/cloud_function/add_history.dart';

Future advanceBooking(
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
    String userPickupLocation,
    double payment,
    String dateAndTime) async {
  final docUser = FirebaseFirestore.instance.collection('Bookings').doc();

  final json = {
    'profilePicture': profilePicture,
    'driverName': driverName,
    'driverContactNumber': driverContactNumber,
    'ratings': ratings,
    ' reviews': reviews,
    'plateNumber': plateNumber,
    'vehicleColor': vehicleColor,
    'vehicleModel': vehicleModel,
    'driverLat': driverLat,
    'driverLang': driverLang,
    'userName': userName,
    'userContactNumber': userContactNumber,
    'userProfilePicture': userProfilePicture,
    'userLat': userLat,
    'userLang': userLang,
    'userDestinationLat': userDestinationLat,
    'userDestinationLang': userDestinationLang,
    'userDestination': userDestination,
    'payment': payment,
    'userId': userId,
    'driverId': driverId,
    'id': docUser.id,
    'type': 'Advance Booking',
    'bookingStatus': 'Pending',
    'date': dateAndTime,
    'dateTime': DateTime.now(),
    'userPickupLocation': userPickupLocation,
  };

  addHistory(driverName, driverContactNumber, profilePicture,
      userPickupLocation, userDestination);

  await docUser.set(json);
}
