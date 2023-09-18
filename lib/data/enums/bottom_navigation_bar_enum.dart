import 'package:flutter/material.dart';

enum BottomNavigationBarEnum {
  home,
  search,
  favorite,
  profile,
}

extension BottomNavigationBarEnumExtension on BottomNavigationBarEnum {
  IconData get getIcons {
    switch (this) {
      case BottomNavigationBarEnum.home:
        return Icons.home_outlined;
      case BottomNavigationBarEnum.search:
        return Icons.search;
      case BottomNavigationBarEnum.favorite:
        return Icons.favorite_border;
      case BottomNavigationBarEnum.profile:
        return Icons.person_3_outlined;
    }
  }

  String get getTitle {
    switch (this) {
      case BottomNavigationBarEnum.home:
        return 'Home';
      case BottomNavigationBarEnum.search:
        return 'Search';
      case BottomNavigationBarEnum.favorite:
        return 'Favourite';
      case BottomNavigationBarEnum.profile:
        return 'Profile';
    }
  }
}
