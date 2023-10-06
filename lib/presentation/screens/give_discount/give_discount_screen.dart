import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/discount_controller.dart';
import 'package:flutter_e_commerce_app/data/controllers/product_controller.dart';
import 'package:flutter_e_commerce_app/data/models/product_model.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_textformfield.dart';
import 'package:flutter_e_commerce_app/presentation/screens/give_discount/discount_calculator.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:flutter_e_commerce_app/resources/utils/handle_error.dart';
import 'package:provider/provider.dart';

class GiveDiscountScreen extends StatefulWidget {
  const GiveDiscountScreen({super.key, required this.productsModel});
  final ProductsModel productsModel;

  @override
  State<GiveDiscountScreen> createState() => _GiveDiscountScreenState();
}

class _GiveDiscountScreenState extends State<GiveDiscountScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _discountController = TextEditingController();

  @override
  void dispose() {
    _discountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final discountRead = context.read<DiscountController>();
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Discount'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // discount textfield
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: CustomTextFormField(
                      borderEnabled: false,
                      controller: _discountController,
                      hintText: 'Discount value',
                      suffixIconData: Icons.percent,
                      validator: (val) =>
                          val!.isEmpty ? 'Please enter a discount value' : null,
                    ),
                  ),
                  // calculate button
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: CustomButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          discountRead.changeDiscountValue(_discountController);
                          discountRead.calculateNewPrice(
                              widget.productsModel.price ?? 0);
                          _discountController.clear();
                        }
                      },
                      color: AppColors.primaryColor,
                      child: const Icon(
                        Icons.calculate,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
              AddSpace().vertical(10),
              // calculator
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: DiscountCalculator(productsModel: widget.productsModel),
              ),
              AddSpace().vertical(10),
              // update with this price button
              CustomButton(
                color: AppColors.primaryColor,
                onTap: () {
                  // give discount to product
                  if (discountRead.discountValue != 0 &&
                      widget.productsModel.price != 0) {
                    context.read<ProductController>().giveDiscount(
                          context: context,
                          mounted: mounted,
                          productId: widget.productsModel.id ?? 0,
                          discountValue: discountRead.discountValue,
                          price: discountRead.newPrice,
                        );
                  } else {
                    HandleError().showErrorMessage(
                        context, 'Price or Discount can not be less then 0');
                  }
                },
                child: const CustomText(
                  text: 'Update with this price',
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
