import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_icon_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_star_container.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/consts/assets_strings.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';

class CustomOrderTile extends StatelessWidget {
  const CustomOrderTile({
    super.key,
    this.statusColor,
    this.statusText,
  });
  final String? statusText;
  final Color? statusColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: AppColors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // Container Image
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppAssets.watch1Asset),
              ),
            ),
          ),
          AddSpace().horizontal(20),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.36,
                  child: CustomText(
                    text: 'Title' * 5,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AddSpace().vertical(5),
                // Subtitle
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.36,
                  child: CustomText(
                    text: 'Subtitle' * 10,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 13,
                  ),
                ),
                AddSpace().vertical(12),
                // Status
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.36,
                  child: CustomText(
                    text: statusText ?? '• Completed',
                    color: statusColor ?? AppColors.primaryColor,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(left: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Favourite button
                CustomIconButton(
                  iconData: Icons.favorite_border,
                  onTap: () {},
                ),
                // star rating
                const CustomStarContainer(),
                // piece
                const CustomText(
                  text: '1x',
                ),
                // $ price
                const CustomText(
                  text: '\$ 129.99',
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
