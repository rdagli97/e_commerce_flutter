import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCustomerController extends GetxController {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController adressController = TextEditingController();

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    phoneController.dispose();
    adressController.dispose();
    super.dispose();
  }

  void updateTAP() {}
}
