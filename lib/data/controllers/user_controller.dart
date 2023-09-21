import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/models/api_response.dart';
import 'package:flutter_e_commerce_app/data/models/user_model.dart';
import 'package:flutter_e_commerce_app/data/repo/api.dart';
import 'package:flutter_e_commerce_app/data/repo/shared_preference.dart';
import 'package:flutter_e_commerce_app/presentation/screens/auth_intro/intro_screen/intro_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/bottom_nb/bottom_nb_screen.dart';
import 'package:flutter_e_commerce_app/resources/consts/service_strings.dart';
import 'package:flutter_e_commerce_app/resources/utils/handle_error.dart';
import 'package:flutter_e_commerce_app/resources/utils/navigate_skills.dart';
import 'package:flutter_e_commerce_app/resources/utils/pick_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends ChangeNotifier {
  final API _apiService = API();

  UserModel? _user;
  UserModel? get user => _user;

  bool _isloading = false;
  bool get isLoading => _isloading;

  // register customer
  Future<void> registerCustomer({
    required BuildContext context,
    required bool mounted,
    required String username,
    required String email,
    required String password,
    required String phone,
    required File? file,
  }) async {
    _isloading = true;
    ApiResponse response = await _apiService.registerCustomer(
      username: username,
      email: email,
      password: password,
      image: getStringImage(file),
      phone: phone,
    );
    if (!mounted) return;
    if (response.error == null) {
      saveAndGoHome(context, mounted, response.data as UserModel);
    } else {
      HandleError().showErrorMessage(context, '${response.error}');
    }
    _isloading = false;
    notifyListeners();
  }

  // register company
  Future<void> registerCompany({
    required BuildContext context,
    required String username,
    required String email,
    required String password,
    required String phone,
    required bool mounted,
  }) async {
    _isloading = true;
    ApiResponse response = await _apiService.registerCompany(
      username: username,
      email: email,
      password: password,
      phone: phone,
    );

    if (!mounted) return;
    if (response.error == null) {
      saveAndGoHome(context, mounted, response.data as UserModel);
    } else {
      HandleError().showErrorMessage(context, '${response.error}');
    }
    _isloading = false;
    notifyListeners();
  }

  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
    required bool mounted,
  }) async {
    _isloading = true;
    ApiResponse response = await _apiService.login(
      email: email,
      password: password,
    );
    if (!mounted) return;
    if (response.error == null) {
      saveAndGoHome(context, mounted, response.data as UserModel);
    } else {
      HandleError().showErrorMessage(context, '${response.error}');
    }
    _isloading = false;
    notifyListeners();
  }

  Future<void> updateUser({
    required BuildContext context,
    required bool mounted,
    required String image,
    required String adress,
    required String aboutUs,
  }) async {
    _isloading = true;
    ApiResponse response = await _apiService.updateUser(
      image: image,
      adress: adress,
      aboutUs: aboutUs,
    );
    if (!mounted) return;
    if (response.error == null) {
      _user = response.data as UserModel;
      HandleError().showErrorMessage(context, 'User updated');
    } else if (response.error == unauthorized) {
      logoutAndGoIntroScreen(context);
    } else {
      HandleError().showErrorMessage(context, '${response.error}');
    }
    _isloading = false;
    notifyListeners();
  }

  Future<void> getCurrentUserDetails({
    required BuildContext context,
    required bool mounted,
  }) async {
    _isloading = true;
    ApiResponse response = await _apiService.getCurrentUserDetails();
    if (!mounted) return;
    if (response.error == null) {
      _user = response.data as UserModel;
    } else if (response.error == unauthorized) {
      logoutAndGoIntroScreen(context);
    } else {
      HandleError().showErrorMessage(context, '${response.error}');
    }
    _isloading = false;
    notifyListeners();
  }

  void logoutAndGoIntroScreen(BuildContext context) {
    SharedPreference().logout().then(
          (value) => NavigateSkills().pushReplacementTo(
            context,
            const IntroScreen(),
          ),
        );
  }

  Future<void> saveAndGoHome(
    BuildContext context,
    bool mounted,
    UserModel userModel,
  ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('token', userModel.token ?? '');
    await pref.setInt('userId', userModel.id ?? 0);
    if (!mounted) return;
    NavigateSkills().pushReplacementTo(
      context,
      const BottomNBScreen(),
    );
  }
}
