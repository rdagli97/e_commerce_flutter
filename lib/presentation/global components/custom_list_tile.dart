import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_icon_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_star_container.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/screens/home/custom_discount_container.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/style/font_sizes.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.image,
    required this.onTap,
    required this.price,
    required this.rating,
    required this.title,
    this.discounted = false,
    this.oldPrice,
    this.discountValue = 0,
  });
  final Function()? onTap;
  final String title;
  final double price;
  final String image;
  final double rating;
  final bool? discounted;
  final double? oldPrice;
  final int? discountValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                  decoration: BoxDecoration(
                    color: AppColors.bgColor,
                    image: DecorationImage(
                      image: NetworkImage(image),
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
                Positioned(
                  right: -15,
                  bottom: 15,
                  child: SizedBox(
                    child: discounted ?? false
                        ? CustomDiscountContainer(text: '%$discountValue')
                        : null,
                  ),
                ),
              ],
            ),
            AddSpace().vertical(5),
            // Title
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              child: CustomText(
                text: title,
                fontSize: AppFontSizes.shopTitle12,
                maxLines: 1,
              ),
            ),
            AddSpace().vertical(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                discounted ?? false
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: '\$ $oldPrice',
                            fontSize: 8,
                            color: AppColors.red,
                            isLineThrough: true,
                          ),
                          SizedBox(
                            width: 75,
                            child: CustomText(
                              text: '\$ $price',
                              fontSize: AppFontSizes.shopTitle12,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    : SizedBox(
                        width: 75,
                        child: CustomText(
                          text: '\$ $price',
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
