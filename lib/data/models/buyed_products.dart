class BuyedProductsModel {
  int? id;
  int? userId;
  String? title;
  String? description;
  double? price;
  int? piece;
  String? image;

  BuyedProductsModel({
    this.id,
    this.userId,
    this.title,
    this.description,
    this.price,
    this.piece,
    this.image,
  });

  BuyedProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['buyedProducts']['id'];
    userId = json['buyedProducts']['user_id'];
    title = json['buyedProducts']['title'];
    description = json['buyedProducts']['description'];
    price = json['buyedProducts']['price'];
    piece = json['buyedProducts']['piece'];
    image = json['buyedProducts']['image'];
  }
}
