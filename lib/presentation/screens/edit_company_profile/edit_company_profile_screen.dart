import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/user_controller.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_textformfield.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/unfocus_widget.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:provider/provider.dart';

class EditCompanyProfileScreen extends StatefulWidget {
  const EditCompanyProfileScreen({super.key});

  @override
  State<EditCompanyProfileScreen> createState() =>
      _EditCompanyProfileScreenState();
}

class _EditCompanyProfileScreenState extends State<EditCompanyProfileScreen> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _aboutUsController = TextEditingController();

  Future<void> _updateClick() async {
    await context.read<UserController>().updateUser(
          context: context,
          mounted: mounted,
          adress: _addressController.text,
          aboutUs: _aboutUsController.text,
        );
  }

  Future<void> initOps() async {
    final user = context.read<UserController>().user;
    _addressController.text = user?.adress ?? '';
    _phoneController.text = user?.phone ?? '';
    _aboutUsController.text = user?.aboutUs ?? '';
  }

  @override
  void initState() {
    initOps();
    super.initState();
  }

  @override
  void dispose() {
    _addressController.dispose();
    _phoneController.dispose();
    _aboutUsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userRead = context.read<UserController>().user;
    return unFocus(
      context: context,
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(text: '${userRead?.username}'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  controller: _addressController,
                  hintText: 'Address',
                  maxLines: 5,
                  maxLength: 255,
                ),
                AddSpace().vertical(MediaQuery.of(context).size.height * 0.02),
                CustomTextFormField(
                  controller: _phoneController,
                  hintText: 'Phone',
                ),
                AddSpace().vertical(MediaQuery.of(context).size.height * 0.04),
                CustomTextFormField(
                  controller: _aboutUsController,
                  hintText: 'About us',
                  maxLines: 18,
                  maxLength: 1000,
                ),
                AddSpace().vertical(MediaQuery.of(context).size.height * 0.02),
                CustomButton(
                  onTap: _updateClick,
                  color: AppColors.primaryColor,
                  child: const CustomText(
                    text: 'Update',
                    color: AppColors.white,
                  ),
                ),
                AddSpace().vertical(MediaQuery.of(context).size.height * 0.02),
                const Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    text: 'For change your password',
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
