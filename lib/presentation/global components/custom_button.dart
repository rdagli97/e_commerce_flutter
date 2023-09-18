import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.color = AppColors.bgColor,
    this.child,
    this.height,
    this.width,
    required this.onTap,
  });
  final Color? color;
  final Widget? child;
  final double? width;
  final double? height;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? Get.width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Center(child: child),
      ),
    );
  }
}
