import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/generated/locales.g.dart';
import 'package:hilo_ca_integration/modules/nfc_kyc/nfc/model/nfc_model.dart';
import 'package:hilo_ca_integration/modules/nfc_kyc/qr/qr.src.dart';
import 'package:hilo_ca_integration/routes/routes.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/material.dart';

class QRController extends BaseGetxController {
  String? barcodeController;
  String? idIdentity;
  String? information;
  String? informationIdCard;
  final AppController appController = Get.find<AppController>();
  NfcModelApp sendNfcRequestModel = NfcModelApp();

  QrInformation qrInformation = QrInformation();

  final idDocumentController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Future<void> onInit() async {
    showLoadingOverlay();
    if (Get.arguments != null) {
      /*if (Get.arguments[1] is DataOcrModel) {
        dataOcrModel = Get.arguments[1];
      }*/
      if (Get.arguments is NfcModelApp) {
        sendNfcRequestModel = Get.arguments;
      }
    }

    hideLoadingOverlay();
    super.onInit();
  }

  void getData(String barcodeScanRes) {
    try {
      qrInformation = GetDataQr.instance.getData(barcodeScanRes);
      if (qrInformation.documentNumber != null) {
        if (AppInfoCert.instance.isPersonal &&
            qrInformation.documentNumber !=
                AppInfoCert.instance.cusInfo.taxCode) {
          showFlushNoti(
            LocaleKeys.eCert_DKKD_invalidCCCDTitle.tr,
            content: LocaleKeys.eCert_DKKD_invalidCCCDContent.tr,
            isSuccess: false,
          );
          // return;
        }else{
          AppConfig.instance.nfcModelApp.number = qrInformation.documentNumber;
          AppConfig.instance.nfcModelApp.registrationDateVMN =
              qrInformation.dateOfIssuer;
          AppConfig.instance.nfcModelApp.residentVMN = qrInformation.address;
          Get.offNamed(AppRoutes.routeAuthenticationNfc);
          return;
        }

      }
    } catch (e) {
      showFlushNoti(
        LocaleKeys.eCert_qr_qrErrorTitle.tr,
        isSuccess: false,
      );
    }
  }
}
