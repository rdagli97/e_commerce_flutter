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
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    role = json['role'];
    adress = json['adress'];
    aboutUs = json['about_us'];
    token = json['token'];
    if (json['products'] != null) {
      products = <ProductsModel>[];
      json['products'].forEach((v) {
        products!.add(ProductsModel.fromJson(v));
      });
    }
    if (json['buyed_products'] != null) {
      buyedProducts = <BuyedProductsModel>[];
      json['buyed_products'].forEach((v) {
        buyedProducts!.add(BuyedProductsModel.fromJson(v));
      });
    }
    if (json['saled_products'] != null) {
      saledProducts = <SaledProductsModel>[];
      json['saled_products'].forEach((v) {
        saledProducts!.add(SaledProductsModel.fromJson(v));
      });
    }
    if (json['favourites'] != null) {
      favouriteProducts = <FavouriteModel>[];
      json['favourites'].forEach((v) {
        favouriteProducts!.add(FavouriteModel.fromJson(v));
      });
    }
  }
}
