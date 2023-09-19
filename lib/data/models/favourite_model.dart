class FavouriteModel {
  int? productId;
  int? userId;
  FavouriteModel({
    this.productId,
    this.userId,
  });

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    userId = json['user_id'];
  }
}
