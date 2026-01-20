import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/routes/routes.dart';
import 'package:ecert/shares/shares_src.dart';
import 'package:flutter/material.dart';

import '../reset_password_src.dart';

class ResetPasswordCtrl extends BaseGetxController {
  final formKey = GlobalKey<FormState>();
  late RepositoryResetPassword repositoryResetPassword =
      RepositoryResetPassword(this);
  final phoneNumberController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  final FocusNode phoneNumberConFocus = FocusNode();
  RxBool isConfirmEmail = false.obs;
  String email = '';
  RxBool isLifeTime = false.obs;
  RxInt remainingSeconds = (120).obs;
  RxBool isLoadResend = false.obs;

  Future<void> changePassword({bool isResend = false}) async {
    KeyBoard.hide();
    if (formKey.currentState?.validate() ?? false || isResend) {
      try {
        isResend ? isLoadResend.value = true : showLoading();
        await repositoryResetPassword
            .forgotPassword(identifier: phoneNumberController.text)
            .then((value) {
          if (value.statusCode == AppConst.statusCodeSuccess) {
            isConfirmEmail.value = true;
            isLifeTime.value = true;
          }
        });
      } catch (e) {
        showFlushNoti(
          isResend
              ? LocaleKeys.reset_pass_resendFail.tr
              : LocaleKeys.reset_pass_ErrorEmail.tr,
          isSuccess: false,
        );
      } finally {
        isResend ? isLoadResend.value = false : hideLoading();
      }
    }
  }

  Future<void> verifyOTP() async {
    KeyBoard.hide();
    try {
      if (pinController.text.length < 6) {
        showFlushNoti(
          LocaleKeys.reset_pass_ErrorOTP.tr,
          isSuccess: false,
        );
        return;
      }
      showLoading();
      await repositoryResetPassword
          .verifyOtp(
              identifier: phoneNumberController.text, otp: pinController.text)
          .then((value) {
        if (value.statusCode == AppConst.statusCodeSuccess) {
          Get.toNamed(AppRoutes.routePasswordSecurity,
              arguments: value.data?.resetToken ?? "");
          // isConfirmEmail.value = true;
        }
      });
    } catch (e) {
      showFlushNoti(
        LocaleKeys.reset_pass_ErrorOTP.tr,
        isSuccess: false,
      );
    } finally {
      hideLoading();
    }
  }
}
