import 'package:flutter/material.dart';
import 'package:task_5/presentation/screens/home/components/service_item.dart';

import '../../../../res/sizes.dart';
import '../models/service_model.dart';

class ServicesList extends StatelessWidget {
  ServicesList({super.key});

  List<ServiceModel> items = [
    ServiceModel(
        "ПЦР-тест на определение РНК коронавируса стандартный",
        1800,
        "2 дня"
    ),
    ServiceModel(
        "Клинический анализ крови с лейкоцитарной формулировкой",
        690,
        "1 день"
    ),
    ServiceModel(
        "Биохимический анализ крови, базовый",
        2440,
        "1 день"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              if (index > 0)
                const SizedBox(height: spacingSmall,),
              ServiceItem(
                model: items[index],
                onAddClick: () {},
              )
            ],
          );
        }
    );
  }
}
