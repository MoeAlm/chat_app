import 'package:flutter/material.dart';

Widget defaultTextField(
    {required String label,
    required String hint,
    required TextInputType inputType, Function(String)? onChanged}) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: label,
      hintText: hint,
    ),
    validator: (value){
      if (value!.isEmpty) {
        return 'Field is required';
      }
      return null;
    },
    onChanged: onChanged,
    keyboardType: inputType,
  );
}
