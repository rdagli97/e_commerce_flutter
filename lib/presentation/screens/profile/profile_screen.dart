import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/user_controller.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_icon_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_star_container.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/screens/edit_company_profile/edit_company_profile_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/my_comments/my_comments_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/my_orders/my_orders_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/my_products/my_products_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/my_sales/my_sales_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/profile/sale_count_container.dart';
import 'package:flutter_e_commerce_app/presentation/screens/visit_company/visit_company_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/visit_customer/visit_customer_screen.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:flutter_e_commerce_app/resources/utils/navigate_skills.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> _logoutClick() async {
    await context.read<UserController>().logoutAndGoIntroScreen(context);
  }

  void _eyeViewClick() {
    if (context.read<UserController>().user?.role == 1) {
      NavigateSkills().pushTo(
        context,
        const VisitCompanyScreen(),
      );
    } else {
      NavigateSkills().pushTo(
        context,
        const VisitCustomerScreen(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userRead = context.read<UserController>().user;
    return Scaffold(
        body: userRead?.role == 0
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image
                      CircleAvatar(
                        backgroundColor: AppColors.white,
                        radius: 64,
                        backgroundImage: AssetImage('${userRead?.image}'),
                      ),
                      AddSpace().vertical(20),
                      // username
                      CustomText(
                        text: '${userRead?.username}',
                        fontWeight: FontWeight.bold,
                      ),
                      AddSpace().vertical(5),
                      // email
                      CustomText(
                        text: '${userRead?.email}',
                      ),
                      AddSpace().vertical(5),
                      // Phone
                      CustomText(
                        text: '${userRead?.phone}',
                      ),
                      AddSpace().vertical(10),
                      // eye view
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomIconButton(
                          iconData: Icons.remove_red_eye,
                          iconColor: AppColors.blue,
                          onTap: _eyeViewClick,
                        ),
                      ),
                      AddSpace().vertical(10),
                      // my orders button
                      CustomButton(
                        onTap: () {
                          NavigateSkills().pushTo(
                            context,
                            const MyOrdersScreen(),
                          );
                        },
                        child: const CustomText(
                          text: 'My orders',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AddSpace().vertical(20),
                      // my comments button
                      CustomButton(
                        onTap: () {
                          NavigateSkills().pushTo(
                            context,
                            const MyCommentsScreen(),
                          );
                        },
                        child: const CustomText(
                          text: 'My comments',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AddSpace().vertical(20),
                      // log out button
                      CustomButton(
                        onTap: _logoutClick,
                        child: const CustomText(
                          text: 'Log out',
                          color: AppColors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AddSpace().vertical(20),
                    ],
                  ),
                ),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image
                      CircleAvatar(
                        backgroundColor: AppColors.white,
                        radius: 54,
                        backgroundImage: AssetImage('${userRead?.image}'),
                      ),
                      AddSpace().vertical(10),
                      // rating
                      const CustomStarContainer(
                        rate: 4.9,
                      ),
                      AddSpace().vertical(10),
                      // username
                      CustomText(
                        text: '${userRead?.username}',
                        fontWeight: FontWeight.bold,
                      ),
                      AddSpace().vertical(5),
                      // email
                      CustomText(
                        text: '${userRead?.email}',
                      ),
                      AddSpace().vertical(5),
                      // phone number
                      CustomText(
                        text: '${userRead?.phone}',
                      ),
                      AddSpace().vertical(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Saled product count
                          SaleCountContainer(
                              text: '${userRead?.saledProductCount}'),
                          // Eye view
                          CustomIconButton(
                            iconData: Icons.remove_red_eye,
                            iconColor: AppColors.blue,
                            onTap: _eyeViewClick,
                          ),
                        ],
                      ),
                      AddSpace()
                          .vertical(MediaQuery.of(context).size.height * 0.05),
                      // my products button
                      CustomButton(
                        onTap: () {
                          NavigateSkills().pushTo(
                            context,
                            const MyProductsScreen(),
                          );
                        },
                        child: const CustomText(
                          text: 'My products',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AddSpace().vertical(20),
                      // my sales button
                      CustomButton(
                        onTap: () {
                          NavigateSkills().pushTo(
                            context,
                            const MySalesScreen(),
                          );
                        },
                        child: const CustomText(
                          text: 'My sales',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AddSpace().vertical(20),
                      // Edit profile button
                      CustomButton(
                        onTap: () {
                          NavigateSkills().pushTo(
                            context,
                            const EditCompanyProfileScreen(),
                          );
                        },
                        child: const CustomText(
                          text: 'Edit profile',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AddSpace().vertical(20),
                      // log out button
                      CustomButton(
                        onTap: _logoutClick,
                        child: const CustomText(
                          text: 'Log out',
                          color: AppColors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AddSpace().vertical(20),
                    ],
                  ),
                ),
              ));
  }
}
