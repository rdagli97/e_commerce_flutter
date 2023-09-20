class FavouriteModel {
  int? id;
  int? productId;
  int? userId;
  FavouriteModel({
    this.id,
    this.productId,
    this.userId,
  });

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
  }
}
