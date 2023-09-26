import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/user_controller.dart';
import 'package:flutter_e_commerce_app/data/models/api_response.dart';
import 'package:flutter_e_commerce_app/data/repo/api.dart';
import 'package:flutter_e_commerce_app/data/repo/shared_preference.dart';
import 'package:flutter_e_commerce_app/presentation/screens/auth_intro/default_intro_screen/default_intro_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/bottom_nb/bottom_nb_screen.dart';
import 'package:flutter_e_commerce_app/resources/consts/service_strings.dart';
import 'package:flutter_e_commerce_app/resources/style/colors.dart';
import 'package:flutter_e_commerce_app/resources/utils/handle_error.dart';
import 'package:provider/provider.dart';
import '../../../../resources/utils/navigate_skills.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> _loadUserInfo() async {
    String? token = await SharedPreference().getToken();
    if (token == '') {
      goToIntroScreen();
    } else {
      ApiResponse response = await API().getCurrentUserDetails();
      if (!mounted) return;
      if (response.error == null) {
        await context
            .read<UserController>()
            .getCurrentUserDetails(context: context, mounted: mounted);
        goToHomeScreen();
      } else if (response.error == unauthorized) {
        goToIntroScreen();
      } else {
        HandleError().showErrorMessage(context, '${response.error}');
      }
    }
  }

  goToIntroScreen() {
    Future.delayed(const Duration(milliseconds: 200), () {
      NavigateSkills().pushReplacementTo(
        context,
        const DefaultIntroScreen(),
      );
    });
  }

  goToHomeScreen() {
    Future.delayed(const Duration(milliseconds: 200), () {
      NavigateSkills().pushReplacementTo(
        context,
        const BottomNBScreen(),
      );
    });
  }

  @override
  void initState() {
    _loadUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
