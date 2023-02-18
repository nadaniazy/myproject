class Products {
  Data? data;
  String? message;
  int? code;
  dynamic errors;
  Products({this.data, this.message, this.code, this.errors});

  Products.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    code = json['code'];
    errors=json['error'];
    }
  }

class Data {
  List<ProductData>? productData = [];

  Data({this.productData});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      productData = <ProductData>[];
      json['data'].forEach((v) {
        productData!.add(ProductData.fromJson(v));
      });
    }
  }
}

class ProductData {
  int? id;
  String? name;
  String? description;
  int? quantity;
  int? price;
  int? offer;
  String? image;
  String? available;
  int? categoryId;
  String? createdAt;
  String? updatedAt;

  ProductData(
      {this.id,
        this.name,
        this.description,
        this.quantity,
        this.price,
        this.offer,
        this.image,
        this.available,
        this.categoryId,
        this.createdAt,
        this.updatedAt});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    offer = json['offer'];
    image = json['image'];
    available = json['available'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['quantity'] = quantity;
    data['price'] = price;
    data['offer'] = offer;
    data['image'] = image;
    data['available'] = available;
    data['category_id'] = categoryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
