import 'package:flutter_e_commerce_app/domain/router/route.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
  void myOrderTAP() {
    Get.toNamed(AppRouter.myOrdersScreen);
  }

  void myCommentsTAP() {
    Get.toNamed(AppRouter.myCommentsScreen);
  }

  void customerEditTAP() {
    Get.toNamed(AppRouter.editCustomerProfileScreen);
  }

  void customerLogoutTAP() {
    // logout customer
  }

  void myProductsTAP() {
    Get.toNamed(AppRouter.myProductsScreen);
  }

  void mySalesTAP() {
    Get.toNamed(AppRouter.mySalesScreen);
  }

  void customerEyeViewTAP() {
    Get.toNamed(AppRouter.customerVisit);
  }

  void companyEyeViewTAP() {
    Get.toNamed(AppRouter.companyVisit);
  }

  void companyEditTAP() {
    Get.toNamed(AppRouter.editCompanyProfileScreen);
  }

  void companyAboutUsTAP() {
    Get.toNamed(AppRouter.editCompanyAboutUs);
  }

  void companyLogoutTAP() {
    // logout company
  }
}
