import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/shares/shares_src.dart';
import 'package:flutter/material.dart';

class ImageWidget {
  static Widget imageSvg(
    String assetName, {
    final double? width,
    final double? height,
    final Color? color,
  }) {
    return SvgPicture.asset(
      assetName,
      fit: BoxFit.contain,
      height: height,
      colorFilter: color != null
          ? ColorFilter.mode(
              color,
              BlendMode.srcIn,
            )
          : null,
      width: width ?? AppDimens.paddingMediumMax,
    );
  }

  static Widget imageSvgIcon(
    String assetName, {
    final double? width,
    final double? height,
    final Color? color,
  }) {
    return SvgPicture.asset(
      assetName,
      fit: BoxFit.contain,
      height: height ?? AppDimens.iconMedium,
      colorFilter: color != null
          ? ColorFilter.mode(
              color,
              BlendMode.srcIn,
            )
          : null,
      width: width ?? AppDimens.iconMedium,
    );
  }

  static Widget imageAsset(
    String assetName, {
    final double? width,
    final double? height,
    final Color? color,
    final BoxFit? fit,
  }) {
    return Image.asset(
      assetName,
      fit: fit ?? BoxFit.contain,
      height: height,
      width: width ?? AppDimens.paddingMediumMax,
    );
  }
}
