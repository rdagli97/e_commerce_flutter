import 'package:flutter_e_commerce_app/domain/controllers/bindings/animation_binding.dart';
import 'package:flutter_e_commerce_app/domain/controllers/bindings/example_binding.dart';
import 'package:get/get.dart';

class StartUpBindings extends Bindings {
  @override
  void dependencies() {
    ExampleBinding().dependencies();
    AnimationBinding().dependencies();
  }
}
