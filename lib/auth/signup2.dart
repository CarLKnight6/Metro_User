import 'package:flutter/material.dart';
import 'package:taxi_user/auth/login.dart';
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
