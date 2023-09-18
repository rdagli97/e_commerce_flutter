import 'package:flutter_e_commerce_app/domain/controllers/data_controller/animation_data_controller.dart';
import 'package:flutter_e_commerce_app/domain/router/route.dart';
import 'package:get/get.dart';

class CompanyIntroController extends GetxController {
  final AnimationDataController _animationController = Get.find();
  int get startDuration => _animationController.startDuration;

  void loginTAP() {
    Get.toNamed(AppRouter.companyLoginRoute);
  }

  void signupTAP() {
    Get.toNamed(AppRouter.companyRegisterRoute);
  }

  void backTAP() {
    Get.back();
  }
}
