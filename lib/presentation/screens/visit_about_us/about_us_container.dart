import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import '../../../resources/style/colors.dart';

class AboutUsContainer extends StatelessWidget {
  const AboutUsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: CustomText(
        text: 'About us' * 150,
        maxLines: 25,
      ),
    );
  }
}
