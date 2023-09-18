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
  //List<ProductImages>? productImages;
  //List<Comments>? comments;

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
  }
}
