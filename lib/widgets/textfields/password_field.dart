import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  late String label;
  late TextEditingController controller;

  PasswordField({required this.controller, required this.label});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  var isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: TextFormField(
        obscureText: isObscure,
        controller: widget.controller,
        style: const TextStyle(color: Colors.black, fontFamily: 'QRegular'),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
            icon: Icon(
              isObscure ? Icons.visibility : Icons.visibility_off,
              color: Colors.black,
            ),
          ),
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(5),
          ),
          labelText: widget.label,
          labelStyle: const TextStyle(
            fontFamily: 'QRegular',
            color: Colors.black,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
