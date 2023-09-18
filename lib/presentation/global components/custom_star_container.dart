import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/style/font_sizes.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:get/get.dart';

class CustomStarContainer extends StatelessWidget {
  const CustomStarContainer({
    super.key,
    this.height,
    this.width,
    this.iconSize,
    this.rateSize,
    this.bgColor,
  });
  final double? height;
  final double? width;
  final double? iconSize;
  final double? rateSize;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? Get.height * 0.03,
      width: width ?? Get.width * 0.11,
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      decoration: BoxDecoration(
        color: bgColor ?? AppColors.bgColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // star icon
          Icon(
            Icons.star,
            color: AppColors.yellow,
            size: iconSize ?? 12,
          ),
          AddSpace().horizontal(5),
          // rate
          CustomText(
            text: '4.9',
            fontSize: rateSize ?? AppFontSizes.unImportant10,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
