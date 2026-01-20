part of 'info_cts_page.dart';

Widget _itemBody(InfoCTSPageController controller) {
  return Column(
    children: [
      Expanded(
        child: SingleChildScrollView(
          child: UtilWidget.itemCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UtilWidget.sizedBox15,
                AppInfoCert.instance.isPersonal
                    ? _buildInfoPersonal(controller)
                    : _buildInfoOrg(),
                UtilWidget.sizedBox20,
                DashedDivider(
                  color: AppColors.colorNeutral3,
                ),
                UtilWidget.sizedBox20,
                // _buildInfoPackage(),
                // UtilWidget.sizedBox20,
                // DashedDivider(
                //   color: AppColors.colorNeutral3,
                // ),
                UtilWidget.sizedBox20,
                TextUtils(
                  text: LocaleKeys.eCert_register_signTitle.tr,
                  availableStyle: StyleEnum.titleMedium,
                  color: AppColors.colorBack,
                  maxLine: 3,
                ),
                UtilWidget.sizedBox15,
                TextUtils(
                  text: LocaleKeys.eCert_register_signNote.tr,
                  availableStyle: StyleEnum.titleSmall,
                  color: AppColors.colorNeutral1,
                  maxLine: 3,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                ),
                UtilWidget.sizedBox20,
                _builDraw(controller),
                UtilWidget.sizedBox50,
              ],
            ),
          ),
        ),
      ),
      _buildButton(controller),
      GetPlatform.isAndroid ? UtilWidget.sizedBox10 : UtilWidget.sizedBox15,
    ],
  ).paddingSymmetric(horizontal: AppDimens.paddingSmall);
}

Widget _buildButton(InfoCTSPageController controller) {
  return Obx(
    () => UtilWidget.buildButtonPrimary(
      LocaleKeys.info_cts_button.tr,
      () async {
        await controller.confrimRegister();
      },
      isLoading: controller.isShowLoading.value,
      backgroundColor: !controller.canSubmit.value
          ? AppColors.colorNeutral2
          : AppColors.lightPrimaryColor,
    ),
  );
}

CardWidgets _builDraw(InfoCTSPageController controller) {
  return CardWidgets(
    radius: AppDimens.radiusBig,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtils(
          text: LocaleKeys.eCert_register_signDraw.tr,
          availableStyle: StyleEnum.titleSmall,
          color: AppColors.colorNeutral2,
          textAlign: TextAlign.start,
        ).paddingSymmetric(
            vertical: AppDimens.defaultPadding,
            horizontal: AppDimens.paddingSmallest),
        UtilWidget.itemCard(
          child: SizedBox(
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UtilWidget.sizedBox10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BottomSheetComponents.buildItemBottom(
                      icon:
                          Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_BACKWARD_SVG,
                      title: "",
                      onTap: () {
                        controller.signatureController.value.undo();
                      },
                    ),
                    UtilWidget.sizedBoxWidth25,
                    BottomSheetComponents.buildItemBottom(
                      icon:
                          Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_FORDWARD_SVG,
                      title: "",
                      onTap: () {
                        controller.signatureController.value.redo();
                      },
                    ),
                    UtilWidget.sizedBoxWidth25,
                    BottomSheetComponents.buildItemBottom(
                      icon: Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_TRASH_SVG,
                      title: "",
                      onTap: () {
                        controller.signatureController.value.clear();
                      },
                    ),
                  ],
                ),
                Signature(
                  controller: controller.signatureController.value,
                  width: Get.width - AppDimens.btnMediumTb,
                  height: Get.width / AppConst.signatureRatio,
                  backgroundColor: AppColors.colorTransparent,
                ),
              ],
            ),
          ),
          horizontal: 0,
          vertical: AppDimens.radiusSmall,
          onTap: () {},
          borderColor: AppColors.lightPrimaryColor,
        ),
      ],
    ).paddingSymmetric(horizontal: AppDimens.paddingSmaller),
  );
}

Column _buildInfoPackage() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextUtils(
        text: LocaleKeys.eCert_register_infoPackage,
        availableStyle: StyleEnum.titleMedium,
        color: AppColors.colorBack,
        maxLine: 3,
      ),
      UtilWidget.sizedBox20,
      _buildItemText(
        LocaleKeys.eCert_register_targetUser.tr,
        "Đối tượng sử dụng",
      ),
      _buildItemText(
        LocaleKeys.eCert_register_servicePackage.tr,
        "Dịch vụ này",
      ),
      _buildItemText(
        LocaleKeys.eCert_register_timeUsed.tr,
        "Thời gian sử dụng",
      ),
    ],
  );
}

Column _buildInfoOrg() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextUtils(
        text: LocaleKeys.eCert_register_infoOrganizationTitile.tr,
        availableStyle: StyleEnum.titleMedium,
        color: AppColors.colorBack,
        maxLine: 3,
      ),
      UtilWidget.sizedBox20,
      _buildItemText(
        LocaleKeys.eCert_register_transactionName.tr,
        AppInfoCert.instance.businessInfo.businessHouseholdName,
      ),
      // _buildItemText(
      //   LocaleKeys.eCert_register_codeRegister.tr,
      //   AppInfoCert.instance.businessInfo.businessRegistration,
      // ),
      _buildItemText(
        LocaleKeys.eCert_register_code.tr,
        AppInfoCert.instance.businessInfo.businessNumber,
      ),
      _buildItemText(
        LocaleKeys.eCert_register_addressOrg.tr,
        AppInfoCert.instance.businessInfo.businessAddress,
      ),
      _buildItemText(
        LocaleKeys.eCert_register_email.tr,
        AppInfoCert.instance.businessInfo.email,
      ),
      _buildItemText(
        LocaleKeys.eCert_register_phone.tr,
        AppInfoCert.instance.businessInfo.phone,
      ),
      _buildItemText(
        LocaleKeys.eCert_register_representative.tr,
        AppInfoCert.instance.businessInfo.businessHouseholdOwner,
      ),
      _buildItemText(
        LocaleKeys.eCert_register_numberID,
        AppInfoCert.instance.cusInfo.code,
      ),
    ],
  );
}

Column _buildInfoRegister() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextUtils(
        text: LocaleKeys.eCert_register_infoRegister.tr,
        availableStyle: StyleEnum.titleMedium,
        color: AppColors.colorBack,
        maxLine: 3,
      ),
      UtilWidget.sizedBox20,
      _buildItemText(
        LocaleKeys.eCert_register_fullName.tr,
        AppConfig.instance.nfcModelApp.nameVNM,
      ),
      _buildItemText(
        LocaleKeys.eCert_register_numberCCCD.tr,
        AppConfig.instance.nfcModelApp.number,
      ),
      _buildItemText(
        LocaleKeys.eCert_register_nationality.tr,
        AppConfig.instance.nfcModelApp.nationalityVMN,
      ),
      _buildItemText(
        LocaleKeys.eCert_register_dateOfIssue.tr,
        AppConfig.instance.nfcModelApp.registrationDateVMN,
      ),
      _buildItemText(
        LocaleKeys.eCert_register_address,
        AppConfig.instance.nfcModelApp.residentVMN,
      ),
    ],
  );
}

Column _buildInfoPersonal(InfoCTSPageController controller) {
  return Column(
    children: [
      _buildInfoRegister(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils(
            text: LocaleKeys.eCert_register_infoPersonalTitile.tr,
            availableStyle: StyleEnum.titleMedium,
            color: AppColors.colorBack,
            maxLine: 3,
          ),
          UtilWidget.sizedBox20,
          _buildInput(
              label: LocaleKeys.eCert_register_email.tr,
              textEditingController: controller.emailController,
              inputFormatters: InputFormatterEnum.email,
              currentNode: controller.emailFocus,
              nextNode: controller.phoneFocus,
              isValidate: true),
          _buildInput(
            label: LocaleKeys.eCert_register_phone.tr,
            textEditingController: controller.phoneController,
            inputFormatters: InputFormatterEnum.phoneNumber,
            currentNode: controller.phoneFocus,
            isValidate: true,
          ),
        ],
      ),
    ],
  );
}

Widget _buildItemText(String title, String? content) {
  return Column(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextUtils(
            text: title,
            availableStyle: StyleEnum.titleSmall,
            maxLine: 2,
            color: AppColors.colorNeutral2,
          ),
          UtilWidget.sizedBox10,
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.colorNeutral3,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(AppDimens.radius12),
            ),
            child: TextUtils(
              text: content ?? "",
              availableStyle: StyleEnum.titleSmall,
              color: AppColors.colorNeutral1,
              maxLine: 4,
              fontWeight: FontWeight.w600,
            ).paddingAll(AppDimens.defaultPadding),
          ),
        ],
      ),
      UtilWidget.sizedBox15,
    ],
  );
}

Widget _buildInput({
  required String label,
  required TextEditingController textEditingController,
  String? hintText,
  int? inputFormatters,
  bool isValidate = false,
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
      inputFormatters: inputFormatters ?? InputFormatterEnum.lengthLimitingText,
      textInputType: textInputType,
    ),
  ).paddingSymmetric(
    vertical: AppDimens.paddingSmallBottomNavigation,
  );
}
