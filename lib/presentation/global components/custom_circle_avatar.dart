import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    this.radius,
    this.bgColor,
    this.bgImage,
  });
  final double? radius;
  final Color? bgColor;
  final ImageProvider<Object>? bgImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.white,
          width: 4,
        ),
      ),
      child: CircleAvatar(
        radius: radius ?? 24,
        backgroundColor: bgColor,
        backgroundImage: bgImage,
      ),
    );
  }
}
