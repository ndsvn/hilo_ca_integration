import 'package:another_flushbar/flushbar.dart';
import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:flutter/material.dart';

import '../../shares_src.dart';

class ShowFlushBar {
  static Future<void> showFlushBar(
    String message, {
    final FlushBarType type = FlushBarType.notification,
    Duration duration = const Duration(seconds: 5),
    final FlushbarPosition position = FlushbarPosition.TOP,
  }) async {
    final Color backgroundColor;
    Color messageColor = AppColors.colorBorderRed;
    final String assetName;
    if (message.length > 150) {
      duration = const Duration(seconds: 6);
    }
    switch (type) {
      case FlushBarType.notification:
        backgroundColor = AppColors.colorBlueText;
        assetName =
            Assets.ASSETS_IMAGES_ICON_ICON_SVG_NOTIFICATION_13_SVGREPO_COM_SVG;
        messageColor = AppColors.colorBack;
        break;
      case FlushBarType.success:
        backgroundColor = AppColors.basicSuccess;
        assetName =
            Assets.ASSETS_IMAGES_ICON_ICON_SVG_SUCCESS_STANDARD_SVGREPO_COM_SVG;
        messageColor = AppColors.colorGreenText;
        break;
      case FlushBarType.error:
        backgroundColor = AppColors.basicError;
        assetName = Assets.ASSETS_IMAGES_ICON_ICON_SVG_ERROR_SVGREPO_COM_SVG;

        break;
      case FlushBarType.warning:
        backgroundColor = AppColors.orangeDisable;
        assetName = Assets.ASSETS_IMAGES_ICON_ICON_SVG_WARNING_SVGREPO_COM_SVG;

        break;
    }
    await Flushbar(
      messageSize: AppDimens.fontSmall(),
      isDismissible: true,
      message: message,
      messageColor: messageColor,
      duration: duration,
      flushbarPosition: position,
      backgroundColor: backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: AppDimens.btnSmall),
      icon: ImageWidget.imageSvg(
        assetName,
        width: AppDimens.paddingHuge,
        color: messageColor,
      ),
      flushbarStyle: FlushbarStyle.GROUNDED,
    ).show(Get.context!);
  }
}

enum FlushBarType { notification, success, warning, error }
