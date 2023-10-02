import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/screens/bottom_nb/bottom_nb_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/create_new_product/add_photo_screen.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/navigate_skills.dart';

Future<dynamic> createNewProductDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: const EdgeInsets.all(20),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Column(
          children: [
            // Add photo
            CustomButton(
              color: AppColors.primaryColor,
              onTap: () {
                NavigateSkills().pushReplacementTo(
                  context,
                  const AddPhotoScreen(),
                );
              },
              child: const CustomText(
                text: 'Add photo',
                color: AppColors.white,
              ),
            ),
            const Spacer(),
            // Publish with no image
            CustomButton(
              onTap: () {
                NavigateSkills().pushReplacementTo(
                  context,
                  const BottomNBScreen(),
                );
              },
              child: const CustomText(
                text: 'Publish with no image',
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
