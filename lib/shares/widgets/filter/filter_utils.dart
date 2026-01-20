import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/material.dart';

Widget buildButtonDateOption(String title, RxString dateStr,
    {Function()? onClick}) {
  return TextButton(
    onPressed: onClick,
    style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        // minimumSize: Size(50, 30),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.centerLeft),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtils(
          text: title,
          availableStyle: StyleEnum.titleSmall,
          textAlign: TextAlign.start,
        ).paddingOnly(bottom: AppDimens.paddingSmall),
        Obx(
          () => Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  AppDimens.paddingMedium,
                ),
              ),
              border: Border.all(
                color: AppColors.colorBlack26,
              ),
            ),
            child: Row(
              children: [
                TextUtils(
                  text: initDateTime(dateStr.value),
                ).paddingAll(AppDimens.paddingVerySmall),
                const Spacer(),
                SvgPicture.asset(Assets.ASSETS_IMAGES_ICON_ICON_SVG_IC_DATE_SVG)
                    .paddingAll(AppDimens.paddingVerySmall)
              ],
            ).paddingSymmetric(
              horizontal: AppDimens.paddingVerySmall,
              vertical: AppDimens.paddingSmallest,
            ),
          ),
        ),
      ],
    ),
  );
}

String initDateTime(String dateTime) =>
    dateTime.isEmpty || dateTime == "null" ? "--/--/----" : dateTime;
