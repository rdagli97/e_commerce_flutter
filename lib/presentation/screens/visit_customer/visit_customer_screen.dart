import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/user_controller.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_button.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/screens/comments_visit/comments_visit_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/orders_visit/orders_visit_screen.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:flutter_e_commerce_app/resources/utils/navigate_skills.dart';
import 'package:provider/provider.dart';

class VisitCustomerScreen extends StatefulWidget {
  const VisitCustomerScreen({super.key});

  @override
  State<VisitCustomerScreen> createState() => _VisitCustomerScreenState();
}

class _VisitCustomerScreenState extends State<VisitCustomerScreen> {
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
            AddSpace().vertical(20),
            // my orders button
            CustomButton(
              onTap: () {
                NavigateSkills().pushTo(
                  context,
                  const OrdersVisitScreen(),
                );
              },
              child: const CustomText(
                text: 'Orders',
                fontWeight: FontWeight.bold,
              ),
            ),
            AddSpace().vertical(20),
            // my comments button
            CustomButton(
              onTap: () {
                NavigateSkills().pushTo(
                  context,
                  const CommentsVisitScreen(),
                );
              },
              child: const CustomText(
                text: 'Comments',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
