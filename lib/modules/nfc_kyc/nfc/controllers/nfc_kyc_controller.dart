import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:hilo_ca_integration/generated/locales.g.dart';
import 'package:hilo_ca_integration/modules/nfc_kyc/nfc_dialog/nfc_dialog.src.dart';
import 'package:hilo_ca_integration/routes/routes.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:hilo_ca_integration/shares/widgets/bottom_sheet/bottom_sheet_check_nfc.dart';
import 'package:flutter/material.dart';

class ScanNfcKycController extends BaseGetxController
    with WidgetsBindingObserver {
  final RxBool maybeContinue = false.obs;
  final idDocumentController = TextEditingController();
  final userNameController = TextEditingController();
  final dobController = TextEditingController();
  final doeController = TextEditingController();
  AppController appController = Get.find<AppController>();
  final Rx<FocusNode> idDocumentFocus = FocusNode().obs;
  final Rx<FocusNode> userNameFocus = FocusNode().obs;
  final Rx<FocusNode> dobFocus = FocusNode().obs;
  final Rx<FocusNode> doeFocus = FocusNode().obs;
  String statusNFC = "";

  final formKey = GlobalKey<FormState>();

  @override
  Future<void> onInit() async {
    idDocumentController.text = AppConfig.instance.nfcModelApp.number ??
        AppInfoCert.instance.cusInfo.code;
    // idDocumentController.text = "020098007724";
    // dobController.text = appController.qrUserInformation.dateOfBirth ?? "";
    // doeController.text = appController.qrUserInformation.dateOfIssuer ?? "";
    statusNFC = await CheckSupportNfc.checkNfcAvailability();

    super.onInit();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      statusNFC = await CheckSupportNfc.checkNfcAvailability();
      if (Get.currentRoute == AppRoutes.routeAuthenticationNfc) {
        if (statusNFC == AppConst.nfcAvailable) {
          if (Get.isBottomSheetOpen ?? false) {
            Get.back();
            showFlushNoti(LocaleKeys.nfcDialog_nfcOpen.tr);
          }
        }
      }
    }
  }

  Future<void> scanNfc() async {
    // ShowDialog.funcOpenBottomSheet(const NfcDialog());
    if (statusNFC == AppConst.nfcAvailable) {
      if (GetPlatform.isIOS) {
        NfcDialogController nfcDialogController =
            Get.put(NfcDialogController());
        await nfcDialogController.scanNFC();
      } else if (GetPlatform.isAndroid) {
        UtilWidget.funcOpenBottomSheet(const NfcDialog());
      }
    } else if (statusNFC == AppConst.nfcDisabled) {
      showNfcBottomSheet(true);
    } else if (statusNFC == AppConst.nfcDisabledNotSupported) {
      showNfcBottomSheet(false);
    }
  }

  void showNfcBottomSheet(bool isSupportNfc) {
    Get.bottomSheet(
      UtilWidget.baseBottomSheet(
        title: "",
        body: BottomSheetCheckNfc(isSupportNfc),
        noHeader: true,
      ),
      isScrollControlled: true,
    );
  }
}
