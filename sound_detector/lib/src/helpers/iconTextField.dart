// ignore_for_file: file_names

import 'package:flutter/material.dart';

class IconTextField {
  TextEditingController? controller;

  static Widget textField(TextEditingController controller, String labelText,
      String helperText, String hintText, Icon icon, int maxLines) {
    controller = controller;
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
          prefixIcon: icon,
          labelText: labelText,
          helperText: helperText,
          hintText: hintText),
    );
  }
}
