import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/discount_controller.dart';
import 'package:flutter_e_commerce_app/data/models/product_model.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/style/font_sizes.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:provider/provider.dart';

class DiscountCalculator extends StatelessWidget {
  const DiscountCalculator({
    super.key,
    required this.productsModel,
  });
  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    final discountWatch = context.watch<DiscountController>();
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
          Row(
            children: [
              // Sub-total text
              const CustomText(
                text: 'Old price',
                fontSize: AppFontSizes.subTitle16,
                fontWeight: FontWeight.w400,
              ),
              const Spacer(),
              // total price
              CustomText(
                text: '${productsModel.price}',
                fontSize: AppFontSizes.subTitle16,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          AddSpace().vertical(5),
          Row(
            children: [
              // Discount
              const CustomText(
                text: 'Discount',
                fontSize: AppFontSizes.subTitle16,
                fontWeight: FontWeight.w400,
              ),
              const Spacer(),
              // discount percentage
              CustomText(
                text: '${discountWatch.discountValue}',
                fontSize: AppFontSizes.subTitle16,
                fontWeight: FontWeight.w500,
                color: AppColors.red,
              ),
            ],
          ),
          AddSpace().vertical(MediaQuery.of(context).size.height * 0.02),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 2,
            decoration: const BoxDecoration(
              color: AppColors.inactiveColor,
            ),
          ),
          AddSpace().vertical(MediaQuery.of(context).size.height * 0.02),
          Row(
            children: [
              // Total text
              const CustomText(
                text: 'New Price',
                fontSize: AppFontSizes.subTitle16,
                fontWeight: FontWeight.w700,
              ),
              const Spacer(),
              // Total price
              CustomText(
                text: '\$ ${discountWatch.newPrice}',
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
