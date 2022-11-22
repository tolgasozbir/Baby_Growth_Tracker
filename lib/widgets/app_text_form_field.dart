import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends TextFormField {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? labelText;
  final bool onlyDigits;
  final TextInputAction? textInputAction;

  AppTextFormField({
    this.hintText,
    this.labelText,
    this.validator,
    this.controller,
    this.textInputAction,
    this.onlyDigits = false,
  }) : super(
    controller: controller,
    validator: validator,
    textCapitalization: TextCapitalization.sentences,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    textInputAction: textInputAction,
    keyboardType: onlyDigits ? TextInputType.number : null,
    inputFormatters: onlyDigits ? [FilteringTextInputFormatter.digitsOnly] : null,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: hintText,
      labelText: labelText,
    ),
  );
}