import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/models/user_model.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_list_tile.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/consts/assets_strings.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/style/font_sizes.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:provider/provider.dart';

import '../../../data/controllers/user_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserModel? user;

  Future<void> initUser() async {
    user = context.read<UserController>().user;
  }

  @override
  void initState() {
    initUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                        text: '${user?.username}',
                        fontSize: AppFontSizes.description14,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const Spacer(),
                  // pp image
                  user?.image == ''
                      ? const CircleAvatar(
                          backgroundImage: AssetImage(AppAssets.profile4Asset),
                        )
                      : CircleAvatar(
                          backgroundImage: NetworkImage('${user?.image}'),
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
