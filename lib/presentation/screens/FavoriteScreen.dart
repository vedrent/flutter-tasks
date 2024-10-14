import 'package:flutter/material.dart';
import 'package:task_5/data/StaticData.dart';

import '../widgets/ProductWidget.dart';
import 'ProductDetailsScreen.dart';

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
                  builder: (context) => ProductDetailScreen(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}