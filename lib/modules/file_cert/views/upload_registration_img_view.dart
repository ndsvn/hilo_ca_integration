import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/modules/guilde/register_cert.src.dart';
import 'package:flutter/material.dart';

import '../../../cores/cores_src.dart';
import '../../../generated/locales.g.dart';
import '../../../shares/shares_src.dart';
import '../controller/guide_upload_registration_img_ctrl.dart';

class GuideUploadRegistrationImgView
    extends BaseGetWidget<GuideUploadRegistrationImgCtrl> {
  const GuideUploadRegistrationImgView({super.key});

  @override
  GuideUploadRegistrationImgCtrl get controller =>
      Get.put(GuideUploadRegistrationImgCtrl());

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
        () => controller.imageResult.value.isEmpty
            ? _buildGuide()
            : _buildResult(),
        loadingWidget: GuideComponent.buildLoadingOCR(),
      ),
    );
  }

  Widget _buildGuide() {
    return Center(
        child: UtilWidget.buildLoading(colorIcon: AppColors.lightPrimaryColor));
  }

  Widget _buildResult() {
    return Column(
      children: [
        UtilWidget.sizedBox25,
        Expanded(
          child: Image.memory(
            controller.imageResult.value,
            width: 350.w,
          ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
        ),
        UtilWidget.sizedBox25,
        _buildBtnResult(),
      ],
    );
  }

  Widget _buildBottomSheet() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        UtilWidget.buildInkwelleCertBsColumn(
          icon: Assets.ASSETS_ECERT_CAMERA_FILL_BORDER_SVG,
          title: LocaleKeys.eCert_DKKD_takePicture.tr,
          function: () => controller.getTakePicture(isBack: true),
        ),
        UtilWidget.sizedBoxPadding,
        UtilWidget.buildInkwelleCertBsColumn(
          icon: Assets.ASSETS_ECERT_IMAGE_UPLOAD_FILL_BORDER_SVG,
          title: LocaleKeys.eCert_DKKD_uploadImage,
          function: () => controller.getImageFromGallery(isBack: true),
        ),
      ],
    ).paddingSymmetric(horizontal: AppDimens.paddingHuge);
  }

  Widget _buildBtnResult() {
    return UtilWidget.buildTwoButtons(
      titleButtonLeft: LocaleKeys.eCert_DKKD_upRepeat.tr,
      titleButtonRight: LocaleKeys.eCert_DKKD_confirm.tr,
      onTapLeft: () async {
        Get.bottomSheet(
          UtilWidget.baseBottomSheet(
            title: LocaleKeys.eCert_DKKD_upRepeat,
            noHeader: true,
            body: _buildBottomSheet(),
          ),
        );
      },
      onTapRight: () {
        controller.upFilesAndOCR(controller.imageResult.value);
      },
    ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
  }
}
