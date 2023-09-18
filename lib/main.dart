import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/domain/controllers/bindings/startup_bindings.dart';
import 'package:flutter_e_commerce_app/domain/router/route.dart';
import 'package:get/get.dart';

import 'resources/style/colors.dart';

void main() {
  StartUpBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRouter.pages,
      initialRoute: AppRouter.bottomNBScreen,
      unknownRoute: AppRouter.notFound,
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
        ),
        scaffoldBackgroundColor: AppColors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      home: null,
    );
  }
}
