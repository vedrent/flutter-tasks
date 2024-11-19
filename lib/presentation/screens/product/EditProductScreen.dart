import 'package:flutter/material.dart';
import 'package:task_5/presentation/models/ProductModel.dart';
import 'package:task_5/presentation/widgets/NumericFieldWidget.dart';
import 'package:task_5/presentation/widgets/TextFieldWidget.dart';

import '../../../data/ProductsService.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({
    super.key,
    required this.productModel,
    required this.onProductEdited
  });

  final ProductModel productModel;
  final ValueChanged<ProductModel> onProductEdited;

  @override
  State<EditProductScreen> createState() => _EditProductScreenState(
      productModel: productModel,
      onProductEdited: onProductEdited,
  );
}

class _EditProductScreenState extends State<EditProductScreen> {

  // void onProductEdited() {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) => EditProductScreen(
  //       productModel: productModel
  //   )));
  // }
  final ProductModel productModel;
  final ValueChanged<ProductModel> onProductEdited;

  _EditProductScreenState({
    required this.productModel,
    required this.onProductEdited,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Редактирование продукта"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFieldWidget(
                onChanged: (text) { productModel.title = text; },
                hintText: "Название",
                initialValue: productModel.title,
            ),
            TextFieldWidget(
                onChanged: (text) { productModel.subtitle = text; },
                hintText: "Описание",
                initialValue: productModel.subtitle,
            ),
            NumericFieldWidget(
                onChanged: (text) {
                  try {
                    productModel.cost = double.parse(text);
                  }
                  catch(e) {
                    productModel.cost = 0;
                  }
                },
                hintText: "Стоимость",
                initialValue: productModel.cost,
            ),
            TextFieldWidget(
                onChanged: (text) { productModel.imageUri = text; },
                hintText: "Ссылка на изображение",
                initialValue: productModel.imageUri,
            ),

            const Spacer(),
            OutlinedButton(
                onPressed: () {
                  updateProduct(productModel);
                  onProductEdited(productModel);

                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(300,50),
                    backgroundColor: const Color.fromRGBO(182, 247, 143, 1),
                    side: const BorderSide(color: const Color.fromRGBO(182, 247, 143, 1))
                ),
                child: const Text(
                  "Подтвердить",
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                )
            ),
          ],
        ),
      ),
    );
  }
}