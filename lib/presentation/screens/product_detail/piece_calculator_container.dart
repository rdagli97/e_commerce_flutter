import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/calculate_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';

class PieceCalculatorContainer extends StatelessWidget {
  const PieceCalculatorContainer({
    super.key,
    required this.incrementTAP,
    required this.decrementTAP,
    required this.pieceText,
  });
  final Function()? incrementTAP;
  final Function()? decrementTAP;
  final String pieceText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // decrement button
          CalculateButton(
            onTap: decrementTAP,
            iconData: Icons.remove,
            borderColor: AppColors.white,
            bgColor: AppColors.white,
          ),
          AddSpace().horizontal(MediaQuery.of(context).size.width * 0.01),
          // value
          CustomText(text: pieceText),
          AddSpace().horizontal(MediaQuery.of(context).size.width * 0.01),
          // increment button
          CalculateButton(
            onTap: incrementTAP,
            iconData: Icons.add,
            borderColor: AppColors.white,
            bgColor: AppColors.white,
          ),
        ],
      ),
    );
  }
}
