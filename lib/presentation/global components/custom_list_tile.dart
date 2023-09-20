import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_icon_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_star_container.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/consts/assets_strings.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/style/font_sizes.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // route detail page
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddSpace().vertical(10),
            // image
            Stack(
              children: [
                Container(
                  width: 130,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: AppColors.bgColor,
                    image: DecorationImage(
                      image: AssetImage(AppAssets.watch1Asset),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // fav button
                Positioned(
                  right: 5,
                  top: 5,
                  child: CustomIconButton(
                    iconData: Icons.favorite_outline_rounded,
                    color: AppColors.white,
                    onTap: () {},
                  ),
                ),
                const CustomStarContainer(),
              ],
            ),
            AddSpace().vertical(5),
            // Title
            const CustomText(
              text: 'Title',
              fontSize: AppFontSizes.shopTitle12,
            ),
            AddSpace().vertical(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 75,
                  child: CustomText(
                    text: '\$ 129.99',
                    fontSize: AppFontSizes.shopTitle12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // add to card button
                CustomIconButton(
                  iconData: Icons.shopping_bag,
                  onTap: () {},
                  color: AppColors.bgColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
