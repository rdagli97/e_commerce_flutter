import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/user_controller.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_star_container.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/screens/products_visit/products_visit_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/visit_about_us/visit_about_us_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/visit_comminicate/visit_comminicate_screen.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:flutter_e_commerce_app/resources/utils/navigate_skills.dart';
import 'package:provider/provider.dart';

class VisitCompanyScreen extends StatefulWidget {
  const VisitCompanyScreen({super.key});

  @override
  State<VisitCompanyScreen> createState() => _VisitCompanyScreenState();
}

class _VisitCompanyScreenState extends State<VisitCompanyScreen> {
  @override
  Widget build(BuildContext context) {
    final userRead = context.read<UserController>().user;
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: '${userRead?.username}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image
            CircleAvatar(
              backgroundColor: AppColors.white,
              radius: 64,
              backgroundImage: AssetImage(
                '${userRead?.image}',
              ),
            ),
            AddSpace().vertical(10),
            // rating
            const CustomStarContainer(),
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
            AddSpace().vertical(20),
            // products button
            CustomButton(
              onTap: () {
                NavigateSkills().pushTo(
                  context,
                  const ProductsVisitScreen(),
                );
              },
              child: const CustomText(
                text: 'Products',
                fontWeight: FontWeight.bold,
              ),
            ),
            AddSpace().vertical(20),
            // comminicate button
            CustomButton(
              onTap: () {
                NavigateSkills().pushTo(
                  context,
                  const VisitComminicateScreen(),
                );
              },
              child: const CustomText(
                text: 'Comminicate',
                fontWeight: FontWeight.bold,
              ),
            ),
            AddSpace().vertical(20),
            // about us button
            CustomButton(
              onTap: () {
                NavigateSkills().pushTo(
                  context,
                  const VisitAboutUsScreen(),
                );
              },
              child: const CustomText(
                text: 'About us',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
