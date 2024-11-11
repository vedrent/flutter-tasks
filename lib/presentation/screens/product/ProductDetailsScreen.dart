import 'package:flutter/material.dart';
import 'package:task_5/presentation/models/ProductModel.dart';
import 'package:task_5/data/ProductsData.dart';

class ProductDetailScreen extends StatefulWidget {
  ProductModel product;
  final VoidCallback onDeleteClicked;
  final VoidCallback onInCartPressed;
  final VoidCallback onLikeClicked;
  final ValueChanged<ValueChanged<ProductModel>> onEditPressed;

  ProductDetailScreen({
    super.key,
    required this.product,
    required this.onDeleteClicked,
    required this.onInCartPressed,
    required this.onLikeClicked,
    required this.onEditPressed,
  });

  IconData getFavoriteIconData() {
    if (product.isFavorite) {
      return Icons.favorite_outlined;
    } else {
      return Icons.favorite_outline;
    }
  }

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final ValueChanged<ProductModel> onProductEdited = (newProduct) => setState(() {
      widget.product = newProduct;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.title),
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
                      widget.product.imageUri,
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      widget.product.title,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                    Text(
                      "${widget.product.cost}₽",
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      widget.product.subtitle,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            // const Spacer(),

            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      widget.onLikeClicked();
                    },
                    icon: Icon(widget.getFavoriteIconData(),
                      color: widget.product.isFavorite ? Colors.red : Colors.white,
                      shadows: const <Shadow>[Shadow(color: Colors.black, blurRadius: 5.0)],
                    ),
                ),
                const Spacer(),
                ButtonTheme(
                  minWidth: 300,
                  child: OutlinedButton(
                      onPressed: () {
                        widget.onInCartPressed();
                      },
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: const Size(100,50),
                          backgroundColor: const Color.fromRGBO(182, 247, 143, 1),
                          side: const BorderSide(color: const Color.fromRGBO(182, 247, 143, 1))
                      ),
                      child: const Text("В корзину"),
                  ),

                ),
                const Spacer(),
                OutlinedButton(
                    onPressed: () {
                      widget.onDeleteClicked();
                      if (widget.product.id != null) {
                        deleteProduct(widget.product.id!);
                      }
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(100,50),
                        backgroundColor: const Color.fromRGBO(182, 247, 143, 1),
                        side: const BorderSide(color: const Color.fromRGBO(182, 247, 143, 1))
                    ),
                    child: const Text("Удалить")
                ),
                const Spacer(),
                OutlinedButton(
                    onPressed: () {
                      widget.onEditPressed(onProductEdited);
                    },
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(100,50),
                        backgroundColor: const Color.fromRGBO(182, 247, 143, 1),
                        side: const BorderSide(color: const Color.fromRGBO(182, 247, 143, 1))
                    ),
                    child: const Text("Ред.")
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}