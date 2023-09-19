import 'package:flutter_e_commerce_app/data/models/comment_model.dart';
import 'package:flutter_e_commerce_app/data/models/product_image_model.dart';

class ProductsModel {
  int? id;
  int? userId;
  String? title;
  String? description;
  int? price;
  String? category;
  int? rate;
  int? discount;
  int? online;
  String? image;
  List<ProductImageModel>? productImages;
  List<CommentsModel>? comments;

  ProductsModel({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.price,
    this.category,
    this.rate,
    this.discount,
    this.online,
    this.image,
    this.comments,
    this.productImages,
  });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    category = json['category'];
    rate = json['rate'];
    discount = json['discount'];
    online = json['online'];
    image = json['image'];
    if (json['productImages'] != null) {
      productImages = <ProductImageModel>[];
      json['productImages'].forEach((v) {
        productImages!.add(ProductImageModel.fromJson(v));
      });
    }
  }
}
