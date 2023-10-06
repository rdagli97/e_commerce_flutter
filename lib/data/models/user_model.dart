import 'package:flutter_e_commerce_app/data/models/buyed_products.dart';
import 'package:flutter_e_commerce_app/data/models/favourite_model.dart';
import 'package:flutter_e_commerce_app/data/models/product_model.dart';
import 'package:flutter_e_commerce_app/data/models/saled_products.dart';

class UserModel {
  int? id;
  String? username;
  String? email;
  String? phone;
  String? image;
  int? role;
  String? adress;
  String? aboutUs;
  String? token;
  String? gender;
  int? saledProductCount;
  List<ProductsModel>? products;
  List<BuyedProductsModel>? buyedProducts;
  List<SaledProductsModel>? saledProducts;
  List<FavouriteModel>? favouriteProducts;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.phone,
    this.image,
    this.role,
    this.adress,
    this.aboutUs,
    this.products,
    this.buyedProducts,
    this.saledProducts,
    this.favouriteProducts,
    this.token,
    this.gender,
    this.saledProductCount,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    var productList = json['user']['products'] as List?;
    List<ProductsModel> products = [];

    if (productList != null) {
      products = productList.map((e) => ProductsModel.fromJson(e)).toList();
    }

    var buyedProductList = json['user']['buyed_products'] as List?;
    List<BuyedProductsModel> buyedProducts = [];

    if (buyedProductList != null) {
      buyedProducts =
          buyedProductList.map((e) => BuyedProductsModel.fromJson(e)).toList();
    }

    var saledProductList = json['user']['saled_products'] as List?;
    List<SaledProductsModel> saledProducts = [];

    if (saledProductList != null) {
      saledProducts =
          saledProductList.map((e) => SaledProductsModel.fromJson(e)).toList();
    }

    var favouriteProductsList = json['user']['favourites'] as List?;
    List<FavouriteModel> favourites = [];

    if (favouriteProductsList != null) {
      favourites =
          favouriteProductsList.map((e) => FavouriteModel.fromJson(e)).toList();
    }

    return UserModel(
      id: json['user']['id'],
      username: json['user']['username'],
      email: json['user']['email'],
      phone: json['user']['phone'],
      image: json['user']['image'],
      role: json['user']['role'],
      adress: json['user']['adress'],
      aboutUs: json['user']['aboutUs'],
      gender: json['user']['gender'],
      saledProductCount: json['user']['saled_product_count'],
      token: json['token'],
      products: products,
      buyedProducts: buyedProducts,
      saledProducts: saledProducts,
      favouriteProducts: favourites,
    );
  }
}
