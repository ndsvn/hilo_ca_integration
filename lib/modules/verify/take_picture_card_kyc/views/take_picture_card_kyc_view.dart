part of 'take_picture_card_kyc_page.dart';

Widget _body(TakePictureCardKycController controller) {
  return controller.imageTemp.value == null
      ? _buildUploadImg(controller)
      : _buildResult(controller);
}

Widget _buildUploadImg(TakePictureCardKycController controller) {
  return Stack(
    children: [
      Stack(
        children: [
          _buildCamera(controller),
          Positioned(
            top: -1,
            left: 0,
            right: 0,
            child: Container(
              height: 2,
              color: AppColors.colorWhite,
            ),
          ),
          CustomPaint(
            painter: CustomShapePainterTakePicture(),
          ),
        ],
      ),
      _itemBorder(controller),
    ],
  );
}

Widget _buildResult(TakePictureCardKycController controller) {
  return Stack(
    children: [
      Positioned(
        bottom: Get.height / 4 - AppDimens.paddingTextHis,
        left: 0,
        right: 0,
        child: Center(
          child: TextUtils(
            text: controller.isTakeFront
                ? LocaleKeys.eCert_CCCD_takePictureFront.tr
                : LocaleKeys.eCert_CCCD_takePictureBack.tr,
            availableStyle: StyleEnum.titleMedium,
            color: AppColors.colorPrimary1,
          ),
        ),
      ),
      Positioned(
        top: AppDimens.btnMedium,
        left: 0,
        right: 0,
        child: Center(
          child: GuideComponent.builsStepTitle(LocaleKeys.eCert_CCCD_step1.tr,
              LocaleKeys.eCert_CCCD_step1TitleSort.tr),
        ),
      ),
      Positioned(
        left: AppDimens.paddingMediumMax,
        right: AppDimens.paddingMediumMax,
        top: Get.height / 3.3 - Get.height / 6 - AppDimens.size3,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.colorWhite),
              borderRadius: BorderRadius.circular(AppDimens.sizeTextMedium)),
          child: Screenshot(
            controller: controller.screenshotControllerResult,
            child: SizedBox(
              width: Get.size.width - AppDimens.btnMedium,
              height: Get.size.height / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppDimens.sizeTextMedium),
                child: OverflowBox(
                  maxWidth: Get.size.width - AppDimens.btnMedium,
                  maxHeight: Get.size.height - AppDimens.btnMedium,
                  child: FractionalTranslation(
                    translation: const Offset(0.00, 0.150),
                    child: Image.memory(
                      controller.imageTemp.value!,
                      fit: BoxFit.cover,
                    ).paddingSymmetric(horizontal: AppDimens.sizeTextLarge),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      Positioned(
        left: AppDimens.paddingMediumMax,
        right: AppDimens.paddingMediumMax,
        bottom: AppDimens.sizeTextSmall,
        child: _buildButtonConfirm(controller),
      ),
    ],
  );
}

Widget _itemBorder(TakePictureCardKycController controller) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        bottom: Get.height / 4 - AppDimens.paddingTextHis,
        left: 0,
        right: 0,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextUtils(
                text: controller.isTakeFront
                    ? LocaleKeys.take_picture_titleFront.tr
                    : LocaleKeys.take_picture_titleBack.tr,
                availableStyle: StyleEnum.titleMedium,
                color: AppColors.colorPrimary1,
              ),
              UtilWidget.sizedBox5,
              TextUtils(
                text: controller.isTakeFront
                    ? LocaleKeys.take_picture_titleTakeFront.tr
                    : LocaleKeys.take_picture_titleTakeBack.tr,
                availableStyle: StyleEnum.bodySmall,
                maxLine: 2,
                textAlign: TextAlign.center,
                color: AppColors.colorNeutral2,
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: AppDimens.btnMedium,
        left: 0,
        right: 0,
        child: Center(
            child: GuideComponent.builsStepTitle(LocaleKeys.eCert_CCCD_step1.tr,
                LocaleKeys.eCert_CCCD_step1TitleSort.tr)),
      ),
      iconBorderPosition(
        top: Get.height / 3.3 - Get.height / 6 - AppDimens.size3,
        left: AppDimens.paddingMediumMax - AppDimens.size3,
        transform: Matrix4.rotationY(0),
      ),
      iconBorderPosition(
        top: Get.height / 3.3 - Get.height / 6 - AppDimens.size3,
        right: AppDimens.paddingMediumMax - AppDimens.size3,
        transform: Matrix4.rotationY(pi),
        // isBottomLeft: true,
      ),
      iconBorderPosition(
        top: Get.height / 3.3 +
            Get.height / 6 -
            AppDimens.sizeTextAvatar +
            AppDimens.size3,
        left: AppDimens.paddingMediumMax - AppDimens.size3,
        transform: Matrix4.rotationX(pi),
      ),
      iconBorderPosition(
        top: Get.height / 3.3 +
            Get.height / 6 -
            AppDimens.sizeTextAvatar +
            AppDimens.size3,
        right: AppDimens.paddingMediumMax - AppDimens.size3,
        transform: Matrix4.rotationZ(pi),
        // isBottomLeft: true,
      ),
      Positioned(
        left: AppDimens.iconVerySmall,
        right: AppDimens.iconVerySmall,
        bottom: AppDimens.sizeTextSmall,
        child: Center(
          child: _buildButtonCapPicture(controller),
        ),
      ),
    ],
  );
}

Widget iconBorderPosition({
  double? top,
  double? bot,
  double? left,
  double? right,
  String? assets,
  required Matrix4 transform,
}) {
  return Positioned(
    top: top,
    left: left,
    right: right,
    bottom: bot,
    child: Transform(
      alignment: Alignment.center,
      transform: transform,
      child: SvgPicture.asset(
        assets ?? Assets.ASSETS_IMAGES_ICON_ICON_SVG_IC_BORDER_PICTURE_SVG,
        width: AppDimens.sizeTextAvatar,
        height: AppDimens.sizeTextAvatar,
      ),
    ),
  );
}

Widget _buildButtonCapPicture(TakePictureCardKycController controller) {
  return UtilWidget.buildTwoButtons(
    titleButtonLeft: LocaleKeys.take_picture_upPicture.tr,
    titleButtonRight: LocaleKeys.take_picture_takePicture.tr,
    onTapLeft: () async {
      await controller.pickImage();
    },
    onTapRight: () async {
      await controller.takePictureScreen();
    },
  );
}

Widget _buildButtonConfirm(TakePictureCardKycController controller) {
  return UtilWidget.buildTwoButtons(
    titleButtonLeft: LocaleKeys.eCert_DKKD_upRepeat.tr,
    titleButtonRight: LocaleKeys.eCert_DKKD_continue.tr,
    onTapLeft: () {
      controller.retakePicture();
    },
    onTapRight: () async {
      await controller.takePictureScreenResult();
    },
  );
}

Widget _buildCamera(TakePictureCardKycController controller) {
  return Obx(
    () => Screenshot(
      controller: controller.screenshotController,
      child: controller.isCameraInit.value
          ? CameraPreview(controller.cameraController)
          : const SizedBox(),
    ),
  );
}
