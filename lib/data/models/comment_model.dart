class CommentsModel {
  int? id;
  int? userId;
  String? comment;
  int? productId;
  int? rating;
  String? createdAt;
  String? updatedAt;
  //List<CommentImages>? commentImages;

  CommentsModel({
    this.id,
    this.userId,
    this.comment,
    this.productId,
    this.rating,
  });

  CommentsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    comment = json['comment'];
    productId = json['product_id'];
    rating = json['rating'];
  }
}
