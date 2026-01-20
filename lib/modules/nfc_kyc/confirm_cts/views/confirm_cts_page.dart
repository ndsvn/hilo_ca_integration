import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:hilo_ca_integration/generated/locales.g.dart';
import 'package:hilo_ca_integration/modules/nfc_kyc/confirm_cts/confirm_cts.src.dart';
import 'package:hilo_ca_integration/routes/routes.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/material.dart';

part 'confirm_cts_view.dart';

class ConfirmCTSPage extends BaseGetWidget<ConfirmCTSPageController> {
  const ConfirmCTSPage({super.key});

  @override
  ConfirmCTSPageController get controller =>
      Get.put(ConfirmCTSPageController());

  @override
  Widget buildWidgets(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.colorWhite,
        appBar: UtilWidget.buildAppBar(
          LocaleKeys.eCert_confirm_cts_appbar.tr,
          isColorGradient: false,
          leading: true,
          centerTitle: false,
          funcLeading: () {
            Get.until((route) => Get.routing.current == AppRoutes.routeHome);
          },
          backgroundColor: AppColors.colorWhite,
        ),
        body: buildLoadingOverlay(
          () => SizedBox(
              height: Get.height,
              width: Get.width,
              child: _itemBody(controller)),
        ),
      ),
    );
  }
}
