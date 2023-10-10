import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/style/font_sizes.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';

class CustomStarContainer extends StatelessWidget {
  const CustomStarContainer({
    super.key,
    this.height,
    this.width,
    this.iconSize,
    this.rateSize,
    this.bgColor,
    this.rate = 0.0,
  });
  final double? height;
  final double? width;
  final double? iconSize;
  final double? rateSize;
  final Color? bgColor;
  final double? rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? MediaQuery.of(context).size.height * 0.03,
      width: width ?? MediaQuery.of(context).size.width * 0.11,
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
      decoration: BoxDecoration(
        color: bgColor?.withOpacity(1) ?? AppColors.bgColor.withOpacity(0.3),
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
            text: '$rate',
            fontSize: rateSize ?? AppFontSizes.unImportant10,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
