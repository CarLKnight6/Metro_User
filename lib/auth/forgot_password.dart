import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:taxi_user/auth/login.dart';
import 'package:taxi_user/widgets/appbar/normal_appbar.dart';
import 'package:taxi_user/widgets/buttons/button_widget.dart';
import 'package:taxi_user/widgets/dialogs/normal_dialog.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';
import 'package:taxi_user/widgets/textfields/normal_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAppbar('Forgot Password', Colors.white),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextRegular(
                text: 'Your password configuration will be sent to this email:',
                fontSize: 10,
                color: Colors.grey),
            NormalTextField(
                controller: emailController, label: 'Your email address'),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
                label: 'Send Password',
                color: Colors.amber,
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.sendPasswordResetEmail(
                        email: emailController.text.trim());
                    showDialog(
                        context: context,
                        builder: (context) {
                          return NormalDialog(
                              label:
                                  'Password Configuration was sent to your email',
                              buttonColor: Colors.amber,
                              buttonText: 'Continue',
                              icon: Icons.check_circle_outline_outlined,
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              iconColor: Colors.amber);
                        });
                  } catch (e) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return NormalDialog(
                              label: e.toString(),
                              buttonColor: Colors.red,
                              buttonText: 'Close',
                              icon: Icons.error,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              iconColor: Colors.red);
                        });
                  }
                }),
          ],
        ),
      ),
    );
  }
}
