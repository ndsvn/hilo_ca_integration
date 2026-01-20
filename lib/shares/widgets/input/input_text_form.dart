import 'package:hilo_ca_integration/cores/theme/theme.src.dart';
import 'package:flutter/material.dart';

import '../../../cores/values/values.src.dart';
import '../../shares_src.dart';

class BuildInputText extends StatefulWidget {
  final InputTextModel inputTextFormModel;

  const BuildInputText(this.inputTextFormModel, {super.key});

  @override
  BuildInputTextState createState() => BuildInputTextState();
}

class BuildInputTextState extends State<BuildInputText> with FormatterEnum {
  final RxBool _isShowButtonClear = false.obs;
  final RxBool _showPassword = false.obs;
  final RxBool _hasFocus = false.obs;

  @override
  void initState() {
    widget.inputTextFormModel.controller.addListener(() {
      if (widget.inputTextFormModel.controller.text.isNotEmpty) {
        _isShowButtonClear.value = true;
      }
    });
    _showPassword.value = widget.inputTextFormModel.obscureText;
    super.initState();
  }

  Widget? _suffixIconSearch() {
    return IconButton(
      onPressed: _isShowButtonClear.value
          ? () {
              widget.inputTextFormModel.controller.clear();
              widget.inputTextFormModel.onChanged?.call('');
              _isShowButtonClear.value = false;
            }
          : widget.inputTextFormModel.functionSearch,
      icon: _isShowButtonClear.value
          ? SvgPicture.asset(Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_CANCEL_SVG)
          : SvgPicture.asset(
              Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_SEARCH_SVG),
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(),
    );
  }

  Widget? _suffixIcon() {
    if (widget.inputTextFormModel.suffixIcon != null) {
      return widget.inputTextFormModel.suffixIcon;
    }
    if (!_isShowButtonClear.value || widget.inputTextFormModel.isReadOnly) {
      return null;
    }
    return widget.inputTextFormModel.obscureText
        ? IconButton(
            onPressed: () {
              _showPassword.toggle();
            },
            icon: SvgPicture.asset(
              _showPassword.value
                  ? Assets.ASSETS_ECERT_EYE_OFF_FILL_SVG
                  : Assets.ASSETS_ECERT_EYE_FILL_SVG,
              width: 24,
              height: 24,
            )).paddingOnly(right: AppDimens.paddingSmallest)
        : Visibility(
            visible: _isShowButtonClear.value &&
                !widget.inputTextFormModel.isReadOnly,
            child: IconButton(
              onPressed: () {
                widget.inputTextFormModel.controller.clear();
                widget.inputTextFormModel.onChanged?.call('');
                _isShowButtonClear.value = false;
              },
              icon: SvgPicture.asset(
                Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_CLEAR_SVG,
                width: 15,
                height: 15,
                colorFilter: ColorFilter.mode(
                  AppColors.hintTextColor(),
                  BlendMode.srcIn,
                ),
              ),
            ),
          ).paddingOnly(right: AppDimens.paddingSmallest);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Focus(
        onFocusChange: (hasFocus) async {
          _hasFocus.value = hasFocus;
        },
        child: TextFormField(
          maxLines: widget.inputTextFormModel.maxLines,
          inputFormatters: getFormatters(widget.inputTextFormModel),
          validator: widget.inputTextFormModel.validator,
          autovalidateMode: widget.inputTextFormModel.autovalidateMode ??
              AutovalidateMode.onUserInteraction,
          onChanged: (v) {
            if (!_isShowButtonClear.value || v.isEmpty) {
              _isShowButtonClear.value = v.isNotEmpty;
            }
            widget.inputTextFormModel.onChanged?.call(v);
          },
          textInputAction: widget.inputTextFormModel.iconNextTextInputAction,
          style: TextStyle(
              fontSize:
                  widget.inputTextFormModel.textSize ?? AppDimens.fontSmall(),
              fontWeight:
                  widget.inputTextFormModel.fontWeight ?? FontWeight.w600,
              color:
                  widget.inputTextFormModel.textColor ?? AppColors.textColor()),
          controller: widget.inputTextFormModel.controller,
          obscureText: _showPassword.value,
          onTap: widget.inputTextFormModel.onTap,
          enabled: widget.inputTextFormModel.enable,
          autofocus: widget.inputTextFormModel.autoFocus,
          focusNode: widget.inputTextFormModel.currentNode,
          keyboardType: widget.inputTextFormModel.textInputType,
          readOnly: widget.inputTextFormModel.isReadOnly,
          maxLength: widget.inputTextFormModel.maxLengthInputForm,
          textAlign: widget.inputTextFormModel.textAlign ?? TextAlign.left,
          onFieldSubmitted: (v) {
            if (widget.inputTextFormModel.iconNextTextInputAction.toString() ==
                TextInputAction.next.toString()) {
              FocusScope.of(context)
                  .requestFocus(widget.inputTextFormModel.nextNode);

              widget.inputTextFormModel.onNext?.call(v);
            } else {
              widget.inputTextFormModel.submitFunc?.call(v);
            }
          },
          decoration: createInputDecoration(),
          onEditingComplete: widget.inputTextFormModel.onEditingComplete,
        ),
      ),
    );
  }

  InputDecoration createInputDecoration() {
    return InputDecoration(
      counterText: widget.inputTextFormModel.isShowCounterText ? null : '',
      filled: true,
      isDense: widget.inputTextFormModel.isDense,
      constraints: BoxConstraints(
        maxHeight: widget.inputTextFormModel.maxLines == 1
            ? AppDimens.sizeInput
            : double.infinity,
      ),
      fillColor: widget.inputTextFormModel.fillColor ?? AppColors.colorGreyBody,
      hintStyle: TextStyle(
          fontSize:
              widget.inputTextFormModel.hintTextSize ?? AppDimens.fontSmall(),
          color: widget.inputTextFormModel.hintTextColor ??
              AppColors.hintTextColor(),
          fontWeight: FontWeight.normal),
      hintText: widget.inputTextFormModel.hintText,
      errorStyle: TextStyle(
        color:
            widget.inputTextFormModel.errorTextColor ?? AppColors.errorText(),
      ),
      prefix: widget.inputTextFormModel.iconLeading != null
          ? Icon(
              widget.inputTextFormModel.iconLeading,
              color: widget.inputTextFormModel.prefixIconColor ??
                  AppColors.hintTextColor(),
              size: 20,
            )
          : null,
      prefixIcon: widget.inputTextFormModel.iconLeadingSVG != null
          ? IconButton(
              padding: const EdgeInsets.all(0.0),
              constraints: const BoxConstraints(),
              onPressed: () {},
              icon: SvgPicture.asset(
                widget.inputTextFormModel.iconLeadingSVG ?? "",
                width: 20,
                height: 20,
              ).paddingOnly(
                top: AppDimens.paddingSmall,
                bottom: AppDimens.paddingSmall,
                left: AppDimens.defaultPadding,
                right: AppDimens.paddingVerySmall,
              ),
            )
          : null,
      prefixStyle:
          const TextStyle(color: Colors.red, backgroundColor: Colors.white),
      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(widget.inputTextFormModel.borderRadius),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(widget.inputTextFormModel.borderRadius),
        borderSide: BorderSide(
            color: widget.inputTextFormModel.colordisabledBorder ??
                AppColors.colorFill),
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(widget.inputTextFormModel.borderRadius),
          borderSide:
              BorderSide(color: widget.inputTextFormModel.colorFocusedBorder)),
      enabledBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(widget.inputTextFormModel.borderRadius),
          borderSide: BorderSide(
              color: widget.inputTextFormModel.colorBorder ??
                  AppColors.colorFill)),
      contentPadding: widget.inputTextFormModel.contentPadding ??
          const EdgeInsets.symmetric(
            vertical: AppDimens.paddingSmall,
            horizontal: AppDimens.defaultPadding,
          ),
      suffixIcon: widget.inputTextFormModel.isSearch
          ? _suffixIconSearch()
          : _suffixIcon(),
      suffixIconConstraints: const BoxConstraints(maxHeight: 100),
      floatingLabelBehavior: widget.inputTextFormModel.floatingLabelBehavior,
      floatingLabelStyle: widget.inputTextFormModel.floatingLabelStyle,
    );
  }
}
