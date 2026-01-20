import 'dart:math';

import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/modules/guilde/register_cert.src.dart';
import 'package:ecert/modules/nfc_kyc/qr/qr.src.dart';
import 'package:ecert/shares/shares_src.dart';
import 'package:flutter/material.dart';

part 'qr_view.dart';

class QRGuidePage extends BaseGetWidget<QRController> {
  const QRGuidePage({super.key});

  @override
  QRController get controller => Get.put(QRController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
        appBar: UtilWidget.buildAppBar(
          LocaleKeys.eCert_qr_qrTitle.tr,
          isColorGradient: false,
          leading: true,
          backgroundColor: AppColors.colorWhite,
        ),
        backgroundColor: AppColors.colorWhite,
        body: buildLoadingOverlay(() => _buildBody(controller)));
  }
}
