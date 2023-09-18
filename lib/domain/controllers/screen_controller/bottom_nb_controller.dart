import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/domain/router/route.dart';
import 'package:get/get.dart';

import '../../../presentation/screens/favorite/favorite_screen.dart';
import '../../../presentation/screens/home/home_screen.dart';
import '../../../presentation/screens/profile/profile_screen.dart';
import '../../../presentation/screens/search/search_screen.dart';

class BottomNBController extends GetxController {
  final RxInt _currentIndex = RxInt(0);
  int get currentIndex => _currentIndex.value;

  final RxList<Widget> _pages = RxList.empty();
  List<Widget> get pages => _pages;

  @override
  void onInit() {
    getPages();
    super.onInit();
  }

  void getPages() {
    _pages.value = [
      const HomeScreen(),
      const SearchScreen(),
      const FavoritesScreen(),
      const ProfileScreen(),
    ];
    _pages.refresh();
    update();
  }

  void shopTap() {
    Get.toNamed(AppRouter.createNewProduct);
  }

  void onTap(int value) {
    _currentIndex.value = value;
    update();
  }
}
