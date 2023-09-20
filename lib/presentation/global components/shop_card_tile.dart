import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/calculate_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/consts/assets_strings.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/style/font_sizes.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';

class ShopCardTile extends StatelessWidget {
  const ShopCardTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: [
          // Image
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.height * 0.12,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppAssets.watch1Asset),
              ),
            ),
          ),
          AddSpace().horizontal(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: CustomText(
                  text: 'Title' * 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
              AddSpace().vertical(10),
              const Row(
                children: [
                  // Size
                  CustomText(
                    text: 'Size : ',
                    color: AppColors.grey,
                    fontSize: AppFontSizes.unImportant10,
                  ),
                  // M / L / XL / S
                  CustomText(
                    text: 'M',
                    fontSize: AppFontSizes.unImportant10,
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // price
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                child: const CustomText(
                  text: '\$ 129.99',
                  fontWeight: FontWeight.bold,
                ),
              ),
              // discount , if there is
              Row(
                children: [
                  // decrement button
                  const CalculateButton(iconData: Icons.remove),
                  AddSpace().horizontal(3),
                  // piece
                  const CustomText(text: '1'),
                  // increment button
                  AddSpace().horizontal(3),
                  const CalculateButton(iconData: Icons.add),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
