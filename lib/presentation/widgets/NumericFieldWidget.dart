import 'package:flutter/material.dart';

class NumericFieldWidget extends StatefulWidget {
  const NumericFieldWidget({
    super.key,
    required this.onChanged,
    required this.hintText
  });

  final ValueChanged<String>? onChanged;
  final String hintText;

  @override
  State<NumericFieldWidget> createState() => _NumericFieldWidgetState(
      onChanged: onChanged,
      hintText: hintText
  );
}

class _NumericFieldWidgetState extends State<NumericFieldWidget> {
  final ValueChanged<String>? onChanged;
  final String hintText;

  _NumericFieldWidgetState({
    required this.onChanged,
    required this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return
      TextField(
        keyboardType: TextInputType.number,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: hintText
        ),
      );
  }
}