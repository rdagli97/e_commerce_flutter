import 'package:flutter_e_commerce_app/domain/router/route.dart';
import 'package:get/get.dart';

class VisitCustomerController extends GetxController {
  void ordersTAP() {
    Get.toNamed(AppRouter.ordersVisit);
  }

  void commentsTAP() {
    Get.toNamed(AppRouter.commentsVisit);
  }
}
