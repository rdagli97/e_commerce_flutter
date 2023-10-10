import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/product_controller.dart';
import 'package:flutter_e_commerce_app/data/models/product_model.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_list_tile.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/screens/product_detail/product_detail_screen.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/style/font_sizes.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:flutter_e_commerce_app/resources/utils/navigate_skills.dart';
import 'package:provider/provider.dart';
import '../../../data/controllers/user_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userRead = context.read<UserController>().user;
    final productRead = context.read<ProductController>();
    final productWatch = context.watch<ProductController>();
    return Scaffold(
      body: productWatch.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // welcome back! text
                            const CustomText(
                              text: 'Welcome back!',
                              fontSize: AppFontSizes.shopTitle12,
                            ),
                            // username text
                            CustomText(
                              text: '${userRead?.username}',
                              fontSize: AppFontSizes.description14,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        const Spacer(),
                        // pp image
                        CircleAvatar(
                          backgroundColor: AppColors.white,
                          backgroundImage: AssetImage('${userRead?.image}'),
                        )
                      ],
                    ),
                    AddSpace().vertical(50),
                    Row(
                      children: [
                        // Whats hot now
                        const CustomText(
                          text: 'Whats hot now',
                          fontSize: AppFontSizes.subTitle16,
                          fontWeight: FontWeight.bold,
                        ),
                        const Spacer(),
                        // view all text button
                        TextButton(
                          onPressed: () {},
                          child: const CustomText(
                            text: 'View all',
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    // List view hots
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productRead.hotestProducts.length,
                        itemBuilder: (context, index) {
                          final ProductsModel product =
                              productRead.hotestProducts[index];
                          return CustomListTile(
                            image: product.image ?? '',
                            price: product.price ?? 999999,
                            rating: product.rate ?? 0,
                            title: product.title ?? '',
                            onTap: () {
                              NavigateSkills().pushTo(
                                context,
                                ProductDetailScreen(
                                  productsModel: product,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        // Explore
                        const CustomText(
                          text: 'On sale now',
                          fontSize: AppFontSizes.subTitle16,
                          fontWeight: FontWeight.bold,
                        ),
                        const Spacer(),
                        // view all text button
                        TextButton(
                          onPressed: () {},
                          child: const CustomText(
                            text: 'View all',
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    // List view every open app random 10 product
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productRead.discountedProducts.length,
                        itemBuilder: (context, index) {
                          final ProductsModel product =
                              productRead.discountedProducts[index];
                          return CustomListTile(
                            title: product.title ?? '',
                            image: product.image ?? '',
                            price: product.price ?? 99999,
                            rating: product.rate ?? 0,
                            discounted: true,
                            discountValue: product.discount,
                            oldPrice: product.oldPrice,
                            onTap: () {
                              NavigateSkills().pushTo(
                                context,
                                ProductDetailScreen(
                                  productsModel: product,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        // Explore new products
                        const CustomText(
                          text: 'Explore new products',
                          fontSize: AppFontSizes.subTitle16,
                          fontWeight: FontWeight.bold,
                        ),
                        const Spacer(),
                        // view all text button
                        TextButton(
                          onPressed: () {},
                          child: const CustomText(
                            text: 'View all',
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    // list view of newest products
                    SizedBox(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productRead.productList.length,
                        itemBuilder: (context, index) {
                          final ProductsModel product =
                              productRead.productList[index];
                          return CustomListTile(
                            image: product.image ?? '',
                            price: product.price ?? 99999,
                            rating: product.rate ?? 0,
                            title: product.title ?? '',
                            onTap: () {
                              NavigateSkills().pushTo(
                                context,
                                ProductDetailScreen(
                                  productsModel: product,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
