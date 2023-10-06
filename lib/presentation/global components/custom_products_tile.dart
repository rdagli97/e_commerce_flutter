import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_star_container.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';

class CustomProductTile extends StatelessWidget {
  const CustomProductTile({
    super.key,
    this.statusColor,
    this.statusText,
    this.onSelected,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.onTap,
  });
  final String? statusText;
  final Color? statusColor;
  final Function(String)? onSelected;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imageUrl),
                ),
              ),
            ),
            AddSpace().horizontal(20),
            Padding(
              padding: const EdgeInsets.all(8).copyWith(right: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.36,
                    child: CustomText(
                      text: title,
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
                      text: description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      fontSize: 13,
                    ),
                  ),
                  AddSpace().vertical(12),
                  // Status
                  const Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.36,
                    child: CustomText(
                      text: statusText ?? '• Online',
                      color: statusColor ?? AppColors.primaryColor,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Delete & Edit button
                  PopupMenuButton(
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    itemBuilder: (context) => [
                      // change price
                      const PopupMenuItem(
                        value: 'change price',
                        child: CustomText(
                          text: 'Change price',
                        ),
                      ),
                      // give discount
                      const PopupMenuItem(
                        value: 'give discount',
                        child: CustomText(
                          text: 'Give discount',
                        ),
                      ),
                      // cancel discount
                      const PopupMenuItem(
                        value: 'cancel discount',
                        child: CustomText(
                          text: 'Cancel discount',
                        ),
                      ),
                      // delete
                      const PopupMenuItem(
                        value: 'delete',
                        child: CustomText(
                          text: 'Delete',
                          color: AppColors.red,
                        ),
                      ),
                    ],
                    onSelected: onSelected,
                  ),
                  AddSpace()
                      .vertical(MediaQuery.of(context).size.height * 0.03),
                  // star rating
                  const CustomStarContainer(),
                  AddSpace()
                      .vertical(MediaQuery.of(context).size.height * 0.008),
                  // $ price
                  CustomText(
                    text: '\$ $price',
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
