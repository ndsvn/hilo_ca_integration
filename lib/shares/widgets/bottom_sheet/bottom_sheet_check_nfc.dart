import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/material.dart';

import '../../../generated/locales.g.dart';

class BottomSheetCheckNfc extends StatelessWidget {
  final bool isSupportNfc;

  const BottomSheetCheckNfc(this.isSupportNfc, {super.key});

  String getTitle() {
    return isSupportNfc
        ? LocaleKeys.nfcDialog_titleInstallationGuide.tr
        : LocaleKeys.nfcDialog_titleNotAvailable.tr;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextUtils(
          text: getTitle(),
          availableStyle: StyleEnum.bodyMedium,
          color: AppColors.colorBlueX,
        ),
        UtilWidget.sizedBox15,
        SvgPicture.asset(
            isSupportNfc
                ? Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_NO_SUPPORT_NFC_SVG
                : Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_NO_SUPPORT_NFC_SVG,
            colorFilter:
                const ColorFilter.mode(AppColors.colorBlueX, BlendMode.srcIn)),
        UtilWidget.sizedBox15,
        Visibility(
          visible: isSupportNfc,
          child: _buildInstallationGuide(),
        ),
        Visibility(
          visible: !isSupportNfc,
          child: _buildContactSupport(),
        ),
        UtilWidget.sizedBox15,
        isSupportNfc
            ? UtilWidget.buildButton(
                LocaleKeys.nfcDialog_setting.tr,
                () {
                  AppSettings.openAppSettings(type: AppSettingsType.nfc);
                },
                backgroundColor: AppColors.colorBlueX,
              ).paddingSymmetric(vertical: AppDimens.paddingSmallest)
            : _buildBottomContactSupport()
      ],
    );
  }

  Widget _buildInstallationGuide() {
    return RichText(
      text: TextSpan(
        text: LocaleKeys.nfcDialog_contentInstallationGuideOne.tr,
        style: FontStyleUtils.fontStyleSans(color: Colors.black),
        children: [
          TextSpan(
            text: LocaleKeys.nfcDialog_contentInstallationGuideTwo.tr,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: LocaleKeys.nfcDialog_contentInstallationGuideThree.tr),
          TextSpan(
            text: LocaleKeys.nfcDialog_contentInstallationGuideFour.tr,
          ),
          TextSpan(
            text: LocaleKeys.nfcDialog_contentInstallationGuideFive.tr,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildBottomContactSupport() {
    return UtilWidget.buildButton(
      LocaleKeys.nfcDialog_contact.tr,
      () async {
        // await UtilWidget.launchInBrowser(LocaleKeys.nfcDialog_check_nfc_number_hotline.tr)
        //     .then((value) {
        //   if (Get.isBottomSheetOpen ?? false) {
        //     Get.back();
        //   }
        // });
      },
      backgroundColor: AppColors.white,
      colorText: AppColors.colorBlueX,
    ).paddingSymmetric(vertical: AppDimens.paddingSmall);
  }

  Widget _buildContactSupport() {
    return RichText(
      text: TextSpan(
        text: LocaleKeys.nfcDialog_titleNotAvailable.tr,
        style: FontStyleUtils.fontStyleSans(color: Colors.black),
        children: const [
          // TextSpan(text: LocaleKeys.nfcDialog_check_nfc_please_contact.tr),
          // TextSpan(
          //   text: LocaleKeys.nfcDialog_check_nfc_hotline.tr,
          //   style: FontStyleUtils.fontStyleSans(
          //     color: AppColors.primaryBlue1,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // TextSpan(
          //   text: LocaleKeys.nfcDialog_check_nfc_number_hotline.tr,
          //   style: FontStyleUtils.fontStyleSans(
          //     color: AppColors.primaryBlue1,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // TextSpan(text: LocaleKeys.nfcDialog_check_nfc_support.tr),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
