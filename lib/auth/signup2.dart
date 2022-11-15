import 'package:flutter/material.dart';
import 'package:taxi_user/auth/login.dart';
import 'package:taxi_user/services/cloud_function/add_user.dart';
import 'package:taxi_user/widgets/appbar/normal_appbar.dart';
import 'package:taxi_user/widgets/buttons/button_widget.dart';
import 'package:taxi_user/widgets/dialogs/normal_dialog.dart';
import 'package:taxi_user/widgets/text/text_bold.dart';
import 'package:taxi_user/widgets/textfields/contactnumber_field.dart';
import 'package:taxi_user/widgets/textfields/normal_field.dart';

class Signup2 extends StatelessWidget {
  final _person1fullnameController = TextEditingController();
  final _person1addressController = TextEditingController();
  final _person1contactnumberController = TextEditingController();

  final _person2fullnameController = TextEditingController();
  final _person2addressController = TextEditingController();
  final _person2contactnumberController = TextEditingController();

  late String profilePicture;
  late String firstName;
  late String lastName;
  late String contactNumber;
  late String email;
  late String province;
  late String city;
  late String brgy;

  late String password;

  Signup2(
      {required this.profilePicture,
      required this.firstName,
      required this.lastName,
      required this.contactNumber,
      required this.email,
      required this.province,
      required this.city,
      required this.brgy,
      required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: NormalAppbar('Emergency Cases', Colors.grey[300]!),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextBold(
                  text: 'Contact Person 1', fontSize: 18, color: Colors.black),
              NormalTextField(
                  controller: _person1fullnameController, label: 'Full Name'),
              ContactNumberField(
                  controller: _person1contactnumberController,
                  label: 'Contact Number'),
              NormalTextField(
                  controller: _person1addressController,
                  label: 'Complete Address'),
              const SizedBox(
                height: 30,
              ),
              TextBold(
                  text: 'Contact Person 2', fontSize: 18, color: Colors.black),
              NormalTextField(
                  controller: _person2fullnameController, label: 'Full Name'),
              ContactNumberField(
                  controller: _person2contactnumberController,
                  label: 'Contact Number'),
              NormalTextField(
                  controller: _person2addressController,
                  label: 'Complete Address'),
              const SizedBox(
                height: 20,
              ),
              ButtonWidget(
                  label: 'Continue',
                  color: Colors.amber,
                  onPressed: () {
                    addUser(
                        profilePicture,
                        firstName,
                        lastName,
                        contactNumber,
                        email,
                        province,
                        city,
                        brgy,
                        _person1addressController.text,
                        _person1contactnumberController.text,
                        _person1addressController.text,
                        _person2fullnameController.text,
                        _person2contactnumberController.text,
                        _person2addressController.text);
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return NormalDialog(
                              label: 'Account created succesfully!',
                              buttonColor: Colors.amber,
                              buttonText: 'Continue',
                              icon: Icons.check_circle_rounded,
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              iconColor: Colors.amber);
                        });
                  }),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
