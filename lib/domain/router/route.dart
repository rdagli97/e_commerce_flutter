import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/screens/bottom_nb/bottom_nb_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/card_screen/card_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/comments_visit/comments_visit_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/auth_intro/company_intro_screen/company_intro_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/auth/company_login_screen/company_login_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/auth/company_register_screen/company_register_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/create_new_product/create_new_product_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/auth_intro/default_intro_screen/default_intro_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/edit_about_us/edit_about_us_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/edit_company_profile/edit_company_profile_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/edit_customer_profile/edit_customer_profile_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/favorite/favorite_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/home/home_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/auth_intro/intro_screen/intro_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/auth/login_screen.dart/login_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/my_comments/my_comments_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/my_orders/my_orders_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/my_products/my_products_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/my_sales/my_sales_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/orders_visit/orders_visit_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/product_detail/product_detail_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/products_visit/products_visit_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/profile/profile_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/search/search_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/auth/signup/signup_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/visit_about_us/visit_about_us_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/visit_comminicate/visit_comminicate_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/visit_company/visit_company_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/visit_customer/visit_customer_screen.dart';
import 'package:get/get.dart';

class AppRouter {
  AppRouter._();

  static GetPage<dynamic> notFound =
      GetPage(name: notFoundRoute, page: () => Container());
  static String get initialRoute => '/initial';
  static String get notFoundRoute => '/not_fount';
  static String get introRoute => '/intro';
  static String get loginRoute => '/login';
  static String get signupRoute => '/signup';
  static String get companyIntroRoute => '/company_intro';
  static String get companyLoginRoute => '/company_login';
  static String get companyRegisterRoute => '/company_register';
  static String get homeScreen => '/home_screen';
  static String get bottomNBScreen => '/bottom_nb_screen';
  static String get searchScreen => '/search_screen';
  static String get favoriteScreen => '/favorite_screen';
  static String get profileScreen => '/profile_screen';
  static String get myOrdersScreen => '/my_orders_screen';
  static String get myCommentsScreen => '/my_comments_screen';
  static String get editCustomerProfileScreen =>
      '/edit_customer_profile_screen';
  static String get myProductsScreen => '/my_products_screen';
  static String get mySalesScreen => '/my_sales_screen';
  static String get editCompanyProfileScreen => '/edit_company_profile_screen';
  static String get editCompanyAboutUs => '/edit_company_aboutus_screen';
  static String get cardSecreen => '/card_screen';
  static String get customerVisit => '/customer_visit_screen';
  static String get companyVisit => '/company_visit_screen';
  static String get ordersVisit => '/orders_visit';
  static String get commentsVisit => '/comments_visit';
  static String get productsVisit => '/products_visit';
  static String get aboutUsVisit => '/about_us_visit';
  static String get comminicateVisit => '/comminicate_visit';
  static String get createNewProduct => '/create_new_product';
  static String get productDetail => '/product_details';

  static List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    notFound,
    GetPage<dynamic>(
      name: introRoute,
      page: () => const IntroScreen(),
    ),
    GetPage<dynamic>(
      name: loginRoute,
      page: () => const LoginScreen(),
    ),
    GetPage<dynamic>(
      name: signupRoute,
      page: () => const SignupScreen(),
    ),
    GetPage<dynamic>(
      name: initialRoute,
      page: () => const DefaultIntroScreen(),
    ),
    GetPage<dynamic>(
      name: companyIntroRoute,
      page: () => const CompanyIntroScreen(),
    ),
    GetPage<dynamic>(
      name: companyLoginRoute,
      page: () => const CompanyLoginScreen(),
    ),
    GetPage<dynamic>(
      name: companyRegisterRoute,
      page: () => const CompanyRegisterScreen(),
    ),
    GetPage<dynamic>(
      name: homeScreen,
      page: () => const HomeScreen(),
    ),
    GetPage<dynamic>(
      name: bottomNBScreen,
      page: () => const BottomNBScreen(),
    ),
    GetPage<dynamic>(
      name: searchScreen,
      page: () => const SearchScreen(),
    ),
    GetPage<dynamic>(
      name: favoriteScreen,
      page: () => const FavoritesScreen(),
    ),
    GetPage<dynamic>(
      name: profileScreen,
      page: () => const ProfileScreen(),
    ),
    GetPage<dynamic>(
      name: myOrdersScreen,
      page: () => const MyOrdersScreen(),
    ),
    GetPage<dynamic>(
      name: myOrdersScreen,
      page: () => const MyOrdersScreen(),
    ),
    GetPage<dynamic>(
      name: myCommentsScreen,
      page: () => const MyCommentsScreen(),
    ),
    GetPage<dynamic>(
      name: editCustomerProfileScreen,
      page: () => const EditCustomerProfileScreen(),
    ),
    GetPage<dynamic>(
      name: myProductsScreen,
      page: () => const MyProductsScreen(),
    ),
    GetPage<dynamic>(
      name: mySalesScreen,
      page: () => const MySalesScreen(),
    ),
    GetPage<dynamic>(
      name: editCompanyProfileScreen,
      page: () => const EditCompanyProfileScreen(),
    ),
    GetPage<dynamic>(
      name: editCompanyAboutUs,
      page: () => const EditAboutUsScreen(),
    ),
    GetPage<dynamic>(
      name: cardSecreen,
      page: () => const CardScreen(),
    ),
    GetPage<dynamic>(
      name: customerVisit,
      page: () => const VisitCustomerScreen(),
    ),
    GetPage<dynamic>(
      name: companyVisit,
      page: () => const VisitCompanyScreen(),
    ),
    GetPage<dynamic>(
      name: ordersVisit,
      page: () => const OrdersVisitScreen(),
    ),
    GetPage<dynamic>(
      name: commentsVisit,
      page: () => const CommentsVisitScreen(),
    ),
    GetPage<dynamic>(
      name: productsVisit,
      page: () => const ProductsVisitScreen(),
    ),
    GetPage<dynamic>(
      name: aboutUsVisit,
      page: () => const VisitAboutUsScreen(),
    ),
    GetPage<dynamic>(
      name: comminicateVisit,
      page: () => const VisitComminicateScreen(),
    ),
    GetPage<dynamic>(
      name: createNewProduct,
      page: () => const CreateNewProductScreen(),
    ),
    GetPage<dynamic>(
      name: productDetail,
      page: () => const ProductDetailScreen(),
    ),
  ];
}
