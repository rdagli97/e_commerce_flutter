class ProductImageModel {
  int? id;
  String? image;
  int? productId;

  ProductImageModel({
    this.image,
    this.productId,
    this.id,
  });

  ProductImageModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    productId = json['product_id'];
    id = json['id'];
  }
}
