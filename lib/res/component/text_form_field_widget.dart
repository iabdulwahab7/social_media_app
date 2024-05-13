// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gs_social/res/colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.hint,
    required this.focusNode,
    required this.onFieldSubmitted,
    required this.onValidator,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.obsecureText = false,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hint;
  bool obsecureText;
  final IconData? prefixIcon;
  final FormFieldValidator onValidator;
  final FormFieldSetter onFieldSubmitted;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        obscureText: obsecureText,
        focusNode: focusNode,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.blackColor.withOpacity(0.5)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.textFieldDefaultBorderColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              width: 2,
              color: AppColors.grayColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.alertColor,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              width: 1,
              color: AppColors.alertColor,
            ),
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: AppColors.primaryColor,
          ),
        ),
        onFieldSubmitted: onFieldSubmitted,
        validator: onValidator,
      ),
    );
  }
}
