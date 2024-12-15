import 'package:flutter/material.dart';
import 'package:task_5/data/FavoriteService.dart';
import 'package:task_5/data/OrdersService.dart';
import 'package:task_5/presentation/models/OrderModel.dart';
import 'package:task_5/presentation/models/ProductModel.dart';
import 'package:task_5/presentation/screens/product/EditProductScreen.dart';
import 'package:task_5/presentation/screens/product/ProductDetailsScreen.dart';
import 'package:task_5/presentation/widgets/ProductWidget.dart';

class OrderDetailsScreen extends StatefulWidget {
  final OrderModel order;
  const OrderDetailsScreen({
    super.key,
    required this.order
  });

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  List<ProductModel> items = [];

  @override
  void initState() {
    getOrderItems(widget.order).then((value) => setState(() {
      items = value;
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            children: [
              Text("Заказ")
            ],
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: (1 / 1.7)),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = items[index];
                  return ProductWidget(
                    product: item,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            product: item,
                            onDeleteClicked: () {
                              setState(() {
                                items.remove(item);
                              });
                            },
                            onInCartPressed: () {},
                            onEditPressed: (onEdited) {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => EditProductScreen(
                                    onProductEdited: (newProduct) {
                                      onEdited(newProduct);
                                      // setState(() {
                                      //   sharedProducts[index] = newProduct;
                                      // });
                                    },
                                    productModel: item,
                                  )
                              ));
                            },
                          ),
                        ),
                      );
                    }, onLikeClicked: () {
                    likeProduct(item.id!);
                  },
                  );
                },
              ),
            ),
          ],
        )
    );
  }
}