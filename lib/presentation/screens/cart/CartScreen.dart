import 'package:flutter/material.dart';
import 'package:task_5/data/ProductsService.dart';
import 'package:task_5/presentation/models/CartItemModel.dart';
import 'package:task_5/presentation/screens/product/ProductDetailsScreen.dart';
import 'package:task_5/presentation/widgets/CartItem.dart';
// import 'package:task_5/data/CartItemData.dart';
import 'package:task_5/presentation/screens/product/EditProductScreen.dart';
import 'package:task_5/data/CartService.dart';
import 'BottomBar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItemModel> items = [];

  @override
  void initState() {
    super.initState();
    var futureCarts = getCart();
    futureCarts.then((value) => {
      setState(() {
        items.addAll(value);
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = items[index];
                  var product = sharedProducts.firstWhere((element) => item.id == element.id);

                  return CartItem(
                    item: item,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            product: product,
                            onDeleteClicked: () {
                              setState(() {
                                items.remove(item);
                                deleteCartItem(item);
                                sharedProducts.removeWhere((element) => element.id == item.id);
                              });
                            },
                            onInCartPressed: () {},
                            onEditPressed: (onEdited) {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => EditProductScreen(
                                    onProductEdited: (newProduct) {
                                      onEdited(newProduct);
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
                    onCountChanged: (int value) {
                      setState(() {
                        item.count = value;
                      });
                    },
                    deleteItem: () {
                      setState(() {
                        items.remove(item);
                      });
                    },
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: CartBottomBar(
                totalPrice: sumPrices(),
                totalCount: getCartTotalCount(),
              ),
            ),
          ],
        )
    );
  }

  int getCartTotalCount() {
    int count = 0;

    for (int i = 0; i < items.length; i++) {
      count = count + items[i].count;
    }
    return count;
  }

  double sumPrices() {
    double sum = 0;

    for (int i = 0; i < items.length; i++) {
      sum += items[i].cost * items[i].count;
    }
    return sum;
  }
}