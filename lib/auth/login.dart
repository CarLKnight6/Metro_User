import 'package:flutter/material.dart';
import 'package:taxi_user/widgets/buttons/auth_buton.dart';
import 'package:taxi_user/widgets/buttons/button_widget.dart';
import 'package:taxi_user/widgets/text/text_bold.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';
import 'package:taxi_user/widgets/textfields/normal_field.dart';
import 'package:taxi_user/widgets/textfields/password_field.dart';

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
                    Image.asset('assets/images/cvkatco Logo.png'),
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
                    controller: _usernameController, label: 'Username'),
                PasswordField(
                    controller: _passwordController, label: 'Password'),
                const SizedBox(
                  height: 10,
                ),
                ButtonWidget(
                    label: 'Login', color: Colors.amber, onPressed: () {}),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: TextBold(
                          text: 'Forgot Password?',
                          fontSize: 12,
                          color: Colors.black),
                    ),
                  ),
                ),
                TextRegular(text: 'or', fontSize: 12, color: Colors.black),
                const SizedBox(
                  height: 10,
                ),
                AuthButton(
                  label: 'Login with Google',
                  color: Colors.white,
                  onPressed: () {},
                  textColor: Colors.black,
                  logo: 'googlelogo',
                ),
                const SizedBox(
                  height: 10,
                ),
                AuthButton(
                  label: 'Login with Facebook',
                  color: Colors.blue[700]!,
                  onPressed: () {},
                  textColor: Colors.white,
                  logo: 'fblogo',
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
                      onPressed: () {},
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
