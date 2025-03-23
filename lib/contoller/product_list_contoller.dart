import 'dart:convert';
import 'dart:developer';
import 'package:ecommerce_app_task/model/product_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductListContoller with ChangeNotifier {
  List<ProductListModel> productList = [];
  Future<void> fetchProductList() async {
    var url = 'https://fakestoreapi.com/products';
    final res = await http.get(Uri.parse(url));
    // log(res.body);1
    productList =
        (jsonDecode(res.body) as List)
            .map((item) => ProductListModel.fromJson(item))
            .toList();
    log(productList.toString());
    notifyListeners();
  }
}
