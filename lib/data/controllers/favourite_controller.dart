import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/models/api_response.dart';
import 'package:flutter_e_commerce_app/data/repo/api.dart';
import 'package:flutter_e_commerce_app/resources/consts/service_strings.dart';
import 'package:flutter_e_commerce_app/resources/utils/handle_error.dart';

import '../../presentation/screens/auth_intro/intro_screen/intro_screen.dart';
import '../../resources/utils/navigate_skills.dart';
import '../repo/shared_preference.dart';

class FavouriteController extends ChangeNotifier {
  final API _apiService = API();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> addOrRemoveFavourite({
    required BuildContext context,
    required bool mounted,
    required int productId,
  }) async {
    _isLoading = true;
    ApiResponse response = await _apiService.addOrRemoveFavourite(
      productId: productId,
    );
    if (!mounted) return;
    if (response.error == null) {
      HandleError().showErrorMessage(context, '${response.data}');
    } else if (response.error == unauthorized) {
      logoutAndPushIntro(context);
    } else {
      HandleError().showErrorMessage(context, '${response.error}');
    }
    _isLoading = false;
    notifyListeners();
  }

  void logoutAndPushIntro(BuildContext context) {
    SharedPreference().logout().then((value) => {
          NavigateSkills().pushReplacementTo(
            context,
            const IntroScreen(),
          ),
        });
    notifyListeners();
  }
}
