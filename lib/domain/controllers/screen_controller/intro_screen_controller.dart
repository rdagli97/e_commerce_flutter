import 'package:flutter_e_commerce_app/domain/controllers/data_controller/animation_data_controller.dart';
import 'package:flutter_e_commerce_app/domain/router/route.dart';
import 'package:get/get.dart';

class IntroScreenController extends GetxController {
  final AnimationDataController _animationController = Get.find();
  int get startDuration => _animationController.startDuration;

  void onTapLogin() {
    Get.toNamed(AppRouter.loginRoute);
  }

  void onTapSignup() {
    Get.toNamed(AppRouter.signupRoute);
  }

  void backTAP() {
    Get.back();
  }
}
