import 'package:ecommerce_app_task/contoller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double subTotal = 0;

  fetchcartlist() async {
    final varProvider = Provider.of<CartController>(context, listen: false);
    await varProvider.getusercart();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchcartlist();
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartController>(context);
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cartProvider.cartList.length,
            itemBuilder:
                (context, index) => Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          // color: Colors.amber,
                          child: Image.network(
                            cartProvider.cartList[index].image ?? "",
                          ),
                        ),
                        const SizedBox(width: 10),

                        // Product Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartProvider.cartList[index].title ?? '',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                cartProvider.cartList[index].price ??
                                    '', // Replace with actual amount
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(height: 5),

                              // Rating
                              Text(
                                cartProvider.cartList[index].rating ?? '',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.add_circle,
                                color: Colors.blue,
                              ),
                              onPressed: () {
                                setState(() {
                                  int quantity =
                                      cartProvider.cartList[index].quantity!;
                                  quantity++;
                                  cartProvider.cartList[index].quantity =
                                      quantity;

                                  for (
                                    var i = 0;
                                    i < cartProvider.cartList.length;
                                    i++
                                  ) {
                                    subTotal =
                                        double.parse(
                                          ((cartProvider
                                                      .cartList[i]
                                                      .quantity) ??
                                                  0)
                                              .toString(),
                                        ) *
                                        double.parse(
                                          cartProvider.cartList[i].price ?? '0',
                                        );
                                  }
                                });
                              },
                            ),
                            Text(
                              '${cartProvider.cartList[index].quantity}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.remove_circle,
                                color:
                                    cartProvider.cartList[index].quantity! > 1
                                        ? Colors.red
                                        : Colors.grey,
                              ),
                              onPressed:
                                  cartProvider.cartList[index].quantity! > 1
                                      ? () {
                                        setState(() {
                                          int quantity =
                                              cartProvider
                                                  .cartList[index]
                                                  .quantity!;
                                          quantity--;
                                          cartProvider
                                              .cartList[index]
                                              .quantity = quantity;
                                        });
                                      }
                                      : () =>
                                          cartProvider.cartList.removeAt(index),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Subtotal",
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              Spacer(),
              Flexible(
                child: ListView.builder(
                  itemCount: cartProvider.cartList.length,
                  shrinkWrap: true,
                  itemBuilder:
                      (context, index) => Text(
                        "${cartProvider.cartList[index].quantity} X ${cartProvider.cartList[index].price}",
                      ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
