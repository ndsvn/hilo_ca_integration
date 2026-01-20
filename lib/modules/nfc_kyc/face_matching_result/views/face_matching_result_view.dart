part of 'face_matching_result_page.dart';

Widget _itemBody(FaceMatchingResultController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UtilWidget.sizedBox45,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildImagAvt(AppConfig.instance.nfcModelApp.file ?? ""),
                  _buildImagAvt(base64Encode(controller.image ?? [])),
                ],
              ),
              UtilWidget.sizedBox45,
              controller.isLoadingOverlay.value
                  ? SizedBox()
                  : controller.faceMatchingResult.value
                      ? _buildSuccess()
                      : _buildFail(),
            ],
          ).paddingSymmetric(
            vertical: AppDimens.defaultPadding,
            horizontal: AppDimens.defaultPadding,
          ),
        ),
      ),
      UtilWidget.sizedBox15,
      _buildButton(controller),
      GetPlatform.isAndroid ? UtilWidget.sizedBox10 : UtilWidget.sizedBox15,
    ],
  ).paddingSymmetric(horizontal: AppDimens.iconVerySmall);
}

Widget _buildButton(FaceMatchingResultController controller) {
  return Obx(
    () => Visibility(
      visible: !controller.isLoadingOverlay.value,
      child: UtilWidget.buildButtonPrimary(
        controller.faceMatchingResult.value
            ? LocaleKeys.eCert_CCCD_continue
            : LocaleKeys.eCert_CCCD_return.tr,
        () async {
          if (controller.faceMatchingResult.value) {
            await controller.confirmFace();
          } else {
            Get.offAndToNamed(AppRoutes.routeLiveNessKyc);
          }
        },
        isLoading: controller.isShowLoading.value,
      ),
    ),
  );
}

Widget _buildSuccess() {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.ASSETS_ECERT_CHECK_CIRCLE_SVG,
          ).paddingOnly(
            right: AppDimens.defaultPadding,
          ),
          Flexible(
            child: TextUtils(
              text: LocaleKeys.eCert_CCCD_faceMatchingvalilTitle.tr,
              availableStyle: StyleEnum.titleMedium,
              color: AppColors.colorGreenText,
              maxLine: 2,
            ),
          ),
        ],
      ),
      UtilWidget.sizedBox10,
      TextUtils(
        text: LocaleKeys.eCert_CCCD_faceMatchingvalidSuccess.tr,
        availableStyle: StyleEnum.titleSmall,
        textAlign: TextAlign.center,
        maxLine: 2,
      )
    ],
  );
}

Widget _buildFail() {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.ASSETS_ECERT_EXCLAMATION_CIRCLE_SVG,
          ).paddingOnly(
            right: AppDimens.defaultPadding,
          ),
          Flexible(
            child: TextUtils(
              text: LocaleKeys.eCert_CCCD_faceMatchingvalilTitleFail.tr,
              availableStyle: StyleEnum.titleMedium,
              color: AppColors.colorRed,
              maxLine: 2,
            ),
          ),
        ],
      ),
      UtilWidget.sizedBox10,
      TextUtils(
        text: LocaleKeys.eCert_CCCD_faceMatchingvalidFail.tr,
        availableStyle: StyleEnum.titleSmall,
        textAlign: TextAlign.center,
        maxLine: 2,
      )
    ],
  );
}

Widget _buildLoading() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      TextUtils(
        text: LocaleKeys.eCert_CCCD_faceMatchingvalilLoading.tr,
        availableStyle: StyleEnum.titleMedium,
        color: AppColors.white,
        maxLine: 3,
        textAlign: TextAlign.center,
      ),
      UtilWidget.sizedBox25,
      CircularProgressIndicator(
        color: AppColors.white,
        // strokeWidth: 2,
      )
    ],
  );
}

Widget _buildImagAvt(String imgBase64) {
  return imgBase64.isEmpty
      ? const SizedBox()
      : ClipOval(
          child: Image.memory(
            base64Decode(imgBase64),
            fit: BoxFit.cover,
            width: 120,
            height: 120,
            // fit: BoxFit.cover,
          ),
        );
}
