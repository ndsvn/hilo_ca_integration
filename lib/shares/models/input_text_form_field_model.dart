import 'package:ecert/cores/theme/theme.src.dart';
import 'package:flutter/material.dart';

class InputTextModel {
  final IconData? iconLeading;

  final String? iconLeadingSVG;

  final String? hintText;

  final TextEditingController controller;

  final FocusNode? currentNode;

  final FocusNode? nextNode;

  final bool obscureText;

  final double borderRadius;

  final TextInputAction iconNextTextInputAction;

  final ValueChanged<String>? submitFunc;

  final ValueChanged<String>? onNext;

  FormFieldValidator<String>? validator;

  /// 0 : LengthLimitingText. Giới hạn ký tự nhập(nếu có)
  /// 1 : digitsOnly. Chỉ nhập số
  /// 2 : TaxCode. Kiểu nhập là mã số thuế
  /// 3 : Không cho nhập các ký tự đặc biệt. dấu cách
  /// 4 : Nhập giá trị tiền
  /// 5 : Cho phép nhập giá trị âm
  final int inputFormatters;

  final TextInputType textInputType;

  /// The [lengthLimit] must be null, -1 or greater than zero. If it is null or -1
  /// then no limit is enforced.
  final int? maxLengthInputForm;

  final bool isReadOnly;

  final bool autoFocus;

  Color? fillColor;

  final Color? textColor;

  final Color? hintTextColor;

  final double? hintTextSize;

  final double? textSize;

  final Color? prefixIconColor;

  final Color? errorTextColor;

  final Color? suffixColor;

  final ValueChanged<String>? onChanged;

  final int? maxLines;

  final Widget? suffixIcon;

  final TextAlign? textAlign;

  bool isShowCounterText;

  final bool enable;

  final String? labelText;

  final VoidCallback? onTap;

  final EdgeInsetsGeometry? contentPadding;

  final TextStyle? labelStyle;

  final FloatingLabelBehavior? floatingLabelBehavior;

  final TextStyle? floatingLabelStyle;

  final Color? colorBorder;

  final Color? colordisabledBorder;

  final Color colorFocusedBorder;

  bool? isDense;

  bool isSearch;

  VoidCallback? functionSearch;

  VoidCallback? onEditingComplete;

  final BorderSide? borderSide;

  FontWeight? fontWeight;

  AutovalidateMode? autovalidateMode;

  InputTextModel({
    this.iconLeading,
    this.iconLeadingSVG,
    this.hintText,
    required this.controller,
    this.currentNode,
    this.submitFunc,
    this.nextNode,
    this.obscureText = false,
    this.iconNextTextInputAction = TextInputAction.next,
    this.onNext,
    this.validator,
    this.inputFormatters = 0,
    this.borderRadius = 10.0,
    this.textInputType = TextInputType.text,
    this.maxLengthInputForm,
    this.isReadOnly = false,
    this.autoFocus = false,
    this.fillColor,
    this.textColor,
    this.hintTextColor,
    this.hintTextSize,
    this.textSize,
    this.prefixIconColor,
    this.errorTextColor,
    this.suffixColor,
    this.onChanged,
    this.maxLines = 1,
    this.suffixIcon,
    this.isShowCounterText = true,
    this.textAlign,
    this.enable = true,
    this.contentPadding,
    this.labelText,
    this.onTap,
    this.labelStyle,
    this.floatingLabelBehavior,
    this.floatingLabelStyle,
    this.colorBorder,
    this.colordisabledBorder,
    this.isDense = false,
    this.isSearch = false,
    this.colorFocusedBorder = AppColors.colorsOrange,
    this.functionSearch,
    this.onEditingComplete,
    this.borderSide,
    this.fontWeight,
    this.autovalidateMode,
  });
}
