import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/style/font_sizes.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:get/get.dart';

class CalculatorContainer extends StatelessWidget {
  const CalculatorContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: AppColors.grey,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Row(
            children: [
              // Sub-total text
              CustomText(
                text: 'Sub-total',
                fontSize: AppFontSizes.subTitle16,
                color: AppColors.grey,
                fontWeight: FontWeight.w400,
              ),
              Spacer(),
              // total price
              CustomText(
                text: '389,97',
                fontSize: AppFontSizes.subTitle16,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          const Row(
            children: [
              // Discount
              CustomText(
                text: 'Discount',
                fontSize: AppFontSizes.subTitle16,
                color: AppColors.grey,
                fontWeight: FontWeight.w400,
              ),
              Spacer(),
              // discount percentage
              CustomText(
                text: '-%10',
                fontSize: AppFontSizes.subTitle16,
                fontWeight: FontWeight.w500,
                color: AppColors.red,
              ),
            ],
          ),
          const Row(
            children: [
              // Delivery fee
              CustomText(
                text: 'Delivery fee',
                fontSize: AppFontSizes.subTitle16,
                color: AppColors.grey,
                fontWeight: FontWeight.w400,
              ),
              Spacer(),
              // delivery fee price
              CustomText(
                text: '\$ 20',
                fontSize: AppFontSizes.subTitle16,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          AddSpace().vertical(Get.height * 0.02),
          Container(
            width: Get.width,
            height: 2,
            decoration: const BoxDecoration(
              color: AppColors.inactiveColor,
            ),
          ),
          AddSpace().vertical(Get.height * 0.02),
          const Row(
            children: [
              // Total text
              CustomText(
                text: 'Total',
                fontSize: AppFontSizes.subTitle16,
                fontWeight: FontWeight.w700,
              ),
              Spacer(),
              // Total price
              CustomText(
                text: '\$ 370,97',
                fontSize: AppFontSizes.subTitle16,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
