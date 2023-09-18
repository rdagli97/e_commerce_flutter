import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/domain/controllers/screen_controller/visit_customer_controller.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:get/get.dart';

import '../../../resources/consts/assets_strings.dart';

class VisitCustomerScreen extends StatefulWidget {
  const VisitCustomerScreen({super.key});

  @override
  State<VisitCustomerScreen> createState() => _VisitCustomerScreenState();
}

class _VisitCustomerScreenState extends State<VisitCustomerScreen> {
  @override
  Widget build(BuildContext context) {
    final VisitCustomerController visitCustomerController =
        Get.put<VisitCustomerController>(
      VisitCustomerController(),
    );
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Username'),
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
                AppAssets.profile5Asset,
              ),
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
              text: 'useremail@gmail.com',
            ),
            AddSpace().vertical(5),
            // Phone
            const CustomText(
              text: '+(90) 05xx 555 5555',
            ),
            AddSpace().vertical(20),
            // my orders button
            CustomButton(
              onTap: visitCustomerController.ordersTAP,
              child: const CustomText(
                text: 'Orders',
                fontWeight: FontWeight.bold,
              ),
            ),
            AddSpace().vertical(20),
            // my comments button
            CustomButton(
              onTap: visitCustomerController.commentsTAP,
              child: const CustomText(
                text: 'Comments',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
