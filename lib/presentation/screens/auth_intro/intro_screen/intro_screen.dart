import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/screens/auth/login_screen.dart/login_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/auth/signup/signup_screen.dart';
import 'package:flutter_e_commerce_app/resources/consts/assets_strings.dart';
import 'package:flutter_e_commerce_app/resources/consts/strings.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/style/font_sizes.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:flutter_e_commerce_app/resources/utils/navigate_skills.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

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
                image: AssetImage(AppAssets.introAsset),
              ),
            ),
            AddSpace().vertical(10),
            // intro Title
            BounceInLeft(
              duration: Duration(milliseconds: startDuration * 2),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: AppStrings.introTitle,
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
              ),
            ),
            AddSpace().vertical(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Login button
                BounceInLeft(
                  duration: Duration(milliseconds: startDuration * 4),
                  child: CustomButton(
                    width: 175,
                    color: AppColors.primaryColor,
                    onTap: () {
                      NavigateSkills().pushTo(
                        context,
                        const LoginScreen(),
                      );
                    },
                    child: const CustomText(
                      text: AppStrings.login,
                      color: AppColors.bgColor,
                    ),
                  ),
                ),
                const Spacer(),
                // Signup button
                BounceInRight(
                  duration: Duration(milliseconds: startDuration * 4),
                  child: CustomButton(
                    width: 175,
                    onTap: () {
                      NavigateSkills().pushTo(
                        context,
                        const SignupScreen(),
                      );
                    },
                    child: const CustomText(
                      text: AppStrings.signup,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            AddSpace().vertical(10),
            // back button
            FadeInUp(
              child: CustomButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.chevron_left_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
