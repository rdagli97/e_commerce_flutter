import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/controllers/user_controller.dart';
import 'package:flutter_e_commerce_app/data/models/api_response.dart';
import 'package:flutter_e_commerce_app/data/models/buyed_products.dart';
import 'package:flutter_e_commerce_app/data/models/product_model.dart';
import 'package:flutter_e_commerce_app/data/models/saled_products.dart';
import 'package:flutter_e_commerce_app/data/repo/api.dart';
import 'package:flutter_e_commerce_app/presentation/screens/auth_intro/intro_screen/intro_screen.dart';
import 'package:flutter_e_commerce_app/presentation/screens/bottom_nb/bottom_nb_screen.dart';
import 'package:flutter_e_commerce_app/resources/consts/service_strings.dart';
import 'package:flutter_e_commerce_app/resources/utils/handle_error.dart';
import 'package:flutter_e_commerce_app/resources/utils/navigate_skills.dart';
import 'package:flutter_e_commerce_app/resources/utils/pick_image.dart';
import 'package:provider/provider.dart';

import '../repo/shared_preference.dart';

class ProductController extends ChangeNotifier {
  final API _apiService = API();

  List<ProductsModel> _productList = [];
  List<ProductsModel> get productList => _productList;

  final List<BuyedProductsModel> _buyedProductList = [];
  List<BuyedProductsModel> get buyedProductList => _buyedProductList;

  final List<SaledProductsModel> _saledProductList = [];
  List<SaledProductsModel> get saledProductList => _saledProductList;

  final List<File?> _productImages = [];
  List<File?> get productImages => _productImages;

  ProductsModel? _product;
  ProductsModel? get product => _product;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> createProduct({
    required BuildContext context,
    required bool mounted,
    required String title,
    required String description,
    required double price,
    required String category,
  }) async {
    _isLoading = true;
    ApiResponse response = await _apiService.createProduct(
      title: title,
      description: description,
      price: price,
      category: category,
    );
    if (!mounted) return;
    if (response.error == null) {
      NavigateSkills().pushReplacementTo(
        context,
        const BottomNBScreen(),
      );
      HandleError().showErrorMessage(context, 'Product created!');
    } else if (response.error == unauthorized) {
      logoutAndPushIntro(context);
    } else {
      HandleError().showErrorMessage(context, '${response.error}');
    }
    _isLoading = false;
    notifyListeners();
  }

  // delete product
  Future<void> deleteProduct({
    required BuildContext context,
    required bool mounted,
    required int productId,
  }) async {
    _isLoading = true;
    ApiResponse response = await _apiService.deleteProduct(
      productId: productId,
    );
    if (!mounted) return;
    if (response.error == null) {
      if (!mounted) return;
      HandleError().showErrorMessage(context, '${response.data}');
    } else if (response.error == unauthorized) {
      logoutAndPushIntro(context);
    } else {
      HandleError().showErrorMessage(context, '${response.error}');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> giveDiscount({
    required BuildContext context,
    required bool mounted,
    required int productId,
    required int discountValue,
  }) async {
    _isLoading = true;
    ApiResponse response = await _apiService.giveDiscount(
      productId: productId,
      discountValue: discountValue,
    );
    if (!mounted) return;
    if (response.error == null) {
      HandleError().showErrorMessage(context, '${response.data}');
    } else if (response.error == unauthorized) {
      logoutAndPushIntro(context);
    } else {
      HandleError().showErrorMessage(context, '${response.error}');
    }
  }

  Future<void> getProducts({
    required BuildContext context,
    required bool mounted,
  }) async {
    _isLoading = true;
    ApiResponse response = await _apiService.getProducts();
    if (!mounted) return;
    if (response.error == null) {
      _productList = response.data as List<ProductsModel>;
    } else if (response.error == unauthorized) {
      logoutAndPushIntro(context);
    } else {
      HandleError().showErrorMessage(context, '${response.error}');
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> buyProduct({
    required BuildContext context,
    required bool mounted,
    required int productId,
    required int piece,
  }) async {
    _isLoading = true;
    ApiResponse response = await _apiService.buyProduct(
      productId: productId,
      piece: piece,
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

  Future<void> createProductImage({
    required BuildContext context,
    required bool mounted,
    required File? image,
  }) async {
    _isLoading = true;
    await context
        .read<UserController>()
        .getCurrentUserDetails(context: context, mounted: mounted);
    if (!mounted) return;
    ApiResponse response = await _apiService.createProductImage(
      image: getStringImage(image),
      productId: context.read<UserController>().user?.products?.last.id ?? -1,
    );
    if (!mounted) return;
    if (response.error == null) {
      HandleError().showErrorMessage(context, 'Photo added successfully');
      NavigateSkills().pushReplacementTo(
        context,
        const BottomNBScreen(),
      );
    } else if (response.error == unauthorized) {
      logoutAndPushIntro(context);
    } else {
      HandleError().showErrorMessage(context, '${response.error}');
    }
    _isLoading = false;
    notifyListeners();
  }

  void addPhotoToList(File? imageUrl) {
    productImages.add(imageUrl);
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
