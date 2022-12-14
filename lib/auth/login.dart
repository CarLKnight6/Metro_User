import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:taxi_user/auth/forgot_password.dart';
import 'package:taxi_user/auth/signup.dart';
import 'package:taxi_user/widgets/buttons/button_widget.dart';
import 'package:taxi_user/widgets/text/text_bold.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';
import 'package:taxi_user/widgets/textfields/normal_field.dart';
import 'package:taxi_user/widgets/textfields/password_field.dart';

import '../services/authentication/email_login.dart';

class LoginPage extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    Image.asset('assets/images/cvkatco Logo.png', height: 200),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Center(
                        child: Image.asset(
                          'assets/images/VERTICAL LOGO FOR LIGHT BG.png',
                          height: 100,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                NormalTextField(
                    controller: _usernameController, label: 'Email'),
                PasswordField(
                    controller: _passwordController, label: 'Password'),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                    label: 'Login',
                    color: Colors.amber,
                    onPressed: () async {
                      LocationPermission permission;
                      permission = await Geolocator.requestPermission();

                      bool serviceEnabled;

                      // Test if location services are enabled.
                      serviceEnabled =
                          await Geolocator.isLocationServiceEnabled();
                      if (!serviceEnabled) {
                        permission = await Geolocator.requestPermission();
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: TextBold(
                                      text: 'Cannot Procceed',
                                      color: Colors.black,
                                      fontSize: 14),
                                  content: TextRegular(
                                      text: 'Location is not turned on',
                                      color: Colors.black,
                                      fontSize: 12),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: TextBold(
                                          text: 'Close',
                                          color: Colors.black,
                                          fontSize: 12),
                                    ),
                                  ],
                                ));
                      } else {
                        permission = await Geolocator.requestPermission();
                        emailLogin(_usernameController.text,
                            _passwordController.text, context);
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ForgotPasswordPage()));
                      },
                      child: TextBold(
                          text: 'Forgot Password?',
                          fontSize: 12,
                          color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextRegular(
                        text: "Don't have an account?",
                        fontSize: 14,
                        color: Colors.black),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignupPage()));
                      },
                      child: TextBold(
                          text: "Signup",
                          fontSize: 16,
                          color: Colors.blue[700]!),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
