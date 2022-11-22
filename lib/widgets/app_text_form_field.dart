import 'package:flutter/material.dart';

class AppTextFormField extends TextFormField {
  final String? Function(String?)? validator;
  final String? hintText;
  final String? labelText;

  AppTextFormField({
    this.hintText,
    this.labelText,
    this.validator,
  }) : super(
    validator: validator,
    textCapitalization: TextCapitalization.sentences,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: hintText,
      labelText: labelText,
    ),
  );
}