import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/comment_controller.dart';
import 'package:flutter_e_commerce_app/data/controllers/discount_controller.dart';
import 'package:flutter_e_commerce_app/data/controllers/favourite_controller.dart';
import 'package:flutter_e_commerce_app/data/controllers/product_controller.dart';
import 'package:flutter_e_commerce_app/data/controllers/user_controller.dart';
import 'package:flutter_e_commerce_app/presentation/screens/auth/loading_screen/loading_screen.dart';
import 'package:provider/provider.dart';
import 'resources/style/colors.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, host, port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserController()),
        ChangeNotifierProvider(create: (_) => ProductController()),
        ChangeNotifierProvider(create: (_) => FavouriteController()),
        ChangeNotifierProvider(create: (_) => CommentController()),
        ChangeNotifierProvider(create: (_) => DiscountController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
        ),
        scaffoldBackgroundColor: AppColors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      home: const LoadingScreen(),
    );
  }
}
