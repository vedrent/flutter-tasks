import 'package:flutter/material.dart';
import 'package:task_5/data/StaticData.dart';
import 'package:task_5/presentation/screens/CreateProductScreen.dart';
import 'package:task_5/presentation/screens/ProductDetailsScreen.dart';
import 'package:task_5/presentation/widgets/ProductWidget.dart';

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
                  builder: (context) => ProductDetailScreen(product: product),
                ),
              );
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