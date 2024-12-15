import 'package:flutter/material.dart';
import 'package:task_5/presentation/widgets/NumericFieldWidget.dart';

Future<Map<String, double>> filterModalScreenBuilder(
    BuildContext context, {
      required double minPrice,
      required double maxPrice
    }) async {

  return await showDialog<Map<String, double>>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Фильтр по цене'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NumericFieldWidget(
                initialValue: minPrice,
                onChanged: (value) => minPrice = double.parse(value),
                hintText: "От"
            ),
            NumericFieldWidget(
                initialValue: maxPrice,
                onChanged: (value) => maxPrice = double.parse(value),
                hintText: "До"
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Отмена'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          OutlinedButton(
              onPressed: () {
                Navigator.pop(context, {
                  "minPrice": minPrice,
                  "maxPrice": maxPrice,
                });
              },
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(150,40),
                  backgroundColor: const Color.fromRGBO(182, 247, 143, 1),
                  side: const BorderSide(color: const Color.fromRGBO(182, 247, 143, 1))
              ),
              child: const Text("Поиск")
          ),
        ],
      );
    },
  ) ?? <String, double>{};
}