import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_circle_avatar.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_container.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_textformfield.dart';
import 'package:flutter_e_commerce_app/presentation/screens/auth/login_screen.dart/login_screen.dart';
import 'package:flutter_e_commerce_app/resources/consts/strings.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/style/font_sizes.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:flutter_e_commerce_app/resources/utils/navigate_skills.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  Future<void> _pickImage() async {}

  Future<void> _signUpClick() async {}

  @override
  Widget build(BuildContext context) {
    const Duration startDuration = Duration(milliseconds: 400);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // container with title
            BounceInDown(
              duration: startDuration * 1.5,
              child: Stack(
                children: [
                  const CustomContainer(),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.07,
                    left: MediaQuery.of(context).size.width * 0.4,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: const CustomCircleAvatar(
                        radius: 36,
                      ),
                    ),
                  ),
                ],
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
                      text: AppStrings.signup,
                      fontSize: AppFontSizes.subTitle16,
                      fontWeight: FontWeight.bold,
                    ),
                    AddSpace().vertical(20),
                    // description
                    const CustomText(
                      text: AppStrings.haveAccount,
                    ),
                    AddSpace().vertical(5),
                    // Log in text button
                    GestureDetector(
                      onTap: () {
                        NavigateSkills().pushReplacementTo(
                          context,
                          const LoginScreen(),
                        );
                      },
                      child: const CustomText(
                        text: AppStrings.login,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    AddSpace().vertical(20),
                    // username textfield
                    CustomTextFormField(
                      controller: TextEditingController(),
                      hintText: AppStrings.username,
                    ),
                    AddSpace().vertical(10),
                    // email textfield
                    CustomTextFormField(
                      controller: TextEditingController(),
                      hintText: AppStrings.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    AddSpace().vertical(10),
                    // password textfield
                    CustomTextFormField(
                      controller: TextEditingController(),
                      hintText: AppStrings.password,
                      obscureText: true,
                      maxLines: 1,
                    ),
                    AddSpace().vertical(10),
                    // password confirm textfield
                    CustomTextFormField(
                      controller: TextEditingController(),
                      hintText: AppStrings.passwordC,
                      obscureText: true,
                      maxLines: 1,
                    ),
                    AddSpace().vertical(10),
                    // sign up button
                    CustomButton(
                      onTap: _signUpClick,
                      color: AppColors.primaryColor,
                      child: const CustomText(
                        text: AppStrings.signup,
                        color: AppColors.bgColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    AddSpace().vertical(5),
                    // back button
                    CustomButton(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
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
