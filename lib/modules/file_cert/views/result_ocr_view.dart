import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/modules/file_cert/controller/result_ocr_controller.dart';
import 'package:ecert/shares/shares_src.dart';
import 'package:flutter/material.dart';

class ResultOcrView extends BaseGetWidget<ResultOcrController> {
  const ResultOcrView({super.key});

  @override
  ResultOcrController get controller => Get.put(ResultOcrController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: UtilWidget.buildAppBar(
        LocaleKeys.eCert_DKKD_titleResult.tr,
        isColorGradient: false,
        leading: true,
      ),
      body: Column(
        children: [
          _buildInfoOrg(),
          UtilWidget.sizedBox20,
          _buildButton(),
          UtilWidget.buildBottomPading(),
        ],
      ),
    );
  }

  Widget _buildInfoOrg() {
    return Expanded(
      child: SingleChildScrollView(
        child: UtilWidget.itemCard(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UtilWidget.sizedBox20,
                _buildInput(
                  label: LocaleKeys.eCert_register_transactionName.tr,
                  textEditingController: controller.nameController,
                  currentNode: controller.nameFocus,
                  nextNode: controller.taxCodeFocus,
                  textInputType: TextInputType.text,
                  validator: (value) {
                    if (value!.isNullOrEmpty) {
                      return LocaleKeys.eCert_register_validateName.tr;
                    }
                    return null;
                  },
                ),
                // _buildInput(
                //   label: LocaleKeys.eCert_register_codeRegister.tr,
                //   textEditingController: controller.codeController,
                //   textInputType: TextInputType.text,
                //   validator: (value) {
                //     if (value!.isNullOrEmpty) {
                //       return LocaleKeys.eCert_register_validateCodeRegister.tr;
                //     }
                //     return null;
                //   },
                //   currentNode: controller.codeFocus,
                //   nextNode: controller.taxCodeFocus,
                // ),
                _buildInput(
                  label: LocaleKeys.eCert_register_code.tr,
                  textEditingController: controller.taxCodeController,
                  // inputFormatters: InputFormatterEnum.taxCode,
                  validator: (value) {
                    if (value!.isNullOrEmpty) {
                      return LocaleKeys.eCert_register_validateCode.tr;
                    }
                    return null;
                  },
                  currentNode: controller.taxCodeFocus,
                  nextNode: controller.addressFocus,
                ),
                _buildInput(
                  label: LocaleKeys.eCert_register_addressOrg.tr,
                  textEditingController: controller.addressController,
                  validator: (value) {
                    if (value!.isNullOrEmpty) {
                      return LocaleKeys.eCert_register_validateAddress.tr;
                    }
                    return null;
                  },
                  currentNode: controller.addressFocus,
                  nextNode: controller.emailFocus,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextUtils(
                      text: LocaleKeys.eCert_register_addressHelp.tr,
                      availableStyle: StyleEnum.bodySmall,
                      fontStyle: FontStyle.italic,
                      color: AppColors.colorNeutral2,
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                _buildInput(
                  label: LocaleKeys.eCert_register_email.tr,
                  textEditingController: controller.emailController,
                  inputFormatters: InputFormatterEnum.email,
                  validator: (value) {
                    if (value!.isNullOrEmpty) {
                      return LocaleKeys.eCert_register_validateEmailContent.tr;
                    }
                    if (!isEmail(value)) {
                      return LocaleKeys.eCert_register_validateEmail.tr;
                    }
                    return null;
                  },
                  textInputType: TextInputType.emailAddress,
                  currentNode: controller.emailFocus,
                  nextNode: controller.phoneFocus,
                ),
                _buildInput(
                  label: LocaleKeys.eCert_register_phone.tr,
                  textEditingController: controller.phoneController,
                  inputFormatters: InputFormatterEnum.phoneNumber,
                  validator: (value) {
                    if (value!.isNullOrEmpty) {
                      return LocaleKeys.eCert_register_validatePhoneContent.tr;
                    }

                    return null;
                  },
                  currentNode: controller.phoneFocus,
                  nextNode: controller.ownerFullNameFocus,
                ),
                _buildInput(
                  label: LocaleKeys.eCert_register_representative.tr,
                  textEditingController: controller.ownerFullNameController,
                  validator: (value) {
                    if (value!.isNullOrEmpty) {
                      return LocaleKeys.eCert_register_validateName.tr;
                    }
                    return null;
                  },
                  currentNode: controller.ownerFullNameFocus,
                  nextNode: controller.ownerCitizenNumberFocus,
                ),

                _buildInput(
                  label: LocaleKeys.eCert_register_numberID.tr,
                  textEditingController:
                      controller.ownerCitizenNumberController,
                  inputFormatters: InputFormatterEnum.identity,
                  isValidate: true,
                  validator: (value) {
                    if (value!.isNullOrEmpty) {
                      return LocaleKeys.eCert_register_validateNumberID.tr;
                    }
                    return null;
                  },
                  currentNode: controller.ownerCitizenNumberFocus,
                  // nextNode: controller.ownerCitizenNumberFocus,
                ),
                // ItemTextWidget.buildItemText(
                //   LocaleKeys.eCert_register_numberID,
                //   AppInfoCert.instance.infoDataApp?.ownerCitizenNumber,
                // ),
              ],
            ),
          ),
        ).paddingAll(AppDimens.paddingSmall),
      ),
    );
  }

  Widget _buildButton() {
    return UtilWidget.buildTwoButtons(
      titleButtonLeft: LocaleKeys.eCert_DKKD_upRepeat.tr,
      titleButtonRight: LocaleKeys.eCert_DKKD_continue.tr,
      onTapLeft: () {
        Get.back();
      },
      onTapRight: () {
        controller.confirmRegister();
      },
    ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
  }

  Widget _buildInput({
    required String label,
    required TextEditingController textEditingController,
    String? hintText,
    int? inputFormatters,
    bool isValidate = true,
    bool enable = true,
    int? maxLines,
    FormFieldValidator<String>? validator,
    TextInputType textInputType = TextInputType.text,
    FocusNode? currentNode,
    FocusNode? nextNode,
  }) {
    return BuildInputTextWithLabel(
      inputLabelModel: InputLabelModel(
        label: label,
        isValidate: isValidate,
        labelTextStyle: TextStyle(
          fontSize: AppDimens.sizeTextSmall,
          fontWeight: FontWeight.w600,
          color: AppColors.colorNeutral2,
        ),
      ),
      inputTextFormModel: InputTextModel(
        controller: textEditingController,
        hintText: hintText,
        hintTextColor: AppColors.colorBasicGrey2,
        hintTextSize: AppDimens.sizeTextSmall,
        colorBorder: AppColors.colorNeutral3,
        // iconLeadingSVG: iconLeading,
        enable: enable,
        colorFocusedBorder: AppColors.colorNeutral3,
        colordisabledBorder: AppColors.colorNeutral3,
        validator: validator,
        maxLines: maxLines,
        fillColor: Colors.transparent,
        currentNode: currentNode,
        nextNode: nextNode,
        borderRadius: AppDimens.radius12,
        floatingLabelStyle: AppTextStyle.labelStyle(
          size: AppDimens.sizeTextLarge,
        ),
        autovalidateMode: AutovalidateMode.always,
        inputFormatters:
            inputFormatters ?? InputFormatterEnum.lengthLimitingText,
        textInputType: textInputType,
      ),
    ).paddingSymmetric(
      vertical: AppDimens.paddingSmallBottomNavigation,
    );
  }
}
