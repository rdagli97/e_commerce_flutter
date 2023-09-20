import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_image_container.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/consts/assets_strings.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';

class CustomCommentTile extends StatelessWidget {
  const CustomCommentTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 13),
      margin: const EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width * 0.1,
      height: MediaQuery.of(context).size.height * 0.28,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: AppColors.blue,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          const CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(AppAssets.profile5Asset),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // username
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: const CustomText(
                        text: 'Username',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AddSpace().horizontal(5),
                    const Row(
                      children: [
                        // stars
                        Icon(
                          Icons.star,
                          size: 10,
                          color: AppColors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          size: 10,
                          color: AppColors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          size: 10,
                          color: AppColors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          size: 10,
                          color: AppColors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          size: 10,
                          color: AppColors.yellow,
                        ),
                      ],
                    ),
                  ],
                ),
                AddSpace().vertical(10),
                // Comment,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: CustomText(
                    text: 'Description' * 100,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 13,
                  ),
                ),
                AddSpace().vertical(10),
                // Images of products,
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      CustomImageContainer(),
                      CustomImageContainer(),
                      CustomImageContainer(),
                      CustomImageContainer(),
                      CustomImageContainer(),
                      CustomImageContainer(),
                      CustomImageContainer(),
                      CustomImageContainer(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
