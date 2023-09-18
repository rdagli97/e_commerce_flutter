import 'package:flutter/material.dart';

import 'package:flutter_e_commerce_app/domain/controllers/screen_controller/edit_customer_controller.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_textformfield.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:get/get.dart';

import '../../global components/custom_button.dart';
import '../../../resources/style/colors.dart';

class EditAboutUsScreen extends StatelessWidget {
  const EditAboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EditCustomerController editCustomercontroller =
        Get.put<EditCustomerController>(EditCustomerController());
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'About us'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormField(
                controller: editCustomercontroller.adressController,
                hintText: '',
                maxLines: 18,
                maxLength: 1000,
              ),
              AddSpace().vertical(Get.height * 0.02),
              // update button
              CustomButton(
                onTap: () {},
                color: AppColors.primaryColor,
                child: const CustomText(
                  text: 'Update',
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
