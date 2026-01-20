import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/modules/modules_src.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../cores/cores_src.dart';
import '../../../generated/locales.g.dart';
import '../../../shares/shares_src.dart';
import '../controller/guide_upload_registration_file_ctrl.dart';

class GuideUploadRegistrationFileView
    extends BaseGetWidget<GuideUploadRegistrationFileCtrl> {
  const GuideUploadRegistrationFileView({super.key});

  @override
  GuideUploadRegistrationFileCtrl get controller =>
      Get.put(GuideUploadRegistrationFileCtrl());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
        // backgroundColor: AppColors.colorWhite,
        appBar: UtilWidget.buildAppBar(
          LocaleKeys.eCert_DKKD_title.tr,
          isColorGradient: false,
          leading: true,
        ),
        body: buildLoadingOverlay(
          () => _buildGuide(),
          loadingWidget: GuideComponent.buildLoadingOCR(),
        ));
  }

  Widget _buildGuide() {
    return SizedBox(
      width: Get.width,
      child: Column(
        children: [
          UtilWidget.sizedBox25,
          Expanded(
            child: Center(
              child: SfPdfViewerTheme(
                data: SfPdfViewerThemeData(
                  backgroundColor: AppColors.colorNeutral5,
                  progressBarColor: AppColors.lightPrimaryColor,
                ),
                child: SfPdfViewer.memory(
                  controller.pickedFiles.value,
                  canShowScrollHead: false,
                  scrollDirection: PdfScrollDirection.vertical,
                  pageSpacing: 4,
                  enableTextSelection: true,
                ),
              ),
            ),
          ),
          _buildBtnResult(),
          UtilWidget.buildBottomPading(),
        ],
      ),
    );
  }

  Widget _buildBtnResult() {
    return UtilWidget.buildTwoButtons(
      titleButtonLeft: LocaleKeys.eCert_DKKD_upRepeatFile.tr,
      titleButtonRight: LocaleKeys.eCert_DKKD_confirm.tr,
      onTapLeft: () {
        controller.pickFile();
      },
      onTapRight: () {
        if (controller.pickedFiles.value.isEmpty) {
          return;
        }
        controller.upFilesAndOCR(controller.pickedFiles.value);
      },
    ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
  }
}
