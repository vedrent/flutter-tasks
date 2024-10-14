import 'package:flutter/material.dart';
import 'package:task_5/presentation/models/ProductModel.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.imageUri),
            const SizedBox(height: 12.0),
            Text(
              product.title,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            Align(
              alignment: Alignment.center,
              child: Text(
                "${product.cost}₽",
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              product.subtitle,
              style: const TextStyle(fontSize: 18),

            ),
          ],
        ),
      ),
    );
  }
}