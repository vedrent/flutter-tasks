import 'package:flutter/material.dart';
import 'package:task_5/presentation/models/ProductModel.dart';

class ProductWidget extends StatefulWidget {
  final ProductModel product;
  final VoidCallback onTap;

  const ProductWidget({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  State<ProductWidget> createState() =>
      _ProductWidgetState(
          product: product,
          onTap: onTap
      );
}

class _ProductWidgetState extends State<ProductWidget> {
  final ProductModel product;
  final VoidCallback onTap;

  _ProductWidgetState({
    required this.product,
    required this.onTap,
  });

  IconData getFavoriteIconData() {
    if (product.isFavorite) {
      return Icons.favorite_outlined;
    } else {
      return Icons.favorite_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.network(
                    alignment: Alignment.center,
                    product.imageUri,
                    width: 170,
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          product.isFavorite = !product.isFavorite;
                        });
                      },
                      icon: Icon(getFavoriteIconData(),
                        color: product.isFavorite ? Colors.red : Colors.white,
                        shadows: const <Shadow>[Shadow(color: Colors.black, blurRadius: 5.0)],
                      ),

                  ),
                ],
              ),
              Text(product.title, maxLines: 2, overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              Text(product.subtitle, maxLines: 4,
                  overflow: TextOverflow.ellipsis),
              Align(
                alignment: Alignment.bottomRight,
                child: Text("${product.cost}₽",
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}