class Product {
  ProductId productId;
  int quantity;

  Product({this.productId, this.quantity});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['productId'] != null
        ? ProductId.fromJson(json['productId'])
        : null;
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['productId'] = productId.toJson();
    data['quantity'] = quantity;
    return data;
  }
}

class ProductId {
  String id;
  String name;
  int price;
  String description;
  String category;
  String imgUrl;

  ProductId(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.category,
      this.imgUrl});

  ProductId.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['imgUrl'] = imgUrl;
    return data;
  }
}

class Root {
  String id;
  List<Product> products;

  Root({this.id, this.products});

  Root.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = id;
    data['products'] =
        products != null ? products.map((v) => v.toJson()).toList() : null;
    return data;
  }
}
