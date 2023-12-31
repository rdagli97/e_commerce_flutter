import 'package:flutter_e_commerce_app/data/models/comment_image_model.dart';

class CommentsModel {
  int? id;
  int? userId;
  String? comment;
  int? productId;
  int? rating;
  String? createdAt;
  String? updatedAt;
  List<CommentImageModel>? commentImages;

  CommentsModel({
    this.id,
    this.userId,
    this.comment,
    this.productId,
    this.rating,
    this.commentImages,
  });

  CommentsModel.fromJson(Map<String, dynamic> json) {
    id = json['comments']['id'];
    userId = json['comments']['user_id'];
    comment = json['comments']['comment'];
    productId = json['comments']['product_id'];
    rating = json['comments']['rating'];
    if (json['comment_images'] != null) {
      commentImages = <CommentImageModel>[];
      json['comment_images'].forEach((v) {
        commentImages!.add(CommentImageModel.fromJson(v));
      });
    }
  }
}
