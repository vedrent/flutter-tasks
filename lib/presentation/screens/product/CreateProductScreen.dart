import 'package:flutter/material.dart';
import 'package:task_5/presentation/models/ProductModel.dart';
import 'package:task_5/presentation/widgets/NumericFieldWidget.dart';
import 'package:task_5/presentation/widgets/TextFieldWidget.dart';

class CreateProductScreen extends StatefulWidget {
  const CreateProductScreen({super.key, required this.onProductCreated});

  final ValueChanged<ProductModel?> onProductCreated;

  @override
  State<CreateProductScreen> createState() => _CreateProductScreenState(
      onProductCreated: onProductCreated
  );
}

class _CreateProductScreenState extends State<CreateProductScreen> {
  String title = "";
  String subtitle = "";
  double price = 0;
  String imageLink = "";

  final ValueChanged<ProductModel?> onProductCreated;

  _CreateProductScreenState({
    required this.onProductCreated
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Создание продукта"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFieldWidget(
                onChanged: (text) { title = text; },
                hintText: "Название"
            ),
            TextFieldWidget(
                onChanged: (text) { subtitle = text; },
                hintText: "Описание"
            ),
            NumericFieldWidget(
                onChanged: (text) {
                  try {
                    price = double.parse(text);
                  }
                  catch(e) {
                    price = 0;
                  }
                },
                hintText: "Стоимость"
            ),
            TextFieldWidget(
                onChanged: (text) { imageLink = text; },
                hintText: "Ссылка на изображение"
            ),

            const Spacer(),
            OutlinedButton(
                onPressed: () {
                  onProductCreated(
                      ProductModel(
                          null,
                          title,
                          subtitle,
                          imageLink,
                          price,
                          false
                      )
                  );
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
                  "Добавить",
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                )
            ),
          ],
        ),
      ),
    );
  }
}