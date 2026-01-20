part of 'nfc_kyc_page.dart';

Widget _body(ScanNfcKycController controller) {
  return Container(
    height: Get.height,
    width: Get.width,
    color: AppColors.white,
    child: Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GuideComponent.builsStepTitle(LocaleKeys.eCert_CCCD_step2.tr,
                    LocaleKeys.eCert_CCCD_step2Title.tr),
                UtilWidget.sizedBox20,
                Column(
                  children: [
                    UtilWidget.buildInputData(
                      title: LocaleKeys.nfcInfo_name.tr,
                      textEditingController: controller.userNameController,
                      isReadOnly: true,
                      hintText: LocaleKeys.nfcInfo_name.tr,
                      errorValidator: "",
                      currentNode: controller.userNameFocus.value,
                      visible: controller.userNameController.text != "",
                    ),
                    UtilWidget.buildInputData(
                      title: LocaleKeys.eCert_CCCD_number.tr,
                      textEditingController: controller.idDocumentController,
                      isReadOnly: true,
                      hintText: LocaleKeys.eCert_CCCD_number.tr,
                      errorValidator: "",
                      currentNode: controller.idDocumentFocus.value,
                    ),
                    UtilWidget.buildInputData(
                        title: LocaleKeys.nfcInfo_dob.tr,
                        textEditingController: controller.dobController,
                        isReadOnly: true,
                        hintText: LocaleKeys.nfcInfo_dob.tr,
                        errorValidator: "",
                        currentNode: controller.dobFocus.value,
                        visible: controller.dobController.text != ""),
                    UtilWidget.buildInputData(
                        title: LocaleKeys.nfcInfo_doe.tr,
                        textEditingController: controller.doeController,
                        isReadOnly: true,
                        hintText: LocaleKeys.nfcInfo_doe.tr,
                        errorValidator: "",
                        currentNode: controller.doeFocus.value,
                        visible: controller.doeController.text != ""),
                    // UtilWidget.buildInputData(
                    //   title: NfcInformationString.firstName,
                    //   textEditingController: controller.userNameController,
                    //   isReadOnly: true,
                    //   hintText: "",
                    //   errorValidator: "",
                    //   currentNode: controller.userNameFocus.value,
                    //   nextMode: controller.dobFocus.value,
                    //   // iconLeading: Icons.person,
                    // ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UtilWidget.sizedBox10,
                    TextUtils(
                      text: LocaleKeys.eCert_CCCD_guideNFC.tr,
                      availableStyle: StyleEnum.titleMedium,
                    ),
                    UtilWidget.sizedBox10,
                    GuideComponent.builsStep(LocaleKeys.eCert_CCCD_number1,
                        LocaleKeys.eCert_CCCD_guideNFC1),
                    GuideComponent.builsStep(LocaleKeys.eCert_CCCD_number2,
                        LocaleKeys.eCert_CCCD_guideNFC2),
                    GuideComponent.builsStep(LocaleKeys.eCert_CCCD_number3,
                        LocaleKeys.eCert_CCCD_guideNFC3),
                  ],
                ).paddingSymmetric(vertical: AppDimens.defaultPadding)
              ],
            ).paddingAll(AppDimens.iconVerySmall),
          ),
        ),
        _buildButtonNfcContinue(controller),
      ],
    ),
  );
}

Widget _buildButtonNfcContinue(ScanNfcKycController controller) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Obx(
        () => UtilWidget.buildButtonPrimary(
          LocaleKeys.eCert_CCCD_nfcButton.tr,
          () async => await controller.scanNfc(),
          isLoading: controller.isShowLoading.value,
        ),
      ),
      UtilWidget.sizedBox7,
    ],
  ).paddingAll(AppDimens.paddingSmall);
}
