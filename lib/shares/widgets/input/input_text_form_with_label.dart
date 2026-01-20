import 'package:hilo_ca_integration/assets/assets.src.dart';
import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/material.dart';

class BuildInputTextWithLabel extends StatelessWidget {
  final InputLabelModel inputLabelModel;
  final InputTextModel inputTextFormModel;

  const BuildInputTextWithLabel({
    super.key,
    required this.inputLabelModel,
    required this.inputTextFormModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: inputLabelModel.label.isNotEmpty,
          child: Padding(
            padding: inputLabelModel.paddingLabel ??
                const EdgeInsets.symmetric(horizontal: 0),
            child: Row(
              children: [
                Flexible(
                  child: TextUtils(
                    text: inputLabelModel.label.tr,
                    customStyle: inputLabelModel.labelTextStyle,
                    availableStyle: StyleEnum.titleSmall,
                    maxLine: 2,
                    color: AppColors.colorNeutral1,
                  ),
                ),
                TextUtils(
                  text: inputLabelModel.isValidate ? " *" : "",
                  availableStyle: StyleEnum.titleSmall,
                  maxLine: 2,
                  color: AppColors.colorRedAccent,
                ),
              ],
            ),
          ),
        ),
        UtilWidget.sizedBox5,
        BuildInputText(
          inputTextFormModel
            ..validator = inputTextFormModel.validator ??
                (val) {
                  if (!val.isNullOrEmpty) {
                    if (inputTextFormModel.inputFormatters ==
                            InputFormatterEnum.phoneNumber &&
                        !isPhoneValidate(value: val)) {
                      return AppStr.errorPhoneNumberType.tr;
                    }
                    if (inputTextFormModel.inputFormatters ==
                            InputFormatterEnum.email &&
                        !isEmail(val)) {
                      return AppStr.errorEmail.tr;
                    }
                    if (inputTextFormModel.inputFormatters ==
                            InputFormatterEnum.identity &&
                        !isIdentityCard(value: val)) {
                      return AppStr.errorIdentityCard.tr;
                    }
                    if (inputTextFormModel.inputFormatters ==
                            InputFormatterEnum.taxCode &&
                        !isTaxCode(taxCode: val)) {
                      return AppStr.errorTaxCodeCount.tr;
                    }
                  }
                  if (inputLabelModel.isValidate) {
                    if (val!.isNullOrEmpty) {
                      return inputLabelModel.label.tr + AppStr.inputEmpty.tr;
                    }
                    return null;
                  }
                  return null;
                },
        ).paddingOnly(
          top: inputTextFormModel.borderSide != null
              ? AppDimens.paddingSmallest
              : 0,
        ),
      ],
    );
  }
}
