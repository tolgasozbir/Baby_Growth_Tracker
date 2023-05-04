import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends TextFormField {
  @override
  final TextEditingController? controller;
  @override
  final String? Function(String?)? validator;
  final String? hintText;
  final String? labelText;
  final bool onlyDigits;
  final int? maxLength;
  final TextInputAction? textInputAction;

  AppTextFormField({super.key, 
    this.hintText,
    this.labelText,
    this.validator,
    this.controller,
    this.textInputAction,
    this.maxLength,
    this.onlyDigits = false,
  }) : super(
    controller: controller,
    validator: validator,
    textCapitalization: TextCapitalization.sentences,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    textInputAction: textInputAction,
    keyboardType: onlyDigits ? TextInputType.number : null,
    maxLength: maxLength,
    inputFormatters: onlyDigits ? [FilteringTextInputFormatter.digitsOnly] : null,
    decoration: InputDecoration(
      border: const OutlineInputBorder(),
      hintText: hintText,
      labelText: labelText,
    ),
  );
}