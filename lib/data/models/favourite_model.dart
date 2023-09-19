// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_e_commerce_app/data/models/product_model.dart';

class FavouriteModel {
  int? productId;
  int? userId;
  List<ProductsModel>? products;
  FavouriteModel({
    this.productId,
    this.userId,
    this.products,
  });

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    userId = json['user_id'];
    if (json['products'] != null) {
      products = <ProductsModel>[];
      json['products'].forEach((v) {
        products!.add(ProductsModel.fromJson(v));
      });
    }
  }
}
