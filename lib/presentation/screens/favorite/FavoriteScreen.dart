import 'package:flutter/material.dart';
import 'package:task_5/data/ProductsService.dart';
import 'package:task_5/data/CartService.dart';
import 'package:task_5/data/FavoriteService.dart';
// import 'package:task_5/presentation/models/CartItemModel.dart';
// import 'package:task_5/data/CartItemData.dart';
import '../../widgets/ProductWidget.dart';
import '../product/ProductDetailsScreen.dart';
import 'package:task_5/presentation/screens/product/EditProductScreen.dart';

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
    getFavorites().then((value) => setState(() {
      products = value;
    }));
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
                        deleteProductFromCart(product);
                        setState(() {
                          products.remove(product);
                          sharedProducts.remove(product);
                        });
                      }, onInCartPressed: () {
                        increaseCartItemCount(product.id);
                      },
                      onEditPressed: (onEdited) {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => EditProductScreen(
                              onProductEdited: (newProduct) {
                                onEdited(newProduct);
                                var productsFuture = getProducts();
                                productsFuture.then((value) =>
                                    setState(() {
                                      products = value;
                                    })
                                );
                                setState(() {
                                  sharedProducts[index] = newProduct;
                                });
                              },
                              productModel: product,
                            )
                        ));
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
      ),
    );
  }
}