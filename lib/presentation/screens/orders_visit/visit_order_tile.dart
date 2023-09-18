import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/consts/assets_strings.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:get/get.dart';

class VisitOrderTile extends StatelessWidget {
  const VisitOrderTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: Get.width,
      height: Get.height * 0.2,
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
            width: Get.width * 0.25,
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
                  width: Get.width * 0.36,
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
                  width: Get.width * 0.36,
                  child: CustomText(
                    text: 'Subtitle' * 10,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0).copyWith(left: 0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // piece
                CustomText(
                  text: '1x',
                ),
                // $ price
                CustomText(
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
