import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';

class CustomDiscountContainer extends StatelessWidget {
  const CustomDiscountContainer({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -45,
      child: Container(
        width: 50,
        height: 10,
        decoration: const BoxDecoration(
          color: AppColors.red,
        ),
        child: Center(
          child: CustomText(
            text: text,
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 8,
          ),
        ),
      ),
    );
  }
}
