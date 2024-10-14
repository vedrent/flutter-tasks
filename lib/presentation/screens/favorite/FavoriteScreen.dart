import 'package:flutter/material.dart';
import 'package:task_5/data/ProductsData.dart';
import 'package:task_5/presentation/models/CartItemModel.dart';
import 'package:task_5/data/CartItemData.dart';
import '../../widgets/ProductWidget.dart';
import '../product/ProductDetailsScreen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  var products = [];

  @override
  void initState() {
    super.initState();
    products.addAll(initialProducts.where((element) => element.isFavorite));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: (1 / 1.71)),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            var product = products[index];
            return ProductWidget(
              product: product,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product,
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
                      },
                      onLikeClicked: () {
                        setState(() {
                          product.isFavorite = !product.isFavorite;
                        });
                      },),
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
      ),
    );
  }
}