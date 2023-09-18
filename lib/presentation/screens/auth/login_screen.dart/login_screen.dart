import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/domain/controllers/screen_controller/login_screen_controller.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_container.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_textformfield.dart';
import 'package:flutter_e_commerce_app/resources/consts/strings.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/style/font_sizes.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginScreenController loginScreenController = LoginScreenController();
    final Duration startDuration =
        Duration(milliseconds: loginScreenController.startDuration);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // container with title
            BounceInDown(
              duration: startDuration * 1.5,
              child: const CustomContainer(),
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
                      text: AppStrings.signIn,
                      fontSize: AppFontSizes.subTitle16,
                      fontWeight: FontWeight.bold,
                    ),
                    AddSpace().vertical(20),
                    // description
                    const CustomText(
                      text: AppStrings.welcomeBack,
                    ),
                    AddSpace().vertical(5),
                    // Sign up text button
                    GestureDetector(
                      onTap: loginScreenController.signUpTap,
                      child: const CustomText(
                        text: AppStrings.signup,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    AddSpace().vertical(20),
                    // email textfield
                    CustomTextFormField(
                      controller: loginScreenController.emailController,
                      hintText: AppStrings.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    AddSpace().vertical(10),
                    // password textfield
                    CustomTextFormField(
                      controller: loginScreenController.passwordController,
                      hintText: AppStrings.password,
                      obscureText: true,
                    ),
                    AddSpace().vertical(20),
                    // log in button
                    CustomButton(
                      onTap: loginScreenController.logInTap,
                      color: AppColors.primaryColor,
                      child: const CustomText(
                        text: AppStrings.login,
                        color: AppColors.bgColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AddSpace().vertical(20),
                    // back button
                    CustomButton(
                      onTap: loginScreenController.backTAP,
                      child: const Icon(Icons.chevron_left_rounded),
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
