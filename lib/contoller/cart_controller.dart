import 'dart:convert';
import 'dart:developer';
import 'package:ecommerce_app_task/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CartController with ChangeNotifier {
  List<CartListModel> cartList = [];

  Future<void> addtocart({
    required int id,
    required String title,
    required String price,
    required String image,
    required int quantity,
    required String description,
    required String category,
    required String rating,
  }) async {
    // var url = "https://fakestoreapi.com/carts";
    // final res = await http.post(
    //   Uri.parse(url),
    //   headers: {'Content-Type': 'application/json'},
    //   body: jsonEncode({
    //     "userId": "1",
    //     "date": DateTime.now().toString().split(' ').first,
    //     "products": [
    //       {"productId": productid, "quantity": 1},
    //     ],
    //   }),
    // );
    // log(res.body);
    cartList.add(
      CartListModel(
        id: id,
        title: title,
        price: price,
        quantity: quantity,
        image: image,
        description: description,
        category: category,
        rating: rating,
      ),
    );

    log('cart = $cartList');
    notifyListeners();
  }

  Future<void> getusercart() async {
    // var url = 'https://fakestoreapi.com/carts/user/1';
    // final res = await http.get(Uri.parse(url));
    // log(res.body);

    notifyListeners();
  }
}
