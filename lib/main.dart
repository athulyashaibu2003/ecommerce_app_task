
import 'package:ecommerce_app_task/contoller/cart_controller.dart';
import 'package:ecommerce_app_task/contoller/product_list_contoller.dart';
import 'package:ecommerce_app_task/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductListContoller()),
        ChangeNotifierProvider(create: (context) => CartController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: CartPage(),
        home: SplashScreen(),
      ),
    );
  }
}
