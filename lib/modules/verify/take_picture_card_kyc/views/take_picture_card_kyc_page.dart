import 'dart:math';

import 'package:camera/camera.dart';
import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/modules/verify/take_picture_card_kyc/take_picture_card_kyc.src.dart';
import 'package:ecert/shares/shares_src.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import '../../../guilde/register_cert.src.dart';

part 'take_picture_card_kyc_view.dart';

class TakePictureCardKycPage
    extends BaseGetWidget<TakePictureCardKycController> {
  const TakePictureCardKycPage({super.key});

  @override
  TakePictureCardKycController get controller =>
      Get.put(TakePictureCardKycController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: UtilWidget.buildAppBar(
        LocaleKeys.nfcResult_appbar.tr,
        isColorGradient: false,
        leading: true,
        backgroundColor: AppColors.colorWhite,
      ),
      backgroundColor: AppColors.colorWhite,
      body: buildLoadingOverlay(() => _body(controller)),
    );
  }
}
