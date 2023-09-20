import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.color = AppColors.primaryColor,
    this.height = 160,
    this.width,
    this.child,
  });
  final double? width;
  final double? height;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height,
      decoration: BoxDecoration(
        color: color,
      ),
      child: child,
    );
  }
}
