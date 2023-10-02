import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/user_controller.dart';
import 'package:flutter_e_commerce_app/presentation/global%20components/custom_text.dart';
import 'package:flutter_e_commerce_app/presentation/screens/visit_about_us/about_us_container.dart';
import 'package:provider/provider.dart';

class VisitAboutUsScreen extends StatefulWidget {
  const VisitAboutUsScreen({super.key});

  @override
  State<VisitAboutUsScreen> createState() => _VisitAboutUsScreenState();
}

class _VisitAboutUsScreenState extends State<VisitAboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    final userRead = context.read<UserController>().user;
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'About us'),
        centerTitle: true,
      ),
      body: Center(
        child: AboutUsContainer(
          text: userRead?.aboutUs != null
              ? '${userRead?.aboutUs}'
              : 'There is no confirmation about this company yet.',
        ),
      ),
    );
  }
}
