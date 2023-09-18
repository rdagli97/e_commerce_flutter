import 'package:flutter_e_commerce_app/domain/controllers/data_controller/animation_data_controller.dart';
import 'package:get/get.dart';

class AnimationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AnimationDataController>(AnimationDataController(),
        permanent: true);
  }
}
