import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/domain/controllers/data_controller/animation_data_controller.dart';
import 'package:flutter_e_commerce_app/domain/router/route.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  final AnimationDataController _animationController = Get.find();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  int get startDuration => _animationController.startDuration;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signUpTap() {
    Get.toNamed(AppRouter.signupRoute);
  }

  void logInTap() {}

  void backTAP() {
    Get.back();
  }
}
