import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/modules/account/account_src.dart';
import 'package:ecert/modules/account/resset_password/reset_password_src.dart';
import 'package:ecert/routes/routes.dart';
import 'package:ecert/shares/shares_src.dart';
import 'package:flutter/material.dart';

class PasswordCtrl extends BaseGetxController {
  final formKey = GlobalKey<FormState>();
  late RepositoryPassword repositoryPassword = RepositoryPassword(this);
  // late RepositoryResetPassword repositoryResetPassword =
  //     RepositoryResetPassword(this);
  final passwordOldController = TextEditingController();
  final passwordNewController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode passwordNewFocus = FocusNode();
  final FocusNode passwordConfirmFocus = FocusNode();
  bool isResetPassword = false;
  String resetToken = "";
  String identifier = "";

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is String) {
      isResetPassword = true;
      resetToken = Get.arguments;
      if (Get.isRegistered<ResetPasswordCtrl>()) {
        ResetPasswordCtrl resetPasswordCtrl = Get.find<ResetPasswordCtrl>();
        identifier = resetPasswordCtrl.phoneNumberController.text;
      }
    }
  }

  Future<void> changePassword() async {
    KeyBoard.hide();
    if ((formKey.currentState?.validate() ?? false) /*|| isResetPassword*/) {
      showLoading();
      try {
        await repositoryPassword
            .changePass(passwordOldController.text, passwordNewController.text)
            .then((value) {
          if (value.status) {
            hiveApp.delete(AppConst.password);
            Get.offAllNamed(AppRoutes.routeLogin);
            showFlushNoti(
              LocaleKeys.change_password_changePasswordSuccess.tr,
              duration: const Duration(seconds: 3),
            );
          } else {
            showFlushNoti(
              value.errors?.firstOrNull?.message?.vn ?? "",
              isSuccess: false,
              duration: const Duration(seconds: 3),
            );
          }
        });
      } catch (e) {
        showFlushNoti(
          isResetPassword
              ? LocaleKeys.change_password_resetPasswordError.tr
              : LocaleKeys.change_password_changePasswordError.tr,
          isSuccess: false,
          duration: const Duration(seconds: 3),
        );
      } finally {
        hideLoading();
      }
    }
  }
}
