import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

import '../../screens/home_screen.dart';
import '../../widgets/dialogs/error_dialog.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

void googleLogin(BuildContext context) async {
  try {
    final googleSignInAccount = await _googleSignIn.signIn();
    if (googleSignInAccount == null) {
      return;
    }
    final googleSignInAuth = await googleSignInAccount.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuth.accessToken,
      idToken: googleSignInAuth.idToken,
    );
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  } on FirebaseAuthException catch (e) {
    showDialog(
        context: context,
        builder: (context) {
          return ErrorDialog(label: e.toString());
        });
  }
}
