import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/models/api_response.dart';
import 'package:flutter_e_commerce_app/data/models/user_model.dart';
import 'package:flutter_e_commerce_app/data/repo/api.dart';
import 'package:flutter_e_commerce_app/data/repo/shared_preference.dart';
import 'package:flutter_e_commerce_app/presentation/screens/auth/loading_screen/loading_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/auth_intro/default_intro_screen/default_intro_screen.dart';
import 'package:flutter_e_commerce_app/resources/consts/service_strings.dart';
import 'package:flutter_e_commerce_app/resources/utils/handle_error.dart';
import 'package:flutter_e_commerce_app/resources/utils/navigate_skills.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends ChangeNotifier {
  final API _apiService = API();

  final List<String> _malePPs = [
    "assets/pps/profile1.png",
    "assets/pps/profile2.png",
    "assets/pps/profile4.png",
  ];
  final List<String> _femalePPs = [
    "assets/pps/profile3.png",
    "assets/pps/profile5.png",
    "assets/pps/profile6.png",
  ];
  final List<String> _companyPPs = [
    "assets/pps/company_icon1.png",
    "assets/pps/company_icon2.png",
    "assets/pps/company_icon3.png",
    "assets/pps/company_icon4.png",
    "assets/pps/company_icon5.png",
    "assets/pps/company_icon6.png",
    "assets/pps/company_icon7.png",
    "assets/pps/company_icon8.png",
  ];

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
    required String gender,
  }) async {
    _isloading = true;
    shuffleLists();
    ApiResponse response = await _apiService.registerCustomer(
      username: username,
      email: email,
      password: password,
      image: gender == 'male' ? _malePPs[0] : _femalePPs[0],
      phone: phone,
      gender: gender,
    );
    if (!mounted) return;
    if (response.error == null) {
      saveAndGoHome(context, mounted, response.data as UserModel);
      _user = response.data as UserModel;
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
    shuffleLists();
    ApiResponse response = await _apiService.registerCompany(
      username: username,
      email: email,
      password: password,
      phone: phone,
      image: _companyPPs[0],
    );

    if (!mounted) return;
    if (response.error == null) {
      saveAndGoHome(context, mounted, response.data as UserModel);
      _user = response.data as UserModel;
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
      _user = response.data as UserModel;
    } else {
      HandleError().showErrorMessage(context, '${response.error}');
    }
    _isloading = false;
    notifyListeners();
  }

  Future<void> updateUser({
    required BuildContext context,
    required bool mounted,
    required String adress,
    required String aboutUs,
  }) async {
    _isloading = true;
    ApiResponse response = await _apiService.updateUser(
      adress: adress,
      aboutUs: aboutUs,
    );
    if (!mounted) return;
    if (response.error == null) {
      _user = response.data as UserModel;
      HandleError().showErrorMessage(context, 'User updated');
      getCurrentUserDetails(context: context, mounted: mounted);
      NavigateSkills().pushReplacementTo(
        context,
        const LoadingScreen(),
      );
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

  void shuffleLists() {
    _malePPs.shuffle();
    _femalePPs.shuffle();
    _companyPPs.shuffle();
  }

  Future<void> logoutAndGoIntroScreen(BuildContext context) async {
    await SharedPreference().logout().then(
          (value) => NavigateSkills().pushReplacementTo(
            context,
            const DefaultIntroScreen(),
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
      const LoadingScreen(),
    );
  }
}
