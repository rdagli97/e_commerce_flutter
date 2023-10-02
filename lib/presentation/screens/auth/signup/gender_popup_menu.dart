import 'package:flutter/material.dart';
import '../../../../resources/style/colors.dart';
import '../../../global components/custom_text.dart';

class GenderPopupMenu extends StatelessWidget {
  const GenderPopupMenu({
    super.key,
    required this.genderText,
    required this.onSelected,
  });
  final String genderText;
  final Function(String)? onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppColors.primaryColor,
          width: 1,
        ),
      ),
      itemBuilder: (context) => [
        // male
        const PopupMenuItem(
          value: 'male',
          child: CustomText(text: 'Male'),
        ),
        // female
        const PopupMenuItem(
          value: 'female',
          child: CustomText(text: 'Female'),
        ),
      ],
      onSelected: onSelected,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.primaryColor,
            width: 1,
          ),
        ),
        child: CustomText(text: genderText),
      ),
    );
  }
}
