class SaledProductsModel {
  int? id;
  int? userId;
  String? title;
  String? description;
  int? price;
  int? piece;
  String? image;

  SaledProductsModel({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.price,
    this.piece,
    this.image,
  });

  SaledProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    piece = json['piece'];
    image = json['image'];
  }
}
