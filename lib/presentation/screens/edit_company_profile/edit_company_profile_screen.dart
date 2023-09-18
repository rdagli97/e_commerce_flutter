import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/domain/controllers/screen_controller/edit_customer_controller.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_textformfield.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:get/get.dart';

class EditCompanyProfileScreen extends StatelessWidget {
  const EditCompanyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EditCustomerController editCustomercontroller =
        Get.put<EditCustomerController>(EditCustomerController());
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Company name'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                controller: editCustomercontroller.adressController,
                hintText: 'Adress',
                maxLines: 5,
                maxLength: 300,
              ),
              AddSpace().vertical(Get.height * 0.02),
              CustomTextFormField(
                controller: editCustomercontroller.phoneController,
                hintText: 'Phone (e.g:05xx 555 5555)',
              ),
              AddSpace().vertical(Get.height * 0.04),
              const CustomText(
                text: 'For change your password',
                fontStyle: FontStyle.italic,
              ),
              AddSpace().vertical(Get.height * 0.02),
              CustomTextFormField(
                controller: editCustomercontroller.oldPasswordController,
                hintText: 'Old password',
              ),
              AddSpace().vertical(Get.height * 0.02),
              CustomTextFormField(
                controller: editCustomercontroller.newPasswordController,
                hintText: 'New password',
              ),
              AddSpace().vertical(Get.height * 0.02),
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
