import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/product_controller.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_textformfield.dart';
import 'package:flutter_e_commerce_app/presentation/screens/create_new_product/alert_dialog.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:flutter_e_commerce_app/resources/utils/handle_error.dart';
import 'package:provider/provider.dart';

class CreateNewProductScreen extends StatefulWidget {
  const CreateNewProductScreen({super.key});

  @override
  State<CreateNewProductScreen> createState() => _CreateNewProductScreenState();
}

class _CreateNewProductScreenState extends State<CreateNewProductScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String category = '';
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
          category: category,
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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                AddSpace().vertical(MediaQuery.of(context).size.height * 0.02),
                // Title textfield
                CustomTextFormField(
                  controller: _titleController,
                  hintText: 'Title',
                  validator: (val) => val!.isEmpty ? 'Title required' : null,
                ),
                AddSpace().vertical(MediaQuery.of(context).size.height * 0.03),
                // Description textfield
                CustomTextFormField(
                  controller: _descriptionController,
                  hintText: 'Description',
                  maxLines: 5,
                  validator: (val) =>
                      val!.isEmpty ? 'Descriptipn required' : null,
                ),
                AddSpace().vertical(MediaQuery.of(context).size.height * 0.03),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: PopupMenuButton(
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Row(
                            children: [
                              CustomText(
                                text: 'Select category',
                              ),
                              Icon(Icons.arrow_drop_down_rounded)
                            ],
                          ),
                        ),
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'man',
                            child: CustomText(
                              text: 'Man',
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'woman',
                            child: CustomText(
                              text: 'Woman',
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'shoes',
                            child: CustomText(
                              text: 'Shoes',
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'computers',
                            child: CustomText(
                              text: 'Computers',
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'phones',
                            child: CustomText(
                              text: 'Phones',
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'watches',
                            child: CustomText(
                              text: 'Watches',
                            ),
                          ),
                        ],
                        onSelected: (value) {
                          switch (value) {
                            case 'man':
                              setState(() {
                                category = 'Man';
                              });
                              break;
                            case 'woman':
                              setState(() {
                                category = 'Woman';
                              });
                              break;
                            case 'shoes':
                              setState(() {
                                category = 'Shoes';
                              });
                              break;
                            case 'computers':
                              setState(() {
                                category = 'Computers';
                              });
                              break;
                            case 'phones':
                              setState(() {
                                category = 'Phones';
                              });
                              break;
                            case 'watches':
                              setState(() {
                                category = 'Watches';
                              });
                              break;
                            default:
                              category = '';
                              break;
                          }
                        },
                      ),
                    ),
                    AddSpace().horizontal(5),
                    Row(
                      children: [
                        const CustomText(text: 'Category :'),
                        AddSpace().horizontal(3),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: AppColors.primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CustomText(
                            text: category,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                AddSpace().vertical(MediaQuery.of(context).size.height * 0.03),
                // Price textfield
                CustomTextFormField(
                  controller: _priceController,
                  hintText: 'Price',
                  keyboardType: TextInputType.number,
                  suffixIconData: Icons.euro,
                  validator: (val) => val!.isEmpty ? 'Price required' : null,
                ),
                AddSpace().vertical(MediaQuery.of(context).size.height * 0.03),
                // Publish the product
                CustomButton(
                  color: AppColors.primaryColor,
                  onTap: () async {
                    if (formKey.currentState!.validate() && category != '') {
                      // create new product
                      await createProduct();
                      if (!mounted) return;
                      createNewProductDialog(context);
                    } else if (category == '') {
                      HandleError()
                          .showErrorMessage(context, 'Category not selected');
                    }
                  },
                  child: const CustomText(
                    text: 'Continue',
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
