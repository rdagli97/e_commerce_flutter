import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/domain/controllers/screen_controller/profile_screen_controller.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_icon_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_star_container.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:get/get.dart';

import '../../../resources/consts/assets_strings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isCustomer = true;
  @override
  Widget build(BuildContext context) {
    final ProfileScreenController profileScreenController =
        Get.put<ProfileScreenController>(
      ProfileScreenController(),
    );
    return Scaffold(
        body: isCustomer
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isCustomer = !isCustomer;
                          });
                        },
                        icon: const Icon(Icons.change_circle),
                      ),
                      // Image
                      Stack(
                        children: [
                          const CircleAvatar(
                            backgroundColor: AppColors.white,
                            radius: 64,
                            backgroundImage: AssetImage(
                              AppAssets.profile5Asset,
                            ),
                          ),
                          // camera icon
                          Positioned(
                            bottom: 8,
                            right: 12,
                            child: CustomIconButton(
                              iconData: Icons.camera_alt_rounded,
                              onTap: () {
                                // pick image
                              },
                              color: AppColors.bgColor,
                            ),
                          ),
                        ],
                      ),
                      AddSpace().vertical(20),
                      // username
                      const CustomText(
                        text: 'Username',
                        fontWeight: FontWeight.bold,
                      ),
                      AddSpace().vertical(5),
                      // email
                      const CustomText(
                        text: 'rdagli97@gmail.com',
                      ),
                      AddSpace().vertical(5),
                      // Phone
                      const CustomText(
                        text: '+(90) 05xx 555 5555',
                      ),
                      AddSpace().vertical(10),
                      // eye view
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomIconButton(
                          iconData: Icons.remove_red_eye,
                          iconColor: AppColors.blue,
                          onTap: profileScreenController.customerEyeViewTAP,
                        ),
                      ),
                      AddSpace().vertical(10),
                      // my orders button
                      CustomButton(
                        onTap: profileScreenController.myOrderTAP,
                        child: const CustomText(
                          text: 'My orders',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AddSpace().vertical(20),
                      // my comments button
                      CustomButton(
                        onTap: profileScreenController.myCommentsTAP,
                        child: const CustomText(
                          text: 'My comments',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AddSpace().vertical(20),
                      // Edit profile button
                      CustomButton(
                        onTap: profileScreenController.customerEditTAP,
                        child: const CustomText(
                          text: 'Edit profile',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AddSpace().vertical(20),
                      // log out button
                      CustomButton(
                        onTap: profileScreenController.customerLogoutTAP,
                        child: const CustomText(
                          text: 'Log out',
                          color: AppColors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AddSpace().vertical(20),
                    ],
                  ),
                ),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isCustomer = !isCustomer;
                          });
                        },
                        icon: const Icon(Icons.change_circle),
                      ),
                      // Image
                      Stack(
                        children: [
                          const CircleAvatar(
                            backgroundColor: AppColors.white,
                            radius: 64,
                            backgroundImage: AssetImage(
                              AppAssets.profile1Asset,
                            ),
                          ),
                          // camera icon
                          Positioned(
                            bottom: 8,
                            right: 12,
                            child: CustomIconButton(
                              iconData: Icons.camera_alt_rounded,
                              onTap: () {
                                // pick image
                              },
                              color: AppColors.bgColor,
                            ),
                          ),
                        ],
                      ),
                      AddSpace().vertical(10),
                      // rating
                      const CustomStarContainer(),
                      AddSpace().vertical(10),
                      // username
                      const CustomText(
                        text: 'Company name',
                        fontWeight: FontWeight.bold,
                      ),
                      AddSpace().vertical(5),
                      // email
                      const CustomText(
                        text: 'workemail@gmail.com',
                      ),
                      AddSpace().vertical(5),
                      // phone number
                      const CustomText(
                        text: '+(90) 555 555 5555',
                      ),
                      AddSpace().vertical(10),
                      // Eye view
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomIconButton(
                          iconData: Icons.remove_red_eye,
                          iconColor: AppColors.blue,
                          onTap: profileScreenController.companyEyeViewTAP,
                        ),
                      ),
                      AddSpace().vertical(10),
                      // my orders button
                      CustomButton(
                        onTap: profileScreenController.myProductsTAP,
                        child: const CustomText(
                          text: 'My products',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AddSpace().vertical(20),
                      // my sales button
                      CustomButton(
                        onTap: profileScreenController.mySalesTAP,
                        child: const CustomText(
                          text: 'My sales',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AddSpace().vertical(20),
                      // Edit profile button
                      CustomButton(
                        onTap: profileScreenController.companyEditTAP,
                        child: const CustomText(
                          text: 'Edit profile',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AddSpace().vertical(20),
                      // Edit about us button
                      CustomButton(
                        onTap: profileScreenController.companyAboutUsTAP,
                        child: const CustomText(
                          text: 'Edit about us',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AddSpace().vertical(20),
                      // log out button
                      CustomButton(
                        onTap: profileScreenController.companyLogoutTAP,
                        child: const CustomText(
                          text: 'Log out',
                          color: AppColors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AddSpace().vertical(20),
                    ],
                  ),
                ),
              ));
  }
}
