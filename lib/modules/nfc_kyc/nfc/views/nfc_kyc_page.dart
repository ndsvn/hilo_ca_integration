import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/modules/guilde/register_cert.src.dart';
import 'package:ecert/modules/nfc_kyc/nfc/nfc.src.dart';
import 'package:ecert/shares/shares_src.dart';
import 'package:flutter/material.dart';

part 'nfc_kyc_view.dart';

class ScanNfcKycPage extends BaseGetWidget<ScanNfcKycController> {
  const ScanNfcKycPage({super.key});

  @override
  ScanNfcKycController get controller => Get.put(ScanNfcKycController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: UtilWidget.buildAppBar(
        LocaleKeys.nfcInfo_appbar.tr,
        isColorGradient: false,
        backgroundColor: AppColors.colorWhite,
        leading: true,
      ),
      body: _body(controller),
    );
  }
}
