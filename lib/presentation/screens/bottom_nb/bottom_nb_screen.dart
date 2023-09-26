import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/user_controller.dart';
import 'package:flutter_e_commerce_app/data/enums/bottom_navigation_bar_enum.dart';
import 'package:flutter_e_commerce_app/data/models/user_model.dart';
import 'package:flutter_e_commerce_app/presentation/screens/favorite/favorite_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/home/home_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/profile/profile_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/search/search_screen.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:provider/provider.dart';

class BottomNBScreen extends StatefulWidget {
  const BottomNBScreen({super.key});

  @override
  State<BottomNBScreen> createState() => _BottomNBScreenState();
}

class _BottomNBScreenState extends State<BottomNBScreen> {
  UserModel? user;
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
  ];

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
      floatingActionButton: user?.role == 0
          ? FloatingActionButton(
              onPressed: () {
                // go to shopping page
              },
              child: const Icon(Icons.shopping_basket_rounded),
            )
          : FloatingActionButton(
              onPressed: () {
                // go to add new product
              },
              child: const Icon(Icons.add),
            ),
    );
  }
}
