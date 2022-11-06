import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactNumberField extends StatelessWidget {
  late String label;
  late TextEditingController controller;

  ContactNumberField({required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: TextFormField(
        keyboardType: const TextInputType.numberWithOptions(decimal: false),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
        ],
        maxLength: 11,
        controller: controller,
        style: const TextStyle(color: Colors.black, fontFamily: 'QRegular'),
        decoration: InputDecoration(
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
          labelText: label,
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
