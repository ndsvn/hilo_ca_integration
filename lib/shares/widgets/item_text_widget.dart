import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/shares/shares_src.dart';
import 'package:flutter/material.dart';

class ItemTextWidget {
  static Widget buildItemText(String title, String? content) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextUtils(
              text: title,
              availableStyle: StyleEnum.titleSmall,
              maxLine: 2,
              color: AppColors.colorNeutral2,
            ),
            UtilWidget.sizedBox10,
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.colorNeutral3,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(AppDimens.radius12),
              ),
              child: TextUtils(
                text: content ?? "",
                availableStyle: StyleEnum.titleSmall,
                color: AppColors.colorNeutral1,
                maxLine: 4,
                fontWeight: FontWeight.w600,
              ).paddingAll(AppDimens.defaultPadding),
            ),
          ],
        ),
        UtilWidget.sizedBox15,
      ],
    );
  }
}
