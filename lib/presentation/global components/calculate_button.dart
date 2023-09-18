import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    super.key,
    required this.iconData,
    this.borderColor,
    this.bgColor,
    this.onTap,
  });
  final IconData iconData;
  final Color? borderColor;
  final Color? bgColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 2),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(
            width: 0.5,
            color: borderColor ?? AppColors.grey,
          ),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Icon(
          iconData,
          size: 12,
        ),
      ),
    );
  }
}
