import 'package:ecommerce_app_task/contoller/product_list_contoller.dart';
import 'package:ecommerce_app_task/model/product_list_model.dart';
import 'package:ecommerce_app_task/view/description_page/description_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  List<ProductListModel> showedProducts = [];

  fetchProductListFunction() async {
    final varProvider = Provider.of<ProductListContoller>(
      context,
      listen: false,
    );
    await varProvider.fetchProductList();
    showedProducts = List<ProductListModel>.from(varProvider.productList);
  }

  @override
  void initState() {
    super.initState();
    fetchProductListFunction();
  }

  @override
  void dispose() {
    super.dispose();
    isSearching = false;
  }

  @override
  Widget build(BuildContext context) {
    final productListVarProvider = Provider.of<ProductListContoller>(context);
    return Scaffold(
      appBar: AppBar(
        title:
            isSearching
                ? buildTextField(controller: searchController)
                : Text("Home"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions:
            isSearching
                ? []
                : [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isSearching = true;
                      });
                    },

                    icon: Icon(Icons.search),
                  ),
                ],
      ),
      backgroundColor: Colors.amber[50],
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: showedProducts.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 300,
          ),
          itemBuilder:
              (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    isSearching = false;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => DescriptionPage(
                            productid: showedProducts[index].id ?? 0,
                            image: showedProducts[index].image ?? "",
                            title: showedProducts[index].title ?? "",
                            price: '₹${showedProducts[index].price ?? 0}',
                            rating:
                                '${showedProducts[index].rating?.rate ?? 0}★',
                            description:
                                showedProducts[index].description ?? "",
                            category: showedProducts[index].category ?? "",
                          ),
                    ),
                  );
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 160,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                          child: Image.network(
                            showedProducts[index].image ?? '',
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
                            showedProducts[index].title ?? '',
                            // textAlign: TextAlign.center,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            // overflow: TextOverflow.ellipsis,
                            // maxLines: 3,
                            softWrap: true,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            '₹${showedProducts[index].price ?? 0}',
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
                          child: Row(
                            children: [
                              Text(
                                '${showedProducts[index].rating?.rate ?? 0}',
                                //   textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text("★", style: TextStyle(color: Colors.amber)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        ),
      ),
    );
  }

  Widget buildTextField({required TextEditingController controller}) {
    final varProvider = Provider.of<ProductListContoller>(
      context,
      listen: false,
    );
    return TextFormField(
      controller: controller,
      autofocus: true,
      onChanged: (value) {
        setState(() {});
        showedProducts =
            varProvider.productList
                .where(
                  (element) => element.title!.toLowerCase().contains(
                    value.toLowerCase(),
                  ),
                )
                .toList();
      },
      onTapOutside: (event) {
        setState(() {
          isSearching = false;
        });
      },
      decoration: InputDecoration(
        labelText: "Search",
        hintText: "Type to search...",
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
