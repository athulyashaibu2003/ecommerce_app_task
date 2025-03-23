import 'package:ecommerce_app_task/contoller/cart_controller.dart';
import 'package:ecommerce_app_task/contoller/product_list_contoller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DescriptionPage extends StatefulWidget {
  DescriptionPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.rating,
    required this.price,
    required this.productid,
    required this.category,
  });
  final int productid;
  final String image;
  final String title;
  final String description;
  final String rating;
  final String price;
  final String category;

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    final productListVarProvider = Provider.of<ProductListContoller>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: Center(
                  child: Image.network(
                    widget.image,
                    width: double.infinity,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  child: Text(
                    widget.title,

                    // textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    // overflow: TextOverflow.ellipsis,
                    // maxLines: 3,
                    softWrap: true,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        widget.price,

                        //  textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.visible,
                        maxLines: 3,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        widget.rating,

                        //   textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "Description",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 5),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    widget.description,

                    //   textAlign: TextAlign.center,

                    // overflow: TextOverflow.,
                    maxLines: 5,
                  ),
                ),
              ),
              SizedBox(height: 25),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Provider.of<CartController>(
                      context,
                      listen: false,
                    ).addtocart(
                      id: widget.productid,
                      title: widget.title,
                      price: widget.price,
                      quantity: 1,
                      description: widget.description,
                      image: widget.image,
                      category: widget.category,
                      rating: widget.rating,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.grey,
                        content: Text(
                          '${widget.title} added to cart!',
                          style: TextStyle(color: Colors.white),
                        ),
                        duration: Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder:
                    //         (context) => CartPage(
                    //           image:widget.image,
                    //           title: widget.title,
                    //           price:widget.price,
                    //           rating:
                    //               widget.rating,
                    //         ),
                    //   ),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    // primary: Colors.orange, // Button background color
                    // onPrimary: Colors.white, // Text color
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ), // Rounded corners
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 100,
                    ), // Button padding
                  ),
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
