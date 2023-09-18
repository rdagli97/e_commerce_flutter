import 'package:flutter_e_commerce_app/domain/router/route.dart';
import 'package:get/get.dart';

class VisitCompanyController extends GetxController {
  void productsTAP() {
    Get.toNamed(AppRouter.productsVisit);
  }

  void aboutUsTAP() {
    Get.toNamed(AppRouter.aboutUsVisit);
  }

  void comminicateTAP() {
    Get.toNamed(AppRouter.comminicateVisit);
  }
}
