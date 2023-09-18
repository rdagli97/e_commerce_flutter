import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/domain/controllers/data_controller/animation_data_controller.dart';
import 'package:flutter_e_commerce_app/domain/router/route.dart';
import 'package:get/get.dart';

class SignupScreenController extends GetxController {
  final AnimationDataController _animationDataController = Get.find();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordCController = TextEditingController();

  int get startDuration => _animationDataController.startDuration;

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordCController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void logInTap() {
    Get.toNamed(AppRouter.loginRoute);
  }

  void signUpTap() {}

  void circleAvatarTap() {}

  void backTAP() {
    Get.back();
  }
}
