import 'package:flutter/material.dart';

class InputLabelModel {
  final String label;

  final bool isValidate;

  final TextStyle? labelTextStyle;

  final EdgeInsetsGeometry? paddingLabel;

  final double? padding;

  InputLabelModel({
    required this.label,
    this.isValidate = false,
    this.labelTextStyle,
    this.paddingLabel,
    this.padding,
  });
}
