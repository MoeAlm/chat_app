import 'package:flutter/material.dart';

Widget defaultTextField(
    {required String label,
    required String hint,
    required TextInputType inputType}) {
  return TextField(
    decoration: InputDecoration(
      labelText: label,
      hintText: hint,
    ),
    keyboardType: inputType,
  );
}
