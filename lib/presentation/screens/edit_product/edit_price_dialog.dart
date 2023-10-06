import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/models/product_model.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_textformfield.dart';
import 'package:flutter_e_commerce_app/presentation/screens/edit_product/new_price_calculator.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';

Future<dynamic> createChangePriceDialog({
  required BuildContext context,
  required ProductsModel productsModel,
  required CustomTextFormField customTextFormField,
  required Function()? calculateOnTap,
  required Function()? changePriceOnTap,
}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      contentPadding: const EdgeInsets.all(20),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                // textformfield
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: customTextFormField,
                ),
                const Spacer(),
                // calculate button
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.18,
                  child: CustomButton(
                    color: AppColors.primaryColor,
                    onTap: calculateOnTap,
                    child: const Icon(
                      Icons.calculate,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ],
            ),
            NewPriceCalculator(productsModel: productsModel),
            CustomButton(
              color: AppColors.primaryColor,
              onTap: changePriceOnTap,
              child: const CustomText(
                text: 'Update with new price',
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
