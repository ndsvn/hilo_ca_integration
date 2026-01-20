import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/modules/verify/update_photo_information_kyc/update_photo_information_kyc.src.dart';
import 'package:ecert/shares/shares_src.dart';
import 'package:flutter/material.dart';

import '../../../guilde/register_cert.src.dart';

part 'update_photo_information_kyc_view.dart';

class UpdatePhotoInformationPage
    extends BaseGetWidget<UpdateInformationController> {
  const UpdatePhotoInformationPage({super.key});

  @override
  UpdateInformationController get controller =>
      Get.put(UpdateInformationController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: UtilWidget.buildAppBar(
        LocaleKeys.nfcResult_appbar.tr,
        isColorGradient: false,
        leading: true,
        backgroundColor: AppColors.colorTransparent,
      ),
      backgroundColor: AppColors.colorWhite,
      body: _body(controller),
      // bottomSheet:
      //     _buildButtonContinue(controller).paddingAll(AppDimens.padding15),
    );
  }
}
