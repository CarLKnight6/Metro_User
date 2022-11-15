import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future addUser(
  String profilePicture,
  String firstName,
  String lastName,
  String contactNumber,
  String email,
  String province,
  String city,
  String brgy,
  String contactName1,
  String contactNumber1,
  String contactAddress1,
  String contactName2,
  String contactNumber2,
  String contactAddress2,
) async {
  final user = FirebaseAuth.instance.currentUser!.uid;
  final docUser = FirebaseFirestore.instance.collection('Users').doc(user);

  final json = {
    'profilePicture': profilePicture,
    'firstName': firstName,
    'lastName': lastName,
    'contactNumber': contactNumber,
    'email': email,
    'province': province,
    'city': city,
    'brgy': brgy,
    'contactName1': contactName1,
    'contactNumber1': contactNumber1,
    'contactAddress1': contactAddress1,
    'contactName2': contactName2,
    'contactNumber2': contactNumber2,
    'contactAddress2': contactAddress2,
    'id': user,
    'locations': [],
  };

  await docUser.set(json);
}
