import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/add_space.dart';
import 'package:flutter_e_commerce_app/presentation/screens/visit_comminicate/comminicate_container.dart';
import 'package:get/get.dart';

class VisitComminicateScreen extends StatelessWidget {
  const VisitComminicateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Comminicate'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ComminicateContainer(
                iconData: Icons.phone, desc: '+90 5xx 555 5555'),
            AddSpace().vertical(Get.height * 0.02),
            const ComminicateContainer(
                iconData: Icons.email, desc: 'workemail@gmail.com'),
            AddSpace().vertical(Get.height * 0.02),
            ComminicateContainer(
              iconData: Icons.location_on,
              desc: 'LOCATION / CITY / STATE' * 20,
            ),
          ],
        ),
      ),
    );
  }
}
