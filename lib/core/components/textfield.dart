import 'package:flutter/material.dart';

Widget defaultTextField(
    {required String label,
    required String hint,
    required TextInputType inputType, Function(String)? onChanged}) {
  return TextField(
    decoration: InputDecoration(
      labelText: label,
      hintText: hint,
    ),
    onChanged: onChanged,
    keyboardType: inputType,
  );
}
