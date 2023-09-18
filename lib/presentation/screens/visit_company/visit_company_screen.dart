import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/domain/controllers/screen_controller/visit_company_controller.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_star_container.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:get/get.dart';

import '../../../resources/consts/assets_strings.dart';

class VisitCompanyScreen extends StatefulWidget {
  const VisitCompanyScreen({super.key});

  @override
  State<VisitCompanyScreen> createState() => _VisitCompanyScreenState();
}

class _VisitCompanyScreenState extends State<VisitCompanyScreen> {
  @override
  Widget build(BuildContext context) {
    final VisitCompanyController visitCompanyController =
        Get.put<VisitCompanyController>(
      VisitCompanyController(),
    );
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Company name'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image
            const CircleAvatar(
              backgroundColor: AppColors.white,
              radius: 64,
              backgroundImage: AssetImage(
                AppAssets.profile1Asset,
              ),
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
            AddSpace().vertical(20),
            // products button
            CustomButton(
              onTap: visitCompanyController.productsTAP,
              child: const CustomText(
                text: 'Products',
                fontWeight: FontWeight.bold,
              ),
            ),
            AddSpace().vertical(20),
            // comminicate button
            CustomButton(
              onTap: visitCompanyController.comminicateTAP,
              child: const CustomText(
                text: 'Comminicate',
                fontWeight: FontWeight.bold,
              ),
            ),
            AddSpace().vertical(20),
            // about us button
            CustomButton(
              onTap: visitCompanyController.aboutUsTAP,
              child: const CustomText(
                text: 'About us',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
