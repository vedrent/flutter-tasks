import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.onChanged,
    required this.hintText,
    this.initialValue
  });

  final ValueChanged<String>? onChanged;
  final String hintText;
  final String? initialValue;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState(
      onChanged: onChanged,
      hintText: hintText,
      initialValue: initialValue
  );
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final ValueChanged<String>? onChanged;
  final String hintText;
  final String? initialValue;

  _TextFieldWidgetState({
    required this.onChanged,
    required this.hintText,
    this.initialValue
  });

  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
        onChanged: onChanged,
        initialValue: initialValue,
        decoration: InputDecoration(
            hintText: hintText
        ),
        maxLines: null,
      );
  }
}