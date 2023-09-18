import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.iconData,
    required this.onTap,
    this.color = AppColors.white,
    this.iconColor,
  });
  final IconData? iconData;
  final Function()? onTap;
  final Color? color;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          iconData,
          size: 15,
          color: iconColor,
        ),
      ),
    );
  }
}
