import 'package:flutter/material.dart';
import 'package:task_5/data/ProductsService.dart';
import 'package:task_5/data/CartService.dart';
import 'package:task_5/presentation/models/ProductModel.dart';
import 'package:task_5/presentation/screens/product/CreateProductScreen.dart';
import 'package:task_5/presentation/screens/product/ProductDetailsScreen.dart';
import 'package:task_5/presentation/screens/product/FilterModalScreen.dart';
import 'package:task_5/presentation/screens/product/EditProductScreen.dart';
import 'package:task_5/presentation/widgets/ProductWidget.dart';
import 'package:task_5/presentation/widgets/TextFieldWidget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<ProductModel> products = [];
  List<ProductModel> allProducts = [];
  var searchString = "";
  double minPrice = 0;
  double maxPrice = 999999;

  @override
  void initState() {
    super.initState();
    var futureProducts = initializeProducts();
    futureProducts.then((value) => {
      setState(() {
        products.addAll(value);
        allProducts = value;
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      initialValue: searchString,
                      onChanged: (value) {
                        setState(() {
                          searchString = value;
                        });
                      },
                      hintText: "Поиск товара",
                    ),
                  ),
                  const Icon(Icons.search, size: 30),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  PopupMenuButton<String>(
                    child: Container(
                      constraints: const BoxConstraints(
                        minWidth: 190,
                        minHeight: 40,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(182, 247, 143, 1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromRGBO(182, 247, 143, 1),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.sort, size: 30),
                          Text("Сортировка",
                              style: TextStyle(fontSize: 18, color: Colors.black)),
                        ],
                      ),
                    ),
                    onSelected: (value) {
                      handleSorting(value);
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: "titleAsc",
                        child: Text('По названию (А-Я)'),
                      ),
                      const PopupMenuItem<String>(
                        value: "titleDesc",
                        child: Text('По названию (Я-А)'),
                      ),
                      const PopupMenuItem<String>(
                        value: "priceAsc",
                        child: Text('Дешевле'),
                      ),
                      const PopupMenuItem<String>(
                        value: "priceDesc",
                        child: Text('Дороже'),
                      ),
                    ],
                  ),
                  const Spacer(),
                  OutlinedButton(
                      onPressed: openFilterDialog,
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          minimumSize: const Size(190,40),
                          backgroundColor: const Color.fromRGBO(182, 247, 143, 1),
                          side: const BorderSide(color: const Color.fromRGBO(182, 247, 143, 1))
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.filter_alt_outlined, size: 30),
                          Text("Фильтр", style: TextStyle(fontSize: 18)),
                        ],
                      )
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
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
                          builder: (context) => ProductDetailScreen(
                            product: products[index],
                            onDeleteClicked: () {
                              setState(() {
                                products.remove(product);
                                deleteProductFromCart(product);
                                sharedProducts.remove(product);
                              });
                            }, onInCartPressed: () {
                            increaseCartItemCount(product.id!);
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
          ],
        ),
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
  void openFilterDialog() async {
    final result = await filterModalScreenBuilder(
      context,
      minPrice: minPrice,
      maxPrice: maxPrice,
    );
    if (result.isNotEmpty) {
      minPrice = result["minPrice"]!;
      maxPrice = result["maxPrice"]!;
      setState(() {
        products = filterProducts();
      });
    }
  }

  List<ProductModel> filterProducts() {
    return allProducts.where((product) {
      bool priceMatches = product.cost >= minPrice && product.cost <= maxPrice;
      bool searchMatches = product.title.toLowerCase().contains(searchString.toLowerCase()) ||
          product.subtitle.toLowerCase().contains(searchString.toLowerCase());
      return priceMatches && searchMatches;
    }).toList();
  }

  void handleSorting(String sortString) {
    setState(() {
      switch(sortString) {
        case "priceAsc":
          products.sort((a, b) => a.cost.compareTo(b.cost));
          break;
        case "priceDesc":
          products.sort((a, b) => b.cost.compareTo(a.cost));
          break;
        case "titleAsc":
          products.sort((a, b) => a.title.compareTo(b.title));
          break;
        case "titleDesc":
          products.sort((a, b) => b.title.compareTo(a.title));
          break;
      }
    });
  }
}