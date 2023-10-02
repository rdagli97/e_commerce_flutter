import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/product_controller.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_textformfield.dart';
import 'package:flutter_e_commerce_app/presentation/screens/create_new_product/alert_dialog.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:provider/provider.dart';

class CreateNewProductScreen extends StatefulWidget {
  const CreateNewProductScreen({super.key});

  @override
  State<CreateNewProductScreen> createState() => _CreateNewProductScreenState();
}

class _CreateNewProductScreenState extends State<CreateNewProductScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  Future<void> createProduct() async {
    await context.read<ProductController>().createProduct(
          context: context,
          mounted: mounted,
          title: _titleController.text,
          description: _descriptionController.text,
          price: double.parse(_priceController.text),
          category: "Man",
        );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Create new product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AddSpace().vertical(MediaQuery.of(context).size.height * 0.02),
              // Title textfield
              CustomTextFormField(
                controller: _titleController,
                hintText: 'Title',
              ),
              AddSpace().vertical(MediaQuery.of(context).size.height * 0.03),
              // Description textfield
              CustomTextFormField(
                controller: _descriptionController,
                hintText: 'Description',
                maxLines: 5,
              ),
              AddSpace().vertical(MediaQuery.of(context).size.height * 0.03),
              // Price textfield
              CustomTextFormField(
                controller: _priceController,
                hintText: 'Price',
                keyboardType: TextInputType.number,
                suffixIconData: Icons.euro,
              ),
              AddSpace().vertical(MediaQuery.of(context).size.height * 0.03),
              // Publish the product
              CustomButton(
                color: AppColors.primaryColor,
                onTap: () async {
                  // create new product
                  await createProduct();
                  if (!mounted) return;
                  createNewProductDialog(context);
                },
                child: const CustomText(
                  text: 'Continue',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
