// To parse this JSON data, do
//
//     final cartListModel = cartListModelFromJson(jsonString);

import 'dart:convert';

CartListModel cartListModelFromJson(String str) =>
    CartListModel.fromJson(json.decode(str));

String cartListModelToJson(CartListModel data) => json.encode(data.toJson());

class CartListModel {
  int? id;
  String? title;
  String? price;
  String? description;
  String? category;
  String? image;
  String? rating;
  int? quantity;

  CartListModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
    this.quantity,
  });

  factory CartListModel.fromJson(Map<String, dynamic> json) => CartListModel(
    id: json["id"],
    title: json["title"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    category: json["category"],
    image: json["image"],
    quantity: json["quantity"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
    "quantity": quantity,
    "rating": rating,
  };
}

// class Rating {
//   double? rate;
//   int? count;

//   Rating({this.rate, this.count});

//   factory Rating.fromJson(Map<String, dynamic> json) =>
//       Rating(rate: json["rate"]?.toDouble(), count: json["count"]);

//   Map<String, dynamic> toJson() => {"rate": rate, "count": count};
// }
