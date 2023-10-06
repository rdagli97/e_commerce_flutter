import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/user_controller.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_container.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_textformfield.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/unfocus_widget.dart';
import 'package:flutter_e_commerce_app/presentation/screens/auth/company_login_screen/company_login_screen.dart';
import 'package:flutter_e_commerce_app/resources/consts/strings.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/style/font_sizes.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:flutter_e_commerce_app/resources/utils/navigate_skills.dart';
import 'package:provider/provider.dart';

class CompanyRegisterScreen extends StatefulWidget {
  const CompanyRegisterScreen({super.key});

  @override
  State<CompanyRegisterScreen> createState() => _CompanyRegisterScreenState();
}

class _CompanyRegisterScreenState extends State<CompanyRegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCController = TextEditingController();

  Future<void> _signUpClick() async {
    await context.read<UserController>().registerCompany(
          context: context,
          mounted: mounted,
          username: _usernameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          phone: _phoneController.text,
        );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordCController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Duration startDuration = Duration(milliseconds: 400);
    return unFocus(
      context: context,
      child: Scaffold(
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
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
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
                  child: Form(
                    key: formKey,
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
                          onTap: () {
                            NavigateSkills().pushReplacementTo(
                              context,
                              const CompanyLoginScreen(),
                            );
                          },
                          child: const CustomText(
                            text: AppStrings.loginCom,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        AddSpace().vertical(20),
                        // username textfield
                        CustomTextFormField(
                          controller: _usernameController,
                          hintText: 'Company name',
                          validator: (val) =>
                              val!.isEmpty ? "Username can't be null" : null,
                        ),
                        AddSpace().vertical(10),
                        // email textfield
                        CustomTextFormField(
                          controller: _emailController,
                          hintText: AppStrings.email,
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) =>
                              val!.isEmpty ? "Email can't be null" : null,
                        ),
                        AddSpace().vertical(10),
                        // phone textfield
                        CustomTextFormField(
                          controller: _phoneController,
                          hintText: 'Phone number',
                          keyboardType: TextInputType.phone,
                          validator: (val) => val!.length != 11
                              ? "Phone have to be 11 chars"
                              : null,
                        ),
                        AddSpace().vertical(10),
                        // password textfield
                        CustomTextFormField(
                          controller: _passwordController,
                          hintText: AppStrings.password,
                          obscureText: true,
                          maxLines: 1,
                          validator: (val) =>
                              val!.length < 6 ? "Min 6 chars required" : null,
                        ),
                        AddSpace().vertical(10),
                        // password confirm textfield
                        CustomTextFormField(
                          controller: _passwordCController,
                          hintText: AppStrings.passwordC,
                          obscureText: true,
                          maxLines: 1,
                          validator: (val) => val! != _passwordController.text
                              ? "Password does not match"
                              : null,
                        ),
                        AddSpace().vertical(10),
                        // sign up button
                        CustomButton(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              await _signUpClick();
                            }
                          },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
