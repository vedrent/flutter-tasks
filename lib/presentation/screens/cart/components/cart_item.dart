import 'package:flutter/material.dart';
import 'package:task_5/presentation/screens/cart/models/cart_item_model.dart';
import 'package:task_5/res/sizes.dart';

import '../../../widgets/svg_icon_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.model,
    required this.onMinusPressed,
    required this.onPlusPressed,
  });

  final CartItemModel model;
  final VoidCallback onMinusPressed;
  final VoidCallback onPlusPressed;

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
              SvgIconButton(
                size: iconSizeSmall,
                iconPath: "lib/assets/icons/delete.svg",
                onPressed: () {},
              ),
            ],
          ),

          const SizedBox(height: 34,),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${model.price} ₽",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const Spacer(),
              
              Text("${model.patientsNumber} пациент"),
              const SizedBox(width: spacingSmall),

              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Container(
                    width: 64,
                    height: 32,
                    color: const Color(0xFFF5F5F9),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        children: [
                          SvgIconButton(
                            size: iconSizeSmall,
                            onPressed: onMinusPressed,
                            iconPath: "lib/assets/icons/minus.svg",
                          ),

                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 2),
                            child: VerticalDivider(
                              width: 1,
                              color: Color(0xFFEBEBEB),
                            ),
                          ),
                          const Spacer(),

                          SvgIconButton(
                            size: iconSizeSmall,
                            onPressed: onPlusPressed,
                            iconPath: "lib/assets/icons/plus.svg",
                          ),
                        ],
                      )
                    )
                ),
              )
            ],
          )
        ],
      )
    );
  }
}
