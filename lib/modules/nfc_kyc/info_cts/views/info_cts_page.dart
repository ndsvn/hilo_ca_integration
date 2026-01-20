import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:hilo_ca_integration/generated/locales.g.dart';
import 'package:hilo_ca_integration/modules/nfc_kyc/info_cts/info_cts.src.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/material.dart';

part 'info_cts_view.dart';

class InfoCTSPage extends BaseGetWidget<InfoCTSPageController> {
  const InfoCTSPage({super.key});

  @override
  InfoCTSPageController get controller => Get.put(InfoCTSPageController());

  @override
  Widget buildWidgets(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Scaffold(
      appBar: UtilWidget.buildAppBar(
        LocaleKeys.eCert_register_appbar.tr,
        isColorGradient: false,
        leading: true,
      ),
      body: buildLoadingOverlay(
        () => SizedBox(
          height: Get.height,
          width: Get.width,
          child: _itemBody(controller),
        ),
        loadingWidget: buildLoadingCTS(),
      ),
    );
  }

  static Widget buildLoadingCTS() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextUtils(
          text: LocaleKeys.eCert_register_loadingTitle.tr,
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
    ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
  }
}
