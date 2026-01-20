import 'dart:async';

import 'package:hilo_ca_integration/assets/assets.src.dart';
import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:hilo_ca_integration/modules/modules_src.dart';
import 'package:hilo_ca_integration/routes/routes.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:hilo_ca_integration/shares/utils/log/dio_log.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import '../../../../base_utils/base_src.dart';
import '../../../../generated/locales.g.dart';

class LoginController extends BaseGetxController {
  AppController appController = Get.find<AppController>();

  // final formKeyReset = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final taxCodeController = TextEditingController();

  // final userRememberController = TextEditingController();
  // final newPassController = TextEditingController();
  // final reNewPassController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  late RepositoryLogin loginRepository;
  final FocusNode userNameFocus = FocusNode();

  final FocusNode taxCodeFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  // TextEditingController otpText = TextEditingController();
  RxList<BiometricType> biometricTypes = RxList<BiometricType>();

  RxBool isShowTime = false.obs;
  RxBool iUseBiometric = false.obs;
  Timer? clickTimer;
  int clickCount = 0;

  @override
  Future<void> onInit() async {
    loginRepository = RepositoryLogin(this);
    biometricTypes.value = await Biometrics().getAvailableBiometrics() ?? [];

    initText();
    super.onInit();
  }

  @override
  void onClose() {
    clickTimer?.cancel();
    super.onClose();
  }

  void showLog() {
    clickCount++;
    if (clickCount == 1) {
      clickTimer = Timer(const Duration(seconds: 2), () {
        clickCount = 0;
      });
    } else if (clickCount >= 5) {
      Diolog().showDiolog();
    }
  }

  void initText() {
    userNameController.text = hiveApp.get(AppConst.userName) ?? "";
    // passwordController.text = hiveApp.get(AppConst.password) ??"";
    iUseBiometric.value = hiveApp.get(AppConst.loginBiometric) ?? false;
   
  }

  Future<void> funcLogin() async {
    KeyBoard.hide();
    // Get.toNamed(AppRoutes.routeInstructKyc);
    if (formKey.currentState?.validate() ?? false) {
      LoginModelRequest loginModelRequest = LoginModelRequest(
        username: userNameController.text.trim(),
        password: passwordController.text.trim(),
        taxCode: taxCodeController.text.trim(),
        tenantId: AppConfig.instance.getSystemInvoices()?.id ?? "",
      );
      checkConnectivity(function: () async {
        showLoading();
        await loginUserFromLogin(loginModelRequest);
        hideLoading();
      }, functionNoInternet: () async {
        ShowPopup.showErrorMessage(AppStr.errorConnectFailedStr);
      });
    }
  }

  Future<void> loginSuccess(LoginModelResponse response,
      {bool isLoginFromApp = false}) async {
    hiveApp.put(AppConst.keyToken, response.accessToken);
    if (!isLoginFromApp) {
      hiveApp.put(AppConst.userName, userNameController.text.trim());
      hiveApp.put(AppConst.password, passwordController.text.trim());
      hiveApp.put(AppConst.taxCode, taxCodeController.text.trim());
    }

    await getCusInfo(
      isLoginFromApp: isLoginFromApp,
    );
  }

  Future<void> loginUserFromLogin(
    LoginModelRequest loginModelRequest, {
    bool isLoginFromApp = false,
  }) async {
    try {
      BaseResponseBECert<LoginModelResponse> response =
          await loginRepository.loginUser(loginModelRequest);
      await loginResponse(isLoginFromApp, response);
    } catch (e) {
      if (isLoginFromApp) {
        Get.offAllNamed(AppRoutes.routeLogin);
      } else {
        if (!(Get.isDialogOpen ?? false)) {
          showFlushNoti(
            LocaleKeys.login_wrongInfoLogin.tr,
            isSuccess: false,
          );
        }
      }
    }
  }

