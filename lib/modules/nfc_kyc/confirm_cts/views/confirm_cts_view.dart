part of 'confirm_cts_page.dart';

Widget _itemBody(ConfirmCTSPageController controller) {
  return Column(
    children: [
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInput(
                textEditingController: controller.name,
                label: LocaleKeys.confirm_cts_name.tr,
              ),
              _buildInput(
                textEditingController: controller.seri,
                label: LocaleKeys.confirm_cts_seri.tr,
                maxLines: 2,
              ),
              _buildInput(
                textEditingController: controller.company,
                label: LocaleKeys.confirm_cts_company.tr,
                inputFormatters: InputFormatterEnum.email,
              ),
              _buildInput(
                textEditingController: controller.infoUser,
                label: LocaleKeys.confirm_cts_infoUser.tr,
                maxLines: 3,
              ),
              _buildInput(
                textEditingController: controller.time,
                label: LocaleKeys.confirm_cts_time.tr,
                maxLines: 2,
              ),
              _buildInput(
                textEditingController: controller.status,
                label: LocaleKeys.confirm_cts_status.tr,
              ),
            ],
          ),
        ),
      ),
      UtilWidget.buildButtonPrimary(
        LocaleKeys.confirm_cts_buttonRight.tr,
        () async {
          await controller.confirmSignCTS();
        },
      ),
      GetPlatform.isAndroid ? UtilWidget.sizedBox10 : UtilWidget.sizedBox15,
    ],
  ).paddingSymmetric(horizontal: AppDimens.iconVerySmall);
}

Widget _buildInput({
  required String label,
  required TextEditingController textEditingController,
  String? hintText,
  int? inputFormatters,
  bool isValidate = false,
  bool enable = false,
  int? maxLines,
}) {
  return BuildInputTextWithLabel(
    inputLabelModel: InputLabelModel(
        label: label,
        isValidate: isValidate,
        labelTextStyle: TextStyle(
          fontSize: AppDimens.sizeTextSmall,
          fontWeight: FontWeight.w600,
          color: AppColors.colorBasicGrey2,
        )),
    inputTextFormModel: InputTextModel(
      controller: textEditingController,
      hintText: hintText,
      hintTextColor: AppColors.colorBasicGrey2,
      hintTextSize: AppDimens.sizeTextSmall,
      colorBorder: AppColors.colorBlueX,
      colordisabledBorder: AppColors.colorBasicGrey3,
      enable: enable,
      colorFocusedBorder: AppColors.colorBlueX,
      maxLines: maxLines,
      inputFormatters: inputFormatters ?? InputFormatterEnum.lengthLimitingText,
    ),
  ).paddingSymmetric(
    vertical: AppDimens.paddingSmallBottomNavigation,
  );
}
