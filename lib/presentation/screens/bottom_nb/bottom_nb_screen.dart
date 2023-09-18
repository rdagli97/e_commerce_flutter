import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/domain/controllers/screen_controller/bottom_nb_controller.dart';
import 'package:flutter_e_commerce_app/data/enums/bottom_navigation_bar_enum.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:get/get.dart';

class BottomNBScreen extends StatelessWidget {
  const BottomNBScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNBController bottomNBController =
        Get.put<BottomNBController>(BottomNBController());

    return Obx(() {
      return Scaffold(
        body: bottomNBController.pages[bottomNBController.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.black,
          selectedLabelStyle: const TextStyle(color: AppColors.primaryColor),
          currentIndex: bottomNBController.currentIndex,
          onTap: bottomNBController.onTap,
          items: [
            ...BottomNavigationBarEnum.values
                .map(
                  (BottomNavigationBarEnum e) => BottomNavigationBarItem(
                    icon: Icon(e.getIcons),
                    label: e.getTitle,
                  ),
                )
                .toList(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: bottomNBController.shopTap,
          child: const Icon(Icons.shopping_basket_rounded),
        ),
      );
    });
  }
}
