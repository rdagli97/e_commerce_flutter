import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_list_tile.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/consts/assets_strings.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/style/font_sizes.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // welcome back! text
                      CustomText(
                        text: 'Welcome back!',
                        fontSize: AppFontSizes.shopTitle12,
                      ),
                      // username text
                      CustomText(
                        text: 'rdagli97',
                        fontSize: AppFontSizes.description14,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  Spacer(),
                  // pp image
                  CircleAvatar(
                    backgroundImage: AssetImage(AppAssets.profile4Asset),
                  ),
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
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CustomListTile(),
                    CustomListTile(),
                    CustomListTile(),
                    CustomListTile(),
                    CustomListTile(),
                    CustomListTile(),
                  ],
                ),
              ),
              Row(
                children: [
                  // Explore
                  const CustomText(
                    text: 'Explore',
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
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CustomListTile(),
                    CustomListTile(),
                    CustomListTile(),
                    CustomListTile(),
                    CustomListTile(),
                    CustomListTile(),
                  ],
                ),
              ),
              Row(
                children: [
                  // On sale
                  const CustomText(
                    text: 'On Sale now',
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
              // list view of on sales products
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    CustomListTile(),
                    CustomListTile(),
                    CustomListTile(),
                    CustomListTile(),
                    CustomListTile(),
                    CustomListTile(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
