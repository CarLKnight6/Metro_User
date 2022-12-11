import 'package:flutter/material.dart';
import 'package:taxi_user/auth/signup.dart';
import 'package:taxi_user/widgets/buttons/button_widget.dart';
import 'package:taxi_user/widgets/text/text_bold.dart';
import 'package:taxi_user/widgets/text/text_regular.dart';
import 'package:taxi_user/widgets/textfields/normal_field.dart';
import 'package:taxi_user/widgets/textfields/password_field.dart';
import 'package:taxi_user/widgets/ticket_widget.dart';
import 'package:ticket_widget/ticket_widget.dart';

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
                    controller: _usernameController, label: 'Email'),
                PasswordField(
                    controller: _passwordController, label: 'Password'),
                const SizedBox(
                  height: 10,
                ),
                ButtonWidget(
                    label: 'Login',
                    color: Colors.amber,
                    onPressed: () {
                      // emailLogin(_usernameController.text,
                      //     _passwordController.text, context);
                    }),
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
                const TicketWidget(
                  width: 300,
                  height: 500,
                  child: TicketData(),
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
