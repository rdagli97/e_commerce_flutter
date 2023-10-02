import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_star_container.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';

class VisitProductTile extends StatelessWidget {
  const VisitProductTile({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.onTap,
    required this.imageUrl,
  });
  final String title;
  final String description;
  final double rating;
  final double price;
  final Function()? onTap;
  final String imageUrl;

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
              padding: const EdgeInsets.all(8),
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(left: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // star rating
                  CustomStarContainer(rate: rating),
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
