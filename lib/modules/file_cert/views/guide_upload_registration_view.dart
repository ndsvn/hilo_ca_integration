import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:flutter/material.dart';

import '../../../cores/cores_src.dart';
import '../../../generated/locales.g.dart';
import '../../../routes/routes.dart';
import '../../../shares/shares_src.dart';

class GuideUploadRegistrationView extends StatelessWidget
    with GuideUploadRegistration {
  const GuideUploadRegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: AppColors.colorWhite,
        appBar: UtilWidget.buildAppBar(
          LocaleKeys.eCert_DKKD_title.tr,
          isColorGradient: false,
          leading: true,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: Get.height / 10),
              Center(
                child: Image.asset(
                  Assets.ASSETS_ECERT_UPLOAD_DKKD_PNG,
                  height: 233.h,
                  width: 350.w,
                ),
              ),
              UtilWidget.sizedBox25,
              TextUtils(
                text: LocaleKeys.eCert_DKKD_content,
                fontWeight: FontWeight.w700,
                color: AppColors.lightPrimaryColor,
                maxLine: 4,
                textAlign: TextAlign.center,
              ).paddingAll(AppDimens.size35),
              Spacer(),
              _buildBtn(),
            ],
          ),
        ));
  }

  Widget _buildBtn() {
    return Column(
      children: [
        UtilWidget.buildButtonPrimary(LocaleKeys.eCert_DKKD_upImage.tr,
            () async {
          Get.bottomSheet(
            UtilWidget.baseBottomSheet(
              title: LocaleKeys.eCert_DKKD_upImage,
              body: _buildBottomSheet(),
              noHeader: true,
            ),
          );
        }),
        UtilWidget.sizedBoxPadding,
        UtilWidget.buildButtonSecond(
          LocaleKeys.eCert_DKKD_upFile.tr,
          () async {
            await checkPermissionUpFile();
          },
        ),
        UtilWidget.buildBottomPading(),
      ],
    ).paddingSymmetric(horizontal: AppDimens.paddingHuge);
  }

  Widget _buildBottomSheet() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        UtilWidget.buildInkwelleCertBsColumn(
          icon: Assets.ASSETS_ECERT_CAMERA_FILL_BORDER_SVG,
          title: LocaleKeys.eCert_DKKD_takePicture.tr,
          function: () => checkPermissionUpImg(ImageSourceApp.camera),
        ),
        UtilWidget.sizedBoxPadding,
        UtilWidget.buildInkwelleCertBsColumn(
          icon: Assets.ASSETS_ECERT_IMAGE_UPLOAD_FILL_BORDER_SVG,
          title: LocaleKeys.eCert_DKKD_uploadImage,
          function: () => checkPermissionUpImg(ImageSourceApp.gallery),
        ),
      ],
    ).paddingSymmetric(horizontal: AppDimens.paddingHuge);
  }
}

mixin GuideUploadRegistration {
  Future<void> checkPermissionUpImg(ImageSourceApp imageSourceApp) async {
    Get.back();
    PermissionStatus status;
    if (GetPlatform.isAndroid) {
      status = await Permission.storage.status;
    } else {
      status = await Permission.photos.status;
    }
    if (status.isGranted) {
      Get.toNamed(AppRoutes.routeGuideUploadRegistrationImgView,
          arguments: imageSourceApp);
    } else {
      PermissionStatus permissionStatus;
      if (GetPlatform.isAndroid) {
        permissionStatus = androidDeviceInfo != null &&
                (androidDeviceInfo?.version.sdkInt ?? 21) > 32
            ? PermissionStatus.granted
            : await checkPermission([Permission.storage]);
      } else {
        permissionStatus = await checkPermission([Permission.photos]);
      }
      switch (permissionStatus) {
        case PermissionStatus.granted:
          Get.toNamed(AppRoutes.routeGuideUploadRegistrationImgView,
              arguments: imageSourceApp);

          break;
        case PermissionStatus.denied:
          break;
        case PermissionStatus.restricted:
        case PermissionStatus.limited:
        case PermissionStatus.permanentlyDenied:
          ShowPopup.openAppSetting(
            content: LocaleKeys.dialog_enableStorePermission.tr,
            titleAction: LocaleKeys.dialog_openAppSetting.tr,
          );
          break;
        default:
          break;
      }
    }
  }

  Future<void> checkPermissionUpFile() async {
    PermissionStatus permissionStatus =
        await checkPermission([Permission.camera]);
    switch (permissionStatus) {
      case PermissionStatus.granted:
        {
          Get.toNamed(AppRoutes.routeGuideUploadRegistrationFileView);
        }
        break;
      case PermissionStatus.permanentlyDenied:
        ShowPopup.openAppSetting(
          content: LocaleKeys.dialog_enableCameraPermission.tr,
          titleAction: LocaleKeys.dialog_openAppSetting.tr,
        );
        break;
      default:
        return;
    }
  }
}
