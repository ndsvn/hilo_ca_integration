import 'package:hilo_ca_integration/assets/assets.src.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

class Biometrics {
  factory Biometrics() => _singleton;

  Biometrics._internal();

  static final Biometrics _singleton = Biometrics._internal();

  LocalAuthentication auth = LocalAuthentication();

  Future<bool?> checkBiometrics() async {
    bool? canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } catch (e) {
      // print(e);
    }

    return canCheckBiometrics;
  }

  Future<List<BiometricType>?> getAvailableBiometrics() async {
    List<BiometricType>? availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } catch (e) {
      // print(e);
    }

    return availableBiometrics;
  }

  Future<bool?> authenticate(
      {String localizedReasonStr = AppStr.authenticationTitle,
      Function? onDeviceUnlockUnavailable,
      Function? onAfterLimit}) async {
    bool authenticated = false;
    auth = LocalAuthentication();
    try {
      authenticated = await auth.authenticate(
        authMessages: <AuthMessages>[
          IOSAuthMessages(
            cancelButton: AppStr.cancelButton.tr,
            goToSettingsButton: AppStr.setting.tr,
            goToSettingsDescription: AppStr.authenticationContent.tr,
            lockOut: AppStr.lockout.tr,
          ),
          AndroidAuthMessages(
            cancelButton: AppStr.cancelButton.tr,
            biometricHint: AppStr.authentication.tr,
            biometricNotRecognized: AppStr.authenticationError.tr,
            biometricRequiredTitle: AppStr.authentication.tr,
            biometricSuccess: AppStr.authenticationSuccess.tr,
            goToSettingsButton: AppStr.setting.tr,
            goToSettingsDescription: AppStr.authentication.tr,
            signInTitle: AppStr.authentication.tr,
          ),
        ],
        localizedReason: localizedReasonStr.tr,
        options: const AuthenticationOptions(
            useErrorDialogs: false,
            sensitiveTransaction: false,
            stickyAuth: true),
      );
    } catch (e) {
      if (e is PlatformException) {
        if (e.code == auth_error.lockedOut) {
          if (onAfterLimit!() != null) {
            onAfterLimit();
          }
        } else if (e.code == auth_error.notEnrolled ||
            e.code == auth_error.notAvailable) {
          ShowPopup.showDialogConfirm(
            AppStr.noAuthenticationError.tr,
            actionTitle: AppStr.setting.tr,
            confirm: () {
              AppSettings.openAppSettings(type: AppSettingsType.security);
              // Get.back();
            },
          );
          // ShowPopup.showDialogConfirm(AppStr.biometricDeviceUnAvailable.tr,
          //     confirm: () {
          //   AppSettings.openSecuritySettings();
          //   Get.back();
          // }, actionTitle: AppStr.openSettings.tr);
        } else if (e.code == auth_error.passcodeNotSet) {
          if (onDeviceUnlockUnavailable != null) {
            onDeviceUnlockUnavailable();
            return null;
          } else {
            authenticated = true;
          }
        }
      }

      try {
        auth.stopAuthentication();
      } catch (ex) {}
    }
    return authenticated;
  }

  void cancelAuthentication() {
    auth.stopAuthentication();
  }
}
