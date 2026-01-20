import 'dart:convert';

import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/modules/nfc_information_user/nfc_information_user_src.dart';
import 'package:ecert/routes/routes.dart';
import 'package:ecert/shares/shares_src.dart';
import 'package:flutter/material.dart';

part 'nfc_information_user_view.dart';

class NfcInformationUserPage extends BaseGetWidget {
  const NfcInformationUserPage({super.key});

  @override
  NfcInformationUserController get controller =>
      Get.put(NfcInformationUserController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: UtilWidget.buildAppBar(
        LocaleKeys.eCert_CCCD_title.tr,
        isColorGradient: false,
        centerTitle: true,
        leading: true,
        backgroundColor: AppColors.colorWhite,
      ),
      body: buildLoadingOverlay(
        () => Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.colorWhite,
                  image: DecorationImage(
                    image: AssetImage(
                      Assets.ASSETS_IMAGES_ICON_ICON_PNG_IMG_BANNER_NFC_PNG,
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: _buildListGuild(controller)
                    .paddingSymmetric(horizontal: AppDimens.defaultPadding),
              ),
            ),
            Obx(
              () => Visibility(
                visible: !controller.isLoadingOverlay.value,
                child: Container(
                  color: AppColors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      UtilWidget.buildButtonPrimary(
                        (controller.isAuthenticationSuccess)
                            ? LocaleKeys.eCert_CCCD_continue.tr
                            : LocaleKeys.eCert_CCCD_return.tr,
                        () async {
                          if (controller.isAuthenticationSuccess) {
                            Get.toNamed(AppRoutes.routeInfoCTS);
                          } else {
                            // controller.verifyAPI();
                            Get.back();
                          }
                        },
                        isLoading: controller.isShowLoading.value,
                      ).paddingSymmetric(
                          horizontal: AppDimens.defaultPadding,
                          vertical: AppDimens.padding14),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
