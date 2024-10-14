import 'package:flutter/material.dart';
import 'package:task_5/presentation/models/ProductModel.dart';

class ProductWidget extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;
  final VoidCallback onLikeClicked;

  const ProductWidget({
    super.key,
    required this.product,
    required this.onTap,
    required this.onLikeClicked,
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
                        onLikeClicked();
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