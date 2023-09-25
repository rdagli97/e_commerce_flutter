import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/enums/bottom_navigation_bar_enum.dart';
import 'package:flutter_e_commerce_app/presentation/screens/favorite/favorite_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/home/home_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/profile/profile_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/search/search_screen.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';

class BottomNBScreen extends StatefulWidget {
  const BottomNBScreen({super.key});

  @override
  State<BottomNBScreen> createState() => _BottomNBScreenState();
}

class _BottomNBScreenState extends State<BottomNBScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.black,
        selectedLabelStyle: const TextStyle(color: AppColors.primaryColor),
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
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
