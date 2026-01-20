import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/modules/modules_src.dart';
import 'package:hilo_ca_integration/modules/nfc_kyc/nfc/model/nfc_model.dart';

import '../../../shares/shares_src.dart';

class NfcInformationUserController extends BaseGetxController {
  String? dateOfBirth;
  String? dateOfExpiry;

  // Tạm thời luôn đúng vè BE verify
  RxnBool authenticationSuccess = RxnBool(true);

  NfcModelApp sendNfcRequestModel = NfcModelApp();
  late NfcRepository nfcRepository = NfcRepository(this);

  @override
  void onInit() {
    setupData();
    super.onInit();
  }

  bool get isAuthenticationSuccess => authenticationSuccess.value ?? false;

  Future<void> setupData() async {
    nfcRepository = NfcRepository(this);
    showLoadingOverlay();

    sendNfcRequestModel = AppConfig.instance.nfcModelApp;

    if (sendNfcRequestModel.isView) {
      dateOfBirth = sendNfcRequestModel.dob;
      dateOfExpiry = sendNfcRequestModel.doe;
    } else {
      dateOfBirth = convertDateToString(
        convertStringToDate(
          sendNfcRequestModel.dob,
          pattern5,
        ),
        pattern1,
      );
      dateOfExpiry = convertDateToString(
        convertStringToDate(
          sendNfcRequestModel.doe,
          pattern5,
        ),
        pattern1,
      );
    }
    // await verifyAPI();

    hideLoadingOverlay();
  }

  // Tạm thời không gọi vì BE verify
  // Future<void> verifyAPI() async {
  //   try {
  //     AppInfoCert.instance.setVerifyRequestModel();
  //     VerifyRequestModel verifyRequestModel =
  //         AppInfoCert.instance.verifyRequestModel;
  //     SdkRequestAPI sdkRequestAPI = CreatePararmSDK.sdkRequestAPI(
  //       AppInfoCert.instance.sdkRequestModel,
  //       verifyRequestModel,
  //     );
  //     await nfcRepository
  //         .sendNfcVerify(
  //       AppInfoCert.instance.verifyRequestModel,
  //       sdkRequestAPI,
  //       AppInfoCert.instance.sdkRequestModel.isProd,
  //     )
  //         .then((value) {
  //       if (value.status) {
  //         authenticationSuccess.value = value.data?.result == true;
  //       } else {
  //         authenticationSuccess.value = false;
  //       }
  //     });
  //   } catch (e) {
  //     authenticationSuccess.value = false;
  //   }
  // }
}
