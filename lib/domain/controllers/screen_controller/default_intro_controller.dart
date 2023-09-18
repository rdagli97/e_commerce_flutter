import 'package:flutter_e_commerce_app/domain/controllers/data_controller/animation_data_controller.dart';
import 'package:flutter_e_commerce_app/domain/router/route.dart';
import 'package:get/get.dart';

class DefaultIntroController extends GetxController {
  final AnimationDataController _animationController = Get.find();
  int get startDuration => _animationController.startDuration;

  void companyTAP() {
    Get.toNamed(AppRouter.companyIntroRoute);
  }

  void customerTAP() {
    Get.toNamed(AppRouter.introRoute);
  }
}
