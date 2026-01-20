import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../cores/cores_src.dart';
import '../../../generated/locales.g.dart';
import '../../../shares/shares_src.dart';

class GuideComponent {
  static Widget itemBody(List<Widget> listGuide, Function func) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UtilWidget.sizedBox20,
                ...listGuide,
                UtilWidget.sizedBox10,
              ],
            ),
          ),
        ),
        UtilWidget.buildButtonPrimary(
          LocaleKeys.instruct_kyc_button.tr,
          func,
        ),
        GetPlatform.isAndroid ? UtilWidget.sizedBox10 : UtilWidget.sizedBox15,
      ],
    ).paddingSymmetric(horizontal: AppDimens.iconVerySmall);
  }

  static Widget buildIconNext() {
    return SvgPicture.asset(
      Assets.ASSETS_ECERT_ICONNEXTSTEP_SVG,
    ).paddingSymmetric(vertical: AppDimens.defaultPadding);
  }

  static Widget itemInstruct({
    required String step,
    required String content,
    required String image,
    bool isSVG = false,
  }) {
    return CardWidgets(
      // height: 110.h,
      // width: 350.w,
      radius: AppDimens.radiusBig,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: step,
                  customStyle: FontStyleUtils.fontStyleOpenSans(
                    fontSize: AppDimens.sizeTextMediumTb,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextUtils(
                  text: content,
                  customStyle: FontStyleUtils.fontStyleOpenSans(
                    fontSize: AppDimens.sizeTextSmaller,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLine: 4,
                )
              ],
            ).paddingSymmetric(
              horizontal: AppDimens.defaultPadding,
              vertical: AppDimens.paddingVerySmall,
            ),
          ),
          isSVG
              ? SvgPicture.asset(
                  image,
                  width: 100.h,
                  height: 67.h,
                )
              : Image.asset(
                  image,
                  width: 100.h,
                  height: 67.h,
                ),
        ],
      ).paddingAll(AppDimens.defaultPadding),
    );
  }

  static Widget builsStep(String step, String content) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(
              color: AppColors.lightPrimaryColor,
              width: 1,
            ),
          ),
          child: TextUtils(
            text: step,
            availableStyle: StyleEnum.bodySmall,
            color: AppColors.colorNeutral2,
          ).paddingAll(AppDimens.paddingVerySmall),
        ).paddingAll(AppDimens.paddingVerySmall),
        Expanded(
          child: TextUtils(
            text: content,
            availableStyle: StyleEnum.bodySmall,
            color: AppColors.colorNeutral2,
            maxLine: 3,
          ),
        ),
      ],
    );
  }

  static Widget builsStepTitle(String step, String content) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextUtils(
          text: step,
          availableStyle: StyleEnum.titleMedium,
          color: AppColors.colorTitleStep,
        ),
        Flexible(
          child: TextUtils(
            text: content,
            availableStyle: StyleEnum.titleMedium,
            maxLine: 2,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }

  static Widget buildLoadingOCR() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextUtils(
          text: LocaleKeys.eCert_guide_loadingTitle.tr,
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
}