  Future<void> getCusInfo({
    bool isLoginFromApp = false,
  }) async {
    try {
      BaseResponseBECert<CusInfo> response = await loginRepository.getCusInfo();

      if (response.status) {
        AppInfoCert.instance.cusInfo = response.data!;
        Get.offAllNamed(
          AppRoutes.routeHome,
        );
      } else {
        showFlushNoti(
          LocaleKeys.login_wrongInfoLogin.tr,
          isSuccess: false,
        );
      }
    } catch (e) {
      if (isLoginFromApp) {
        Get.offAllNamed(AppRoutes.routeLogin);
      } else {
        if (!(Get.isDialogOpen ?? false)) {
          showFlushNoti(
            LocaleKeys.login_wrongInfoLogin.tr,
            isSuccess: false,
          );
        }
      }
    }
  }

  Future<void> loginBiometric() async {
    if (iUseBiometric.value) {
      await Biometrics().authenticate(
          // localizedReasonStr: "Quý khách vui lòng quét vân tay hoặc khuôn mặt để xác thực",
          onDeviceUnlockUnavailable: () {
        Fluttertoast.showToast(
            msg: AppStr.msgUnavailable.tr, toastLength: Toast.LENGTH_LONG);
      }, onAfterLimit: () {
        Fluttertoast.showToast(
            msg: AppStr.msgLimit.tr, toastLength: Toast.LENGTH_LONG);
      }).then((isAuthenticated) async {
        if (isAuthenticated != null && isAuthenticated) {
          passwordController.text = hiveApp.get(AppConst.password) ?? "";
          await funcLogin();
        } else {
          showFlushNoti(
            "Xác thực thất bại",
            isSuccess: false,
          );
        }
      });
    } else {
      ShowPopup.showDialogNotification(
        biometricTypes.contains(BiometricType.face)
            ? AppStr.noteSettingBiometricFace.tr
            : AppStr.noteSettingBiometricFingerprint.tr,
        isActiveBack: false,
      );
    }
  }

  Future<void> loginResponse(bool isLoginFromApp,
      BaseResponseBECert<LoginModelResponse> response) async {
    if (response.status) {
      await loginSuccess(response.data!, isLoginFromApp: isLoginFromApp);
    } else {
      if (isLoginFromApp) {
        Get.offAllNamed(AppRoutes.routeLogin);
      } else {
        showFlushNoti(
          LocaleKeys.login_wrongInfoLogin.tr,
          content: response.errors?.firstOrNull?.message?.vn ?? "",
          isSuccess: false,
        );
      }
    }
  }

// Future<void> showDialogOtp(
//   BaseResponseBE<LoginModelResponse> response,
//   bool isLoginFromApp,
//   LoginModelRequest loginModelRequest,
// ) async {
//   String otpId = response.data?.otpId ?? "";
//
//   Get.dialog(
//     OtpWidget.buildDialogOtpCode(
//         textOtp: otpText,
//         typeSend: response.data?.method ?? "",
//         isShowTime: isShowTime,
//         functionConfirm: () async {
//           await functionConfirmOtp(isLoginFromApp, otpId);
//         },
//         address: response.data?.address ?? "",
//         functionSentOtp: () async {
//           await functionResetOtp(loginModelRequest, otpId);
//         }),
//     barrierDismissible: false,
//   ).then((value) {
//     otpText.clear();
//   });
// }

// Future<void> functionResetOtp(
//     LoginModelRequest loginModelRequest, String otpId) async {
//   isShowTime.toggle();
//   BaseResponseBE<LoginModelResponse> responseBe =
//       await loginRepository.loginUser(loginModelRequest);
//   otpId = responseBe.data?.otpId ?? "";
// }

// Future<void> functionConfirmOtp(bool isLoginFromApp, String otpId) async {
//   if (Get.isDialogOpen ?? false) {
//     Get.back();
//   }
//
//   BaseResponseBE responseBe =
//       await loginRepository.loginUserOtp(LoginOtpModelRequest(
//     otp: otpText.text,
//     otpId: otpId,
//   ));
//   if (responseBe.success) {
//     loginResponse(isLoginFromApp, responseBe);
//   } else {
//     showSnackBar(responseBe.message);
//   }
// }
}
