import 'package:flutter/material.dart';

class NumericFieldWidget extends StatefulWidget {
  const NumericFieldWidget({
    super.key,
    required this.onChanged,
    required this.hintText,
    this.initialValue
  });

  final ValueChanged<String>? onChanged;
  final String hintText;
  final int? initialValue;

  @override
  State<NumericFieldWidget> createState() => _NumericFieldWidgetState(
      onChanged: onChanged,
      hintText: hintText,
      initialValue: initialValue
  );
}

class _NumericFieldWidgetState extends State<NumericFieldWidget> {
  final ValueChanged<String>? onChanged;
  final String hintText;
  final int? initialValue;

  _NumericFieldWidgetState({
    required this.onChanged,
    required this.hintText,
    this.initialValue
  });

  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
        initialValue: initialValue.toString(),
        keyboardType: TextInputType.number,
        onChanged: onChanged,
        decoration: InputDecoration(
            hintText: hintText
        ),
      );
  }
}