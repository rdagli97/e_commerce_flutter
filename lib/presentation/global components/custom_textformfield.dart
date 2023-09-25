import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText,
    this.hintColor,
    this.keyboardType,
    this.suffixIconData,
    this.borderEnabled = true,
    this.maxLines,
    this.maxLength,
    this.validator,
  });
  final TextEditingController controller;
  final bool? obscureText;
  final String hintText;
  final Color? hintColor;
  final TextInputType? keyboardType;
  final IconData? suffixIconData;
  final bool? borderEnabled;
  final int? maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final InputBorder outlineInputBorder = borderEnabled!
        ? OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(12),
          )
        : OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.white),
            borderRadius: BorderRadius.circular(24),
          );
    return TextFormField(
      maxLines: maxLines,
      maxLength: maxLength,
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: Icon(suffixIconData),
        suffixIconColor: AppColors.grey,
        labelText: hintText,
        labelStyle: TextStyle(
          color: hintColor,
          fontWeight: FontWeight.w300,
        ),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        floatingLabelStyle: const TextStyle(color: AppColors.primaryColor),
      ),
      validator: validator,
    );
  }
}
