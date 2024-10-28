import 'package:flutter/material.dart';
import 'package:task_5/presentation/models/ProductModel.dart';
import 'package:task_5/data/ProductsData.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onDeleteClicked;
  final VoidCallback onInCartPressed;
  final VoidCallback onLikeClicked;

  const ProductDetailScreen({
    super.key,
    required this.product,
    required this.onDeleteClicked,
    required this.onInCartPressed,
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
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(
                      product.imageUri,
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      product.title,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                    Text(
                      "${product.cost}₽",
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      product.subtitle,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            // const Spacer(),

            Row(
              children: [
                IconButton(
                    onPressed: () {
                      onLikeClicked();
                    },
                    icon: Icon(getFavoriteIconData(),
                      color: product.isFavorite ? Colors.red : Colors.white,
                      shadows: const <Shadow>[Shadow(color: Colors.black, blurRadius: 5.0)],
                    ),
                ),
                const Spacer(),
                ButtonTheme(
                  minWidth: 300,
                  child: OutlinedButton(
                      onPressed: () {
                        onInCartPressed();
                      },
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: const Size(150,50),
                          backgroundColor: const Color.fromRGBO(182, 247, 143, 1),
                          side: const BorderSide(color: const Color.fromRGBO(182, 247, 143, 1))
                      ),
                      child: const Text("В корзину"),
                  ),

                ),
                const Spacer(),
                OutlinedButton(
                    onPressed: () {
                      onDeleteClicked();
                      if (product.id != null) {
                        deleteProduct(product.id!);
                      }
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(150,50),
                        backgroundColor: const Color.fromRGBO(182, 247, 143, 1),
                        side: const BorderSide(color: const Color.fromRGBO(182, 247, 143, 1))
                    ),
                    child: const Text("Удалить")
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}