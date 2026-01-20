import 'package:hilo_ca_integration/cores/theme/colors.dart';
import 'package:hilo_ca_integration/cores/values/dimens.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';

/// VerySmall - [AppDimens.sizeTextSmaller] = 12
/// Small - [AppDimens.sizeTextSmall] = 14
/// Medium - [AppDimens.sizeTextMediumTb] = 16
/// Large - [AppDimens.sizeTextLarge] = 20
///
/// body - [FontWeight.normal] = w400
/// title - [FontWeight.bold] = w700

// Có thể bổ sung
enum StyleEnum {
  bodyVerySmall,
  bodySmall,
  bodyMedium,
  bodyLarge,
  titleVerySmall,
  titleSmall,
  titleMedium,
  titleLarge,
  titleSupperLarge,

  /// Medium, bold
  subBold,
}

class TextUtils extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final double? wordSpacing;
  final StyleEnum? availableStyle;
  final int? maxLine;
  final TextAlign? textAlign;
  final TextStyle? customStyle;
  final FontStyle? fontStyle;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;
  final bool isHtml;

  const TextUtils({
    super.key,
    required this.text,
    this.size,
    this.fontWeight,
    this.color,
    this.wordSpacing,
    this.availableStyle,
    this.maxLine,
    this.textAlign,
    this.customStyle,
    this.fontStyle,
    this.textOverflow,
    this.textDecoration,
    this.isHtml = false,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle style = GoogleFonts.openSans().copyWith(
      fontSize: size ?? AppDimens.sizeTextMediumTb,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.colorTitleAppbar,
      wordSpacing: wordSpacing,
      overflow: TextOverflow.ellipsis,
      fontStyle: fontStyle ?? FontStyle.normal,
      decoration: textDecoration ?? TextDecoration.none,
      decorationColor: AppColors.colorBlueX,
      decorationThickness: 2,
    );

    if (availableStyle != null) {
      switch (availableStyle!) {
        case StyleEnum.bodyVerySmall:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextSmaller,
          );
          break;
        case StyleEnum.bodySmall:
          style = style.copyWith(
            fontSize: AppDimens.sizeText14,
          );
          break;
        case StyleEnum.bodyMedium:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextMediumTb,
          );
          break;
        case StyleEnum.bodyLarge:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextLarge,
          );
          break;
        case StyleEnum.titleVerySmall:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextSmaller,
            fontWeight: FontWeight.bold,
          );
          break;
        case StyleEnum.titleSmall:
          style = style.copyWith(
            fontSize: AppDimens.sizeText14,
            fontWeight: FontWeight.bold,
          );
          break;
        // case StyleEnum.titleSmall:
        //   style = style.copyWith(
        //     fontSize: AppDimens.sizeText14,
        //     fontWeight: FontWeight.bold,
        //   );
        //   break;
        case StyleEnum.titleMedium:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextMediumTb,
            fontWeight: FontWeight.bold,
          );
          break;
        case StyleEnum.titleLarge:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextLarge,
            fontWeight: FontWeight.bold,
          );
          break;
        case StyleEnum.titleSupperLarge:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextSupperLarge,
            fontWeight: FontWeight.bold,
          );
          break;
        case StyleEnum.subBold:
          style = style.copyWith(
            fontSize: AppDimens.sizeTextMediumTb,
            fontWeight: FontWeight.bold,
          );
          break;
      }
    }
    if (isHtml) {
      return HtmlWidget(
        text,
        textStyle: customStyle ?? style,
        onTapUrl: (p0) {
          print(p0);
          return true;
        },
      );
    }
    return Text(
      text.tr,
      style: customStyle ?? style,
      maxLines: maxLine ?? 1,
      textAlign: textAlign,
      overflow: textOverflow,
      softWrap: true,
    );
  }
}
