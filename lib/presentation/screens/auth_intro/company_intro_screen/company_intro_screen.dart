import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/domain/controllers/screen_controller/company_intro_controller.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/consts/assets_strings.dart';
import 'package:flutter_e_commerce_app/resources/consts/strings.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/style/font_sizes.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:get/get.dart';

class CompanyIntroScreen extends StatelessWidget {
  const CompanyIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CompanyIntroController companyIntroController =
        Get.put(CompanyIntroController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 13),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // image
              BounceInDown(
                duration: Duration(
                    milliseconds: companyIntroController.startDuration),
                child: const Image(
                  image: AssetImage(AppAssets.companyIntroAsset),
                ),
              ),
              AddSpace().vertical(10),
              // intro Title
              BounceInLeft(
                duration: Duration(
                    milliseconds: companyIntroController.startDuration * 2),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    text: AppStrings.companyIntroTitle,
                    fontSize: AppFontSizes.header18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              AddSpace().vertical(10),
              // subtitle
              BounceInLeft(
                duration: Duration(
                    milliseconds: companyIntroController.startDuration * 3),
                child: const CustomText(
                  text: AppStrings.introSubtitle,
                  fontSize: AppFontSizes.description14,
                ),
              ),
              AddSpace().vertical(15),
              // as a company text
              FadeInLeft(
                duration: Duration(
                    milliseconds: companyIntroController.startDuration * 4),
                child: const CustomText(text: AppStrings.asACompany),
              ),
              AddSpace().vertical(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Login button
                  BounceInLeft(
                    duration: Duration(
                        milliseconds: companyIntroController.startDuration * 4),
                    child: CustomButton(
                      width: 175,
                      color: AppColors.primaryColor,
                      onTap: companyIntroController.loginTAP,
                      child: const CustomText(
                        text: AppStrings.login,
                        color: AppColors.bgColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Signup button
                  BounceInRight(
                    duration: Duration(
                        milliseconds: companyIntroController.startDuration * 4),
                    child: CustomButton(
                      width: 175,
                      onTap: companyIntroController.signupTAP,
                      child: const CustomText(
                        text: AppStrings.signup,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              AddSpace().vertical(5),
              // back button
              CustomButton(
                onTap: companyIntroController.backTAP,
                child: const Icon(Icons.chevron_left_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
