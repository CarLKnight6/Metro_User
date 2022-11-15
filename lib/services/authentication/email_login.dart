import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:taxi_user/widgets/dialogs/error_dialog.dart';

import '../../screens/home_screen.dart';

emailLogin(String email, String password, BuildContext context) async {
  final box = GetStorage();

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(), password: password.trim());
    box.write('email', email);

    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  } catch (e) {
    showDialog(
        context: context,
        builder: (context) {
          return ErrorDialog(label: e.toString());
        });
  }
}
