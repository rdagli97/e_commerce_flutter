import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/consts/assets_strings.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';

class CustomCategoryContainer extends StatelessWidget {
  const CustomCategoryContainer({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: AppColors.lightGreen,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          // image
          Container(
            height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 0.08,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppAssets.profile1Asset),
              ),
            ),
          ),
          AddSpace().vertical(5),
          // title
          CustomText(
            text: title,
            fontSize: 14.27,
          ),
        ],
      ),
    );
  }
}
