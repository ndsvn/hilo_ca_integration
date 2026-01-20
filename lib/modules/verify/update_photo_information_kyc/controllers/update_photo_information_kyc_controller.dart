import 'dart:typed_data';

import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:hilo_ca_integration/generated/locales.g.dart';
import 'package:hilo_ca_integration/modules/nfc_kyc/nfc_kyc.src.dart';
import 'package:hilo_ca_integration/modules/verify/update_photo_information_kyc/update_photo_information_kyc.src.dart';
import 'package:hilo_ca_integration/routes/routes.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/painting.dart';

class UpdateInformationController extends BaseGetxController {
  late UpdatePhotoInformationRepository updatePhotoInformationRepository =
      UpdatePhotoInformationRepository(this);
  FilesImageModel filesImageFront = FilesImageModel(
    fileData: Rx<Uint8List?>(null),
    fileType: AppConst.fileTypeFront,
  );
  FilesImageModel filesImageBack = FilesImageModel(
    fileData: Rx<Uint8List?>(null),
    fileType: AppConst.fileTypeBack,
  );

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<void> routeTakePicture(bool isTakeFront) async {
    await _checkPermissionApp(
        onTap: () => Get.toNamed(
              AppRoutes.routeTakePictureCardKyc,
              arguments: isTakeFront,
            ));
  }

  Future<void> _checkPermissionApp({required VoidCallback onTap}) async {
    PermissionStatus permissionStatus =
        await checkPermission([Permission.camera]);
    switch (permissionStatus) {
      case PermissionStatus.granted:
        {
          onTap();
        }
        break;
      case PermissionStatus.permanentlyDenied:
        ShowPopup.openAppSetting(
          content: "",
          titleAction: LocaleKeys.pdfPage_openSetting.tr,
        );
        break;
      default:
        return;
    }
  }

  String checkStatusImage() {
    String error = "";
    if (filesImageFront.fileData.value == null) {
      error = LocaleKeys.eCert_CCCD_validateCardFront.tr;
      return error;
    } else if (filesImageBack.fileData.value == null) {
      error = LocaleKeys.eCert_CCCD_validateCardBack.tr;
      return error;
    }
    return error;
  }

  Future<void> getORC() async {
    if (checkStatusImage() == "") {
      // Get.toNamed(AppRoutes.routeScanQR);

      await checkQrInfo();
    } else {
      showFlushNoti(
        checkStatusImage(),
        isSuccess: false,
      );
    }
  }

  Future<void> checkQrInfo() async {
    if (AppConfig.instance.nfcModelApp.registrationDateVMN != null) {
      Get.toNamed(AppRoutes.routeAuthenticationNfc);
    } else {
      // await _scanQRNative();
      Get.toNamed(AppRoutes.routeScanQR);
    }
  }

  Future<void> _scanQRNative() async {
    final result = await FlutterQrScanner.scanQR();

    if (result?["content"] != null) {
      QrInformation qrInformation =
          GetDataQr.instance.getData(result?["content"] ?? "");
      AppConfig.instance.nfcModelApp.number = qrInformation.documentNumber;
      AppConfig.instance.nfcModelApp.registrationDateVMN =
          qrInformation.dateOfIssuer;
      AppConfig.instance.nfcModelApp.residentVMN = qrInformation.address;
      Get.toNamed(AppRoutes.routeAuthenticationNfc);
    } else {
      showFlushNoti(
        LocaleKeys.eCert_qr_qrErrorTitle.tr,
        isSuccess: false,
      );
    }
  }
}
