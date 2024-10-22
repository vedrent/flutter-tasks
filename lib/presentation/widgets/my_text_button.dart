import 'package:flutter/material.dart';
import 'package:task_5/res/sizes.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.width,
    this.height,
  });

  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) =>
            Theme.of(context).colorScheme.primary
          ),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(radiusMedium)
            ))),
        child: SizedBox(
          width: width,
            height: height,
            child: Center(
              child: Text(
                  text,
                  style: textStyle?.copyWith(
                      color: Theme.of(context).colorScheme.background
                  )
              ),
            ),
          ),
      );
  }
}
