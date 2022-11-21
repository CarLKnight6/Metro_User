import 'package:cloud_firestore/cloud_firestore.dart';

Future addHistory(
  String driverName,
  String driverContactNumber,
  String driverProfilePicture,
  String pickupLocation,
  String destinationLocation,
  double payment,
) async {
  final docUser = FirebaseFirestore.instance.collection('User History').doc();

  final json = {
    'driverName': driverName,
    'driverContactNumber': driverContactNumber,
    'driverProfilePicture': driverProfilePicture,
    'pickupLocation': pickupLocation,
    'destinationLocation': destinationLocation,
    'id': docUser.id,
    'payment': payment,
    'dateTime': DateTime.now(),
  };

  await docUser.set(json);
}
