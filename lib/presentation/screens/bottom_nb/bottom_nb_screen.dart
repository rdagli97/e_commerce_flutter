import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/enums/bottom_navigation_bar_enum.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';

class BottomNBScreen extends StatelessWidget {
  const BottomNBScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SizedBox(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.black,
        selectedLabelStyle: const TextStyle(color: AppColors.primaryColor),
        currentIndex: 0,
        onTap: (value) {},
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
        onPressed: () {},
        child: const Icon(Icons.shopping_basket_rounded),
      ),
    );
  }
}
