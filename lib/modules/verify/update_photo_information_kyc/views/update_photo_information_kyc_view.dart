part of 'update_photo_information_kyc_page.dart';

Widget _body(UpdateInformationController controller) {
  return Column(
    children: [
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GuideComponent.builsStepTitle(LocaleKeys.eCert_CCCD_step1.tr,
                  LocaleKeys.eCert_CCCD_step1TitleSort.tr),
              _imageBuilder(controller),
              UtilWidget.sizedBox25,
              TextUtils(
                text: LocaleKeys.update_information_kyc_user_manual.tr,
                availableStyle: StyleEnum.titleMedium,
                color: AppColors.colorBack,
              ).paddingOnly(bottom: AppDimens.paddingSize5),
              _titleInstruct().paddingOnly(bottom: AppDimens.sizeBottomNavi80),
            ],
          ).paddingAll(AppDimens.paddingHuge),
        ),
      ),
      _buildButtonContinue(controller).paddingAll(AppDimens.defaultPadding)
    ],
  );
}

Widget _imageBuilder(UpdateInformationController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Expanded(
            child: _itemPhotoCard(
              onTap: () => controller.routeTakePicture(true),
              urlImage: controller.filesImageFront.fileData,
              textTitle: LocaleKeys.eCert_CCCD_frontIdCard.tr,
            ),
          ),
          UtilWidget.sizedBoxWidth25,
          Expanded(
            child: _itemPhotoCard(
              onTap: () => controller.routeTakePicture(false),
              urlImage: controller.filesImageBack.fileData,
              textTitle: LocaleKeys.eCert_CCCD_backIdCard.tr,
            ),
          ),
        ],
      ).paddingSymmetric(vertical: AppDimens.paddingMedium),
    ],
  );
}

Widget _itemPhotoCard({
  required VoidCallback onTap,
  required Rx<Uint8List?> urlImage,
  required String textTitle,
}) {
  return Obx(
    () => GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: DottedBorder(
        color: urlImage.value != null
            ? AppColors.colorPrimary1
            : AppColors.colorPrimary2,
        strokeWidth: /*urlImage.value != null
            ? AppDimens.sizeWeight3
            : */
            AppDimens.radiusMin,
        borderType: BorderType.RRect,
        radius: const Radius.circular(AppDimens.radius8),
        dashPattern: AppDimens.dashPattern,
        padding: EdgeInsets.zero,
        child: Container(
          width: Get.width,
          height: AppDimens.size100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimens.radius12),
            color: AppColors.colorNeutral5,
          ),
          child: urlImage.value != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(AppDimens.radius8),
                  child: Image.memory(
                    urlImage.value!,
                    fit: BoxFit.cover,
                    // fit: BoxFit.cover,
                  ).paddingAll(AppDimens.radiusMin),
                )
              : _titleTakePicture(textTitle)
                  .paddingSymmetric(horizontal: AppDimens.radiusMin),
        ),
      ),
    ),
  );
}

Column _titleTakePicture(String textTitle) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      TextUtils(
        text: textTitle,
        availableStyle: StyleEnum.bodySmall,
        color: AppColors.colorNeutral2,
        maxLine: 2,
        textAlign: TextAlign.center,
      ).paddingSymmetric(horizontal: AppDimens.paddingSize5),
      UtilWidget.sizedBox7,
      SvgPicture.asset(
        Assets.ASSETS_ECERT_IMAGE_ADD_SVG,
      ),
    ],
  );
}

Widget _titleInstruct() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      UtilWidget.sizedBox5,
      GuideComponent.builsStep(
          LocaleKeys.eCert_CCCD_number1.tr, LocaleKeys.eCert_CCCD_guide1.tr),
      GuideComponent.builsStep(
          LocaleKeys.eCert_CCCD_number2.tr, LocaleKeys.eCert_CCCD_guide2.tr),
      GuideComponent.builsStep(
          LocaleKeys.eCert_CCCD_number3.tr, LocaleKeys.eCert_CCCD_guide3.tr),
    ],
  ).paddingOnly(bottom: AppDimens.paddingSize5);
}

Widget _buildButtonContinue(
  UpdateInformationController controller, {
  Function? function,
}) {
  return SizedBox(
    // height: AppDimens.iconHeightButton,
    child: Obx(
      () => UtilWidget.buildButtonPrimary(
        LocaleKeys.update_information_kyc_continue.tr,
        function?.call() ?? () async => controller.getORC(),
        isLoading: controller.isShowLoading.value,
      ),
    ),
  );
}
