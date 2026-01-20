import 'dart:convert';

import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/modules/nfc_kyc/face_matching_result/face_matching_result.src.dart';
import 'package:ecert/routes/routes.dart';
import 'package:ecert/shares/shares_src.dart';
import 'package:flutter/material.dart';

part 'face_matching_result_view.dart';

class FaceMatchingResultPage
    extends BaseGetWidget<FaceMatchingResultController> {
  const FaceMatchingResultPage({super.key});

  @override
  FaceMatchingResultController get controller =>
      Get.put(FaceMatchingResultController());

  @override
  Widget buildWidgets(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: UtilWidget.buildAppBar(
        LocaleKeys.live_ness_result_appbar.tr,
        isColorGradient: false,
        leading: true,
        backgroundColor: AppColors.colorWhite,
      ),
      body: buildLoadingOverlay(
        () => SizedBox(
          height: Get.height,
          width: Get.width,
          child: _itemBody(controller),
        ),
        loadingWidget: _buildLoading(),
      ),
    );
  }
}
