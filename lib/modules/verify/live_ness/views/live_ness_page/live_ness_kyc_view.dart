part of 'live_ness_kyc_page.dart';

Widget _body(LiveNessKycController controller) {
  return _buildCapturePage(controller);
}

CircularPercentIndicator _circularPercentIndicator(
    LiveNessKycController controller) {
  return CircularPercentIndicator(
    radius: Get.size.width / 2 - 24,
    lineWidth: AppDimens.paddingTabBar,
    percent: controller.currentStep.value <= 1
        ? 0
        : (controller.currentStep.value) / (AppConst.currentStepMax + 1),
    backgroundColor: AppColors.transparent,
    progressColor: AppColors.colorBlueX,
  );
}

Widget _buildCapturePage(LiveNessKycController controller) {
  return Stack(
    children: [
      controller.cameraIsInitialize.value
          ? Positioned.fill(
              child: Transform.scale(
                scale: 1.0,
                child: Center(
                  child: CameraPreview(controller.cameraController),
                ),
              ),
            )
          : const SizedBox(),
      SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(fit: StackFit.passthrough, children: [
          CustomPaint(
            painter: CustomShapePainterLiveNess(),
          ),
          Positioned(
              top: Get.size.height / 2.2 - (Get.width / 2 - 25),
              left: Get.width / 2 - (Get.width / 2 - 25),
              child: _circularPercentIndicator(controller)),
          // _buttonTakePicture(controller),
          _buttonStart(controller),
          _actionWidget(controller),
          _positionedAppbar(controller),
          _warningFace(controller),
          Positioned(
            left: AppDimens.iconVerySmall,
            right: AppDimens.iconVerySmall,
            bottom: Get.height / 2.2 - Get.width / 2 - 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: LocaleKeys.eCert_CCCD_note.tr,
                  availableStyle: StyleEnum.bodySmall,
                  textAlign: TextAlign.center,
                ),
                GuideComponent.builsStep(LocaleKeys.eCert_CCCD_number1.tr,
                    LocaleKeys.eCert_CCCD_liveNessNote1.tr),
                GuideComponent.builsStep(LocaleKeys.eCert_CCCD_number2.tr,
                    LocaleKeys.eCert_CCCD_liveNessNote2.tr),
              ],
            ),
          )
          // if (controller.imageTemp.value != null)
          //   _buildWidgetHaveImage(controller),
        ]),
      ),
    ],
  );
}

Stack _warningFace(LiveNessKycController controller) {
  return Stack(
    children: [
      Visibility(
        visible:
            controller.isFaceEmpty.value && !controller.isSuccessLiveNess.value,
        child: Positioned(
          left: AppDimens.defaultPadding,
          right: AppDimens.defaultPadding,
          top: Get.height / 2 + AppDimens.sizeBorderNavi,
          child: Container(
            color: AppColors.colorGreyOpacity35,
            child: TextUtils(
              text: LocaleKeys.live_ness_liveNessEmptyFace.tr,
              availableStyle: StyleEnum.bodySmall,
              color: AppColors.colorWhite,
              maxLine: 2,
              textAlign: TextAlign.center,
            ).paddingAll(8),
          ),
        ),
      ),
      Visibility(
        visible:
            controller.isManyFace.value && !controller.isSuccessLiveNess.value,
        child: Positioned(
          left: AppDimens.defaultPadding,
          right: AppDimens.defaultPadding,
          top: Get.height / 2 + AppDimens.sizeBorderNavi,
          child: Container(
            color: AppColors.colorGreyOpacity35,
            child: TextUtils(
              text: LocaleKeys.live_ness_liveNessManyFace.tr,
              availableStyle: StyleEnum.bodySmall,
              color: AppColors.colorWhite,
              maxLine: 2,
              textAlign: TextAlign.center,
            ).paddingAll(8),
          ),
        ),
      ),
    ],
  );
}

Visibility _actionWidget(LiveNessKycController controller) {
  return Visibility(
    visible: controller.isSuccessLiveNess.isFalse,
    child: Positioned(
      left: AppDimens.sizeTextSmallest,
      right: AppDimens.sizeTextSmallest,
      top: Get.height / 8,
      child: controller.currentStep.value > 0
          ? Column(
              children: [
                TextUtils(
                  text: LocaleKeys.live_ness_titleAction.tr,
                  availableStyle: StyleEnum.titleMedium,
                  color: AppColors.colorNeutral1,
                  maxLine: 2,
                  textAlign: TextAlign.center,
                ),
                UtilWidget.sizedBox20,
                TextUtils(
                  text: controller.currentStep.value > AppConst.currentStepMax
                      ? ""
                      : controller
                          .questionTemp[controller.currentStep.value - 1],
                  availableStyle: StyleEnum.titleSmall,
                  color: AppColors.lightPrimaryColor,
                  textAlign: TextAlign.center,
                ),
              ],
            )
          : Column(
              children: [
                GuideComponent.builsStepTitle(LocaleKeys.eCert_CCCD_step3.tr,
                    LocaleKeys.eCert_CCCD_step3Title.tr),
                UtilWidget.sizedBox20,
                TextUtils(
                  text: LocaleKeys.eCert_CCCD_liveNessContent.tr,
                  availableStyle: StyleEnum.bodySmall,
                  color: AppColors.colorNeutral2,
                  maxLine: 2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
    ),
  );
}

// Row _itemAction(LiveNessKycController controller) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       ...List.generate(
//         controller.listFaceDetectionTemp.length,
//         (index) => Column(
//           children: [
//             SvgPicture.asset(
//               controller.listFaceDetectionTemp[index],
//               colorFilter: ColorFilter.mode(
//                   index <= controller.currentStep.value - 1
//                       ? index == controller.currentStep.value - 1
//                           ? AppColors.colorErrorText
//                           : AppColors.colorSemantic2
//                       : AppColors.colorWhite,
//                   BlendMode.srcIn),
//             ).paddingOnly(bottom: AppDimens.paddingSmallest),
//             // TextUtils(
//             //   text: controller.questionTemp[index],
//             //   availableStyle: StyleEnum.bodySmall,
//             //   color: index <= controller.currentStep.value - 1
//             //       ? index == controller.currentStep.value - 1
//             //           ? AppColors.colorErrorText
//             //           : AppColors.colorSemantic2
//             //       : AppColors.colorWhite,
//             // ),
//           ],
//         ),
//       ),
//     ],
//   );
// }

Visibility _buttonStart(LiveNessKycController controller) {
  return Visibility(
    visible: controller.currentStep.value == 0,
    child: Positioned(
      left: AppDimens.defaultPadding,
      right: AppDimens.defaultPadding,
      bottom: AppDimens.defaultPadding,
      child: UtilWidget.buildButtonPrimary(
        LocaleKeys.live_ness_action.tr,
        () async {
          await controller.startStreamPicture();
        },
        isLoading: controller.isShowLoading.value,
      ),
    ),
  );
}

Positioned _positionedAppbar(LiveNessKycController controller) {
  return Positioned(
    left: 0,
    right: AppDimens.sizeTextSmallest,
    top: 0,
    child: Align(
      alignment: Alignment.topCenter,
      child: UtilWidget.buildAppBar(
        LocaleKeys.eCert_CCCD_title.tr,
        isColorGradient: false,
        leading: true,

        backgroundColor: AppColors.colorTransparent,
        statusBarIconBrightness: true,
        // iconSize:
      ),
    ),
  );
}
