import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/product_controller.dart';
import 'package:flutter_e_commerce_app/data/controllers/user_controller.dart';
import 'package:flutter_e_commerce_app/data/models/product_model.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_products_tile.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/screens/edit_product/edit_price_dialog.dart';
import 'package:flutter_e_commerce_app/presentation/screens/give_discount/give_discount_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/product_detail/product_detail_screen.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:flutter_e_commerce_app/resources/utils/handle_error.dart';
import 'package:flutter_e_commerce_app/resources/utils/navigate_skills.dart';
import 'package:provider/provider.dart';

import '../../../data/controllers/discount_controller.dart';
import '../../global components/custom_textformfield.dart';

class MyProductsScreen extends StatefulWidget {
  const MyProductsScreen({super.key});

  @override
  State<MyProductsScreen> createState() => _MyProductsScreenState();
}

class _MyProductsScreenState extends State<MyProductsScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController newPriceController = TextEditingController();

  Future<void> deleteProduct(int productId) async {
    await context.read<ProductController>().deleteProduct(
        context: context, mounted: mounted, productId: productId);
    if (!mounted) return;
    await context
        .read<UserController>()
        .getCurrentUserDetails(context: context, mounted: mounted);
  }

  @override
  void dispose() {
    newPriceController.dispose();
    super.dispose();
  }

  bool showActiveProducts = true;
  @override
  Widget build(BuildContext context) {
    final userRead = context.read<UserController>().user;
    final userWatch = context.watch<UserController>();
    final productRead = context.read<ProductController>();
    final productWatch = context.watch<ProductController>();
    final discountRead = context.read<DiscountController>();
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'My Products'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Form(
            key: formKey,
            child: productWatch.isLoading && userWatch.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: PopupMenuButton(
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Row(
                            children: [
                              CustomText(
                                text: 'Online products',
                                fontWeight: FontWeight.bold,
                              ),
                              Icon(Icons.arrow_drop_down_rounded),
                            ],
                          ),
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 'online',
                              child: CustomText(
                                text: 'Online products',
                              ),
                            ),
                            const PopupMenuItem(
                              value: 'inactive',
                              child: CustomText(
                                text: 'Inactive products',
                              ),
                            ),
                          ],
                          onSelected: (value) {
                            if (value == 'inactive') {
                              setState(() {
                                showActiveProducts = false;
                              });
                            } else {
                              setState(() {
                                showActiveProducts = true;
                              });
                            }
                          },
                        ),
                      ),
                      AddSpace()
                          .vertical(MediaQuery.of(context).size.height * 0.05),
                      showActiveProducts
                          ? Expanded(
                              child: ListView.builder(
                                itemCount: userRead?.products?.length,
                                itemBuilder: (context, index) {
                                  final ProductsModel? product =
                                      userRead?.products![index];
                                  return CustomProductTile(
                                    title: '${product?.title}',
                                    description: '${product?.description}',
                                    price: product?.price ?? 0,
                                    imageUrl: product?.image ?? '',
                                    onTap: () {
                                      // go product detail
                                      NavigateSkills().pushTo(
                                        context,
                                        ProductDetailScreen(
                                          productsModel: product,
                                        ),
                                      );
                                    },
                                    onSelected: (value) {
                                      if (value == 'change price') {
                                        discountRead.resetChangePrice();
                                        // open change price
                                        createChangePriceDialog(
                                          context: context,
                                          calculateOnTap: () {
                                            discountRead.changingPrice(
                                                newPriceController);
                                            newPriceController.clear();
                                          },
                                          changePriceOnTap: () {
                                            // change price with discountRead.changePrice
                                            if (discountRead.changePrice != 0 ||
                                                newPriceController
                                                    .text.isNotEmpty) {
                                              productRead.changePrice(
                                                context: context,
                                                mounted: mounted,
                                                productId: product?.id ?? 0,
                                                price: newPriceController
                                                        .text.isNotEmpty
                                                    ? double.parse(
                                                        newPriceController.text)
                                                    : discountRead.changePrice,
                                              );
                                            } else {
                                              HandleError().showErrorMessage(
                                                  context,
                                                  'Set a new value please');
                                            }
                                          },
                                          productsModel:
                                              product ?? ProductsModel(),
                                          customTextFormField:
                                              CustomTextFormField(
                                            suffixIconData: Icons.euro,
                                            controller: newPriceController,
                                            hintText: 'New price',
                                            validator: (val) => val!.isEmpty
                                                ? 'Please enter a price'
                                                : null,
                                          ),
                                        );
                                      } else if (value == 'give discount') {
                                        // go give discount page
                                        NavigateSkills().pushTo(
                                          context,
                                          GiveDiscountScreen(
                                              productsModel:
                                                  product ?? ProductsModel()),
                                        );
                                      } else if (value == 'cancel discount') {
                                        // cancel discount
                                        if (product?.discount != 0 &&
                                            product?.oldPrice != 0) {
                                          productRead.giveDiscount(
                                            context: context,
                                            mounted: mounted,
                                            productId: product?.id ?? 0,
                                            discountValue: 0,
                                            price: product?.oldPrice ?? 0,
                                          );
                                        } else {
                                          HandleError().showErrorMessage(
                                              context, 'There is no discount');
                                        }
                                      } else {
                                        // delete
                                        deleteProduct(product?.id ?? 0);
                                      }
                                    },
                                  );
                                },
                              ),
                            )
                          : Expanded(
                              child: ListView(
                                children: [
                                  CustomProductTile(
                                    statusColor: AppColors.grey,
                                    statusText: '• Inactive',
                                    onSelected: (value) {},
                                    title: '',
                                    description: '',
                                    price: 1,
                                    imageUrl: '',
                                    onTap: () {},
                                  ),
                                  CustomProductTile(
                                    statusColor: AppColors.grey,
                                    statusText: '• Inactive',
                                    onSelected: (value) {},
                                    title: '',
                                    description: '',
                                    price: 1,
                                    imageUrl: '',
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ),
                    ],
                  )),
      ),
    );
  }
}
