import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/shop_card_tile.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/style/font_sizes.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:flutter_e_commerce_app/presentation/screens/card_screen/calculator_container.dart';
import 'package:get/get.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(text: 'My carts'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                // delete
              },
              child: const CustomText(
                text: 'Delete',
                color: AppColors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.45,
              child: ListView(
                children: const [
                  ShopCardTile(),
                  ShopCardTile(),
                  ShopCardTile(),
                  ShopCardTile(),
                  ShopCardTile(),
                ],
              ),
            ),
            // calculate price
            const CalculatorContainer(),
            AddSpace().vertical(Get.height * 0.05),
            // Buy button
            CustomButton(
              color: AppColors.primaryColor,
              onTap: () {},
              child: const CustomText(
                text: 'Buy',
                color: AppColors.white,
                fontSize: AppFontSizes.description14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
