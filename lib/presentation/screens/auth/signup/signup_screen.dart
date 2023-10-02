import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/user_controller.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_container.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_textformfield.dart';
import 'package:flutter_e_commerce_app/presentation/screens/auth/login_screen.dart/login_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/auth/signup/gender_popup_menu.dart';
import 'package:flutter_e_commerce_app/resources/consts/strings.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/style/font_sizes.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:flutter_e_commerce_app/resources/utils/handle_error.dart';
import 'package:flutter_e_commerce_app/resources/utils/navigate_skills.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _genderText = 'Gender';
  String gender = 'male';

  Future<void> _signUpClick() async {
    await context.read<UserController>().registerCustomer(
          context: context,
          mounted: mounted,
          username: _usernameController.text,
          email: _emailController.text,
          password: _passwordController.text,
          phone: _phoneController.text,
          gender: gender,
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              // container with title
              BounceInDown(
                duration: startDuration * 1.5,
                child: CustomContainer(
                  height: MediaQuery.of(context).size.height * 0.05,
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
                        controller: _usernameController,
                        hintText: AppStrings.username,
                        validator: (val) =>
                            val!.isEmpty ? 'Username is required' : null,
                      ),
                      AddSpace().vertical(10),
                      // email textfield
                      CustomTextFormField(
                        controller: _emailController,
                        hintText: AppStrings.email,
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) =>
                            val!.isEmpty ? 'Email is required' : null,
                      ),
                      AddSpace().vertical(10),
                      // phone textfield
                      CustomTextFormField(
                        controller: _phoneController,
                        hintText: 'Phone',
                        keyboardType: TextInputType.phone,
                        validator: (val) => val!.length != 11
                            ? 'Phone have to be 11 chars'
                            : null,
                      ),
                      AddSpace().vertical(10),
                      // password textfield
                      CustomTextFormField(
                        controller: _passwordController,
                        hintText: AppStrings.password,
                        obscureText: true,
                        maxLines: 1,
                        validator: (val) => val!.length < 6
                            ? 'Password have to be min 6 chars'
                            : null,
                      ),
                      AddSpace().vertical(10),
                      // password confirm textfield
                      CustomTextFormField(
                        controller: _passwordCController,
                        hintText: AppStrings.passwordC,
                        obscureText: true,
                        maxLines: 1,
                        validator: (val) => val != _passwordController.text
                            ? 'Passwords does not match'
                            : null,
                      ),
                      AddSpace().vertical(5),
                      Align(
                        alignment: Alignment.center,
                        child: GenderPopupMenu(
                            genderText: _genderText,
                            onSelected: (value) {
                              if (value == 'male') {
                                setState(() {
                                  _genderText = 'Male';
                                  gender = 'male';
                                });
                              } else if (value == 'female') {
                                setState(() {
                                  _genderText = 'Female';
                                  gender = 'female';
                                });
                              }
                            }),
                      ),
                      AddSpace().vertical(5),
                      // sign up button
                      CustomButton(
                        onTap: () async {
                          if (formKey.currentState!.validate() &&
                              _genderText != 'Gender') {
                            await _signUpClick();
                          } else if (_genderText == 'Gender') {
                            HandleError()
                                .showErrorMessage(context, 'Gender required');
                          }
                        },
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
      ),
    );
  }
}
