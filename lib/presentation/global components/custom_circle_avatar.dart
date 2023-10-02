import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    super.key,
    this.isBorderEnabled = false,
    required this.image,
  });
  final bool isBorderEnabled;
  final DecorationImage? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isBorderEnabled ? 120 : 90,
      width: isBorderEnabled ? 120 : 90,
      decoration: BoxDecoration(
        image: image,
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(360),
        border: isBorderEnabled
            ? Border.all(color: AppColors.primaryColor, width: 3)
            : null,
      ),
    );
  }
}
