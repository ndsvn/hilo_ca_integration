part of 'nfc_information_user_page.dart';

Widget _buildListGuild(NfcInformationUserController controller) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppConfig.instance.nfcModelApp.file == ""
                ? const SizedBox()
                : ClipOval(
                    child: Image.memory(
                      base64Decode(AppConfig.instance.nfcModelApp.file ?? ""),
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                    ),
                  ),
          ],
        ).paddingSymmetric(vertical: AppDimens.paddingSmall),
        _buildItemText(LocaleKeys.eCert_nfcResult_firstName.tr,
            controller.sendNfcRequestModel.nameVNM),
        _buildItemText(LocaleKeys.eCert_nfcResult_idCard.tr,
            controller.sendNfcRequestModel.number),
        _buildItemText(
            LocaleKeys.eCert_nfcResult_dateOfBirth.tr, controller.dateOfBirth),
        _buildItemText(LocaleKeys.eCert_nfcResult_gender.tr,
            controller.sendNfcRequestModel.sexVMN),
        _buildItemText(LocaleKeys.eCert_nfcResult_nationality.tr,
            controller.sendNfcRequestModel.nationalityVMN),
        _buildItemText(LocaleKeys.eCert_nfcResult_homeTown.tr,
            controller.sendNfcRequestModel.homeTownVMN),
        _buildItemText(LocaleKeys.eCert_nfcResult_registrationDate.tr,
            controller.sendNfcRequestModel.registrationDateVMN),
        _buildItemText(
            LocaleKeys.eCert_nfcResult_location.tr,
            isDateBeforeJuly2024(convertStringToDate(
                    controller.sendNfcRequestModel.registrationDateVMN ?? "",
                    pattern1))
                ? LocaleKeys.eCert_nfcResult_locationTitle.tr
                : LocaleKeys.eCert_nfcResult_locationTitleNew.tr),
        _buildItemText(LocaleKeys.eCert_nfcResult_dateOfExpiry.tr,
            controller.dateOfExpiry),
      ],
    ).paddingSymmetric(horizontal: AppDimens.paddingVerySmall),
  );
}

Widget _buildItemText(String title, String? content) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextUtils(
            text: title,
            availableStyle: StyleEnum.titleSmall,
            maxLine: 3,
            color: AppColors.colorNeutral2,
          ),
          UtilWidget.sizedBoxWidth10,
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: TextUtils(
                text: content ?? "",
                availableStyle: StyleEnum.titleSmall,
                color: AppColors.colorTextInfoNFC,
                maxLine: 3,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ],
      ),
      UtilWidget.sizedBox20,
    ],
  );
}
