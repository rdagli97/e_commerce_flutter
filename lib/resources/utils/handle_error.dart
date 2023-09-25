import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';

class HandleError {
  void showErrorMessage(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1600),
        content: CustomText(text: text),
      ),
    );
  }
}
