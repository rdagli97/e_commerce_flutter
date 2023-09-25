import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/user_controller.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_container.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_textformfield.dart';
import 'package:flutter_e_commerce_app/presentation/screens/auth/company_register_screen/company_register_screen.dart';
import 'package:flutter_e_commerce_app/resources/consts/strings.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/style/font_sizes.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:flutter_e_commerce_app/resources/utils/navigate_skills.dart';
import 'package:provider/provider.dart';

class CompanyLoginScreen extends StatefulWidget {
  const CompanyLoginScreen({super.key});

  @override
  State<CompanyLoginScreen> createState() => _CompanyLoginScreenState();
}

class _CompanyLoginScreenState extends State<CompanyLoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _loginClick() async {
    await context.read<UserController>().login(
          context: context,
          mounted: mounted,
          email: _emailController.text,
          password: _passwordController.text,
        );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserController userWatch = context.watch<UserController>();
    const Duration startDuration = Duration(milliseconds: 400);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
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
                        onTap: () {
                          NavigateSkills().pushReplacementTo(
                            context,
                            const CompanyRegisterScreen(),
                          );
                        },
                        child: const CustomText(
                          text: AppStrings.signup,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      AddSpace().vertical(20),
                      // email textfield
                      CustomTextFormField(
                        controller: _emailController,
                        hintText: AppStrings.email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) =>
                            val!.isEmpty ? "Can't be null" : null,
                      ),
                      AddSpace().vertical(10),
                      // password textfield
                      CustomTextFormField(
                        controller: _passwordController,
                        hintText: AppStrings.password,
                        obscureText: true,
                        maxLines: 1,
                        validator: (val) =>
                            val!.length < 6 ? "Required min 6 chars" : null,
                      ),
                      AddSpace().vertical(20),
                      // log in button
                      userWatch.isLoading
                          ? const CircularProgressIndicator()
                          : CustomButton(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  _loginClick();
                                }
                              },
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
      ),
    );
  }
}
