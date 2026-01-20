// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../cores/cores_src.dart';

class CardWidgets extends StatelessWidget {
  final Widget child;
  final Color? colorBorder;
  final Color? backgroundColor;
  final BoxDecoration? decoration;
  final double? height;
  final double? width;
  final double? radius;

  const CardWidgets({
    super.key,
    required this.child,
    this.colorBorder,
    this.backgroundColor,
    this.decoration,
    this.height,
    this.width,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: decoration ??
          BoxDecoration(
            color: backgroundColor ?? AppColors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(
                radius ?? AppDimens.radius8,
              ),
            ),
            border: Border.all(
              color: colorBorder ?? Colors.transparent,
            ),
          ),
      child: child,
    );
  }
}
