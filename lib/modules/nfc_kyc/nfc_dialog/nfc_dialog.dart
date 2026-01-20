import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:hilo_ca_integration/generated/locales.g.dart';
import 'package:hilo_ca_integration/modules/nfc_kyc/nfc_dialog/nfc_dialog.src.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class NfcDialog extends BaseGetWidget<NfcDialogController> {
  @override
  NfcDialogController get controller => Get.put(NfcDialogController());

  const NfcDialog({super.key});

  @override
  Widget buildWidgets(BuildContext context) {
    return Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              child: TextUtils(
                text: controller.isReading.value
                    ? LocaleKeys.eCert_CCCD_nfcReading.tr
                    : LocaleKeys.eCert_CCCD_nfcPrepare.tr,
                availableStyle: StyleEnum.bodyLarge,
                color: AppColors.colorBack,
              ).paddingOnly(
                  top: AppDimens.paddingMedium, bottom: AppDimens.paddingSmall),
            ),
            SvgPicture.asset(
              Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_SCAN_NFC_SVG,
            ),
            TextUtils(
              text: controller.isReading.value
                  ? LocaleKeys.eCert_CCCD_nfcHandle
                  : LocaleKeys.eCert_CCCD_nfcGuide,
              availableStyle: StyleEnum.bodyMedium,
              color: AppColors.colorBack,
              maxLine: 3,
              textAlign: TextAlign.center,
            ).paddingAll(AppDimens.paddingSmaller),
            buildProgressBar(controller),
            UtilWidget.buildButtonSecond(
              LocaleKeys.nfcDialog_dialogCancel.tr,
              () async {
                Get.back();
                await controller.nfc.disconnect();
                controller.isReading.value = false;
              },
              width: Get.width / 2,
            ).paddingAll(AppDimens.paddingMedium)
          ],
        ).paddingOnly(bottom: AppDimens.paddingSmall));
  }

  Widget buildProgressBar(NfcDialogController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: controller.isReading.value,
          child: LinearPercentIndicator(
            width: Get.width / 1.8,
            lineHeight: 8,
            alignment: MainAxisAlignment.center,
            percent: controller.processQuantity.value / controller.maxProcess,
            progressColor: AppColors.colorBlueX,
            barRadius: const Radius.circular(AppDimens.paddingSmallest),
          ).paddingOnly(
              top: AppDimens.paddingSmallest,
              bottom: AppDimens.paddingSmallest),
        ),
        UtilWidget.sizedBoxWidth10,
        Visibility(
          visible: controller.processQuantity.value > 0,
          child: TextUtils(
            text: "${controller.processQuantity.value * 10}%",
            availableStyle: StyleEnum.titleSmall,
            color: AppColors.colorPrimary1,
            maxLine: 1,
            textAlign: TextAlign.center,
          ).paddingOnly(bottom: AppDimens.paddingSmallest),
        ),
      ],
    );
  }
}
