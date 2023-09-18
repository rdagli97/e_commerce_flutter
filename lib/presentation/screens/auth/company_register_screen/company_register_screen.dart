import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/domain/controllers/screen_controller/company_register_controller.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_container.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_textformfield.dart';
import 'package:flutter_e_commerce_app/resources/consts/strings.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/style/font_sizes.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';

class CompanyRegisterScreen extends StatelessWidget {
  const CompanyRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CompanyRegisterController companyRegisterController =
        CompanyRegisterController();
    final Duration startDuration =
        Duration(milliseconds: companyRegisterController.startDuration);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // container
            BounceInDown(
              duration: startDuration * 1.5,
              child: CustomContainer(
                height: 80,
                child: IconButton(
                  alignment: Alignment.centerLeft,
                  onPressed: companyRegisterController.backTAP,
                  icon: const Icon(
                    Icons.chevron_left_rounded,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 13.0, horizontal: 20),
              child: FadeInUp(
                duration: startDuration * 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // sign up header
                    const CustomText(
                      text: AppStrings.signupCom,
                      fontSize: AppFontSizes.subTitle16,
                      fontWeight: FontWeight.bold,
                    ),
                    AddSpace().vertical(20),
                    // description
                    const CustomText(
                      text: AppStrings.haveAccountCom,
                    ),
                    AddSpace().vertical(5),
                    // Log in text button
                    GestureDetector(
                      onTap: companyRegisterController.logInTap,
                      child: const CustomText(
                        text: AppStrings.loginCom,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    AddSpace().vertical(20),
                    // username textfield
                    CustomTextFormField(
                      controller: companyRegisterController.usernameController,
                      hintText: 'Company name',
                    ),
                    AddSpace().vertical(10),
                    // email textfield
                    CustomTextFormField(
                      controller: companyRegisterController.emailController,
                      hintText: AppStrings.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    AddSpace().vertical(10),
                    // location textfield
                    CustomTextFormField(
                      controller: companyRegisterController.usernameController,
                      hintText: 'Location e.g:City/town/neighbourhood/no',
                    ),
                    AddSpace().vertical(10),
                    // phone textfield
                    CustomTextFormField(
                      controller: companyRegisterController.usernameController,
                      hintText: 'Phone number',
                      keyboardType: TextInputType.phone,
                    ),
                    AddSpace().vertical(10),
                    // password textfield
                    CustomTextFormField(
                      controller: companyRegisterController.passwordController,
                      hintText: AppStrings.password,
                      obscureText: true,
                    ),
                    AddSpace().vertical(10),
                    // password confirm textfield
                    CustomTextFormField(
                      controller: companyRegisterController.passwordCController,
                      hintText: AppStrings.passwordC,
                      obscureText: true,
                    ),
                    AddSpace().vertical(10),
                    // sign up button
                    CustomButton(
                      onTap: companyRegisterController.signUpTap,
                      color: AppColors.primaryColor,
                      child: const CustomText(
                        text: AppStrings.signup,
                        color: AppColors.bgColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
