import 'package:flutter_e_commerce_app/data/models/comment_model.dart';
import 'package:flutter_e_commerce_app/data/models/product_image_model.dart';

class ProductsModel {
  int? id;
  int? userId;
  String? title;
  String? description;
  double? price;
  String? category;
  double? rate;
  int? discount;
  int? online;
  String? image;
  bool? selfFavourited;
  List<ProductImageModel>? productImages;
  List<CommentsModel>? comments;
  double? oldPrice;

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
    this.selfFavourited,
    this.oldPrice,
  });

  ProductsModel.fromJson(Map<String, dynamic> json) {
    var productImageList = json['product_images'] as List?;
    List<ProductImageModel> productImage = [];

    if (productImageList != null) {
      productImage =
          productImageList.map((e) => ProductImageModel.fromJson(e)).toList();
    }

    var commentsList = json['comments'] as List?;
    List<CommentsModel> comment = [];

    if (commentsList != null) {
      comment = commentsList.map((e) => CommentsModel.fromJson(e)).toList();
    }

    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    price = double.tryParse(json['price']?.toString() ?? '0.0') ?? 0.0;
    category = json['category'];
    rate = double.tryParse(json['rate']?.toString() ?? '0.0') ?? 0.0;
    discount = int.tryParse(json['discount']?.toString() ?? '0') ?? 0;
    online = json['online'];
    image = json['image'];
    selfFavourited =
        json['favourites'] != null && json['favourites'].length > 0;
    productImages = productImage;
    comments = comment;
    oldPrice = double.tryParse(json['old_price']?.toString() ?? '0.0') ?? 0.0;
  }
}
