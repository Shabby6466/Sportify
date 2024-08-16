import 'package:flutter/material.dart';

class MyTextFields {
  Widget buildTextFormField({
    required String label,
    required String? Function(String?) validator,
    required void Function(String) onChanged,
  }) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
        label: Text(label),
      ),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }


  String? validation(String value, String fieldType) {
    if (value.isEmpty) {
      return '*Required Field';
    } else {
      if (fieldType == 'age') {
        if (int.tryParse(value) == null ||
            int.parse(value) < 1 ||
            int.parse(value) > 150) {
          return 'Age must be between 1 and 150';
        }
      } else if (fieldType == 'weight') {
        if (double.tryParse(value) == null ||
            double.parse(value) < 1 ||
            double.parse(value) > 500) {
          return 'Weight must be between 1 and 500';
        }
      } else if (fieldType == 'height') {
        if (double.tryParse(value) == null ||
            double.parse(value) < 1 ||
            double.parse(value) > 250) {
          return 'Height must be between 1 and 250';
        }
      }
    }

    return null;
  }
}
