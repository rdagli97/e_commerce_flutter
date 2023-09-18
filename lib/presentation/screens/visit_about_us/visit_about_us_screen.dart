import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/screens/visit_about_us/about_us_container.dart';

class VisitAboutUsScreen extends StatelessWidget {
  const VisitAboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'About us'),
        centerTitle: true,
      ),
      body: const AboutUsContainer(),
    );
  }
}
