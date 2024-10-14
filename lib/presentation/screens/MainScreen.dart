import 'package:flutter/material.dart';
import 'package:task_5/data/ProductsData.dart';
import 'package:task_5/presentation/screens/product/CreateProductScreen.dart';
import 'package:task_5/presentation/screens/product/ProductDetailsScreen.dart';
import 'package:task_5/presentation/widgets/ProductWidget.dart';
import 'package:task_5/data/CartItemData.dart';
import 'package:task_5/presentation/models/CartItemModel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var products = [];

  @override
  void initState() {
    super.initState();
    products.addAll(initialProducts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: (1 / 1.7)),
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          var product = products[index];
          return ProductWidget(
            product: product,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    product: product,
                    onDeleteClicked: () {
                      setState(() {
                        products.remove(product);
                        initialCartData.removeWhere((element) => element.id == product.id);
                        initialProducts.remove(product);
                      });
                    }, onInCartPressed: () {
                    initialCartData.add(CartItemModel(
                        product.id,
                        product.title,
                        product.subtitle,
                        product.imageUri,
                        product.cost,
                        1
                    ));
                  }, onLikeClicked: () {
                    setState(() {
                      product.isFavorite = !product.isFavorite;
                    });
                  },
                  ),
                ),
              );
            },
            onLikeClicked: () {
              setState(() {
                product.isFavorite = !product.isFavorite;
              });
            },
          );
        },
      ),
        floatingActionButton: FloatingActionButton.small(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CreateProductScreen(
                  onProductCreated: (product) {
                    setState(() {
                      products.add(product!);
                    });
                  },
                )
            ),
          );
        },
          child: const Icon(Icons.add),
        )
    );
  }
}