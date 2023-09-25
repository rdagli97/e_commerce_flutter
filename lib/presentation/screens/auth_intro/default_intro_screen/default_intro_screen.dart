import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/screens/auth_intro/company_intro_screen/company_intro_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/auth_intro/intro_screen/intro_screen.dart';
import 'package:flutter_e_commerce_app/resources/consts/assets_strings.dart';
import 'package:flutter_e_commerce_app/resources/consts/strings.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/style/font_sizes.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:flutter_e_commerce_app/resources/utils/navigate_skills.dart';

class DefaultIntroScreen extends StatelessWidget {
  const DefaultIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int startDuration = 400;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 13),
        child: Column(
          children: [
            // image
            BounceInDown(
              duration: Duration(milliseconds: startDuration),
              child: const Image(
                image: AssetImage(AppAssets.defaultIntroAsset),
              ),
            ),
            AddSpace().vertical(10),
            // intro Title
            BounceInLeft(
              duration: Duration(milliseconds: startDuration * 2),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: AppStrings.defaultIntroTitle,
                  fontSize: AppFontSizes.header18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            AddSpace().vertical(10),
            // subtitle
            BounceInLeft(
              duration: Duration(milliseconds: startDuration * 3),
              child: const CustomText(
                text: AppStrings.introSubtitle,
                fontSize: AppFontSizes.description14,
                maxLines: 5,
              ),
            ),
            AddSpace().vertical(30),
            // Continue as a : Text
            BounceInRight(
              duration: Duration(milliseconds: startDuration * 4),
              child: const CustomText(text: AppStrings.continueAsa),
            ),
            AddSpace().vertical(30),
            // Company button
            BounceInLeft(
              duration: Duration(milliseconds: startDuration * 4),
              child: CustomButton(
                width: 175,
                color: AppColors.primaryColor,
                onTap: () {
                  NavigateSkills().pushTo(
                    context,
                    const CompanyIntroScreen(),
                  );
                },
                child: const CustomText(
                  text: AppStrings.company,
                  color: AppColors.bgColor,
                ),
              ),
            ),
            AddSpace().vertical(30),
            // OR text
            BounceInLeft(
              duration: Duration(milliseconds: startDuration * 4),
              child: const CustomText(text: AppStrings.or),
            ),
            AddSpace().vertical(30),
            // Customer button
            BounceInRight(
              duration: Duration(milliseconds: startDuration * 4),
              child: CustomButton(
                width: 175,
                onTap: () {
                  NavigateSkills().pushTo(
                    context,
                    const IntroScreen(),
                  );
                },
                child: const CustomText(
                  text: AppStrings.customer,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
