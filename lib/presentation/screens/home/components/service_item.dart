import 'package:flutter/material.dart';
import 'package:task_5/presentation/widgets/my_text_button.dart';
import 'package:task_5/res/sizes.dart';

import '../models/service_model.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({
    super.key,
    required this.model,
    required this.onAddClick,
  });

  final ServiceModel model;
  final VoidCallback onAddClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(spacingSmall),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: const BorderRadius.all(radiusMedium)
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  model.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),

          const SizedBox(height: spacingSmall),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.daysNumberText,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    "${model.price} ₽",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              const Spacer(),

              MyTextButton(
                text: "Добавить",
                onPressed: onAddClick,
                textStyle: Theme.of(context).textTheme.bodySmall,
                width: 96,
              )
            ],
          )
        ],
      )
    );
  }
}
