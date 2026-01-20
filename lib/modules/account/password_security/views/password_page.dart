import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/modules/account/account_src.dart';
import 'package:ecert/shares/shares_src.dart';
import 'package:flutter/material.dart';

part 'password_widget.dart';

class PasswordSecurityPage extends BaseGetWidget<PasswordCtrl> {
  const PasswordSecurityPage({super.key});

  @override
  PasswordCtrl get controller => Get.put(PasswordCtrl());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: UtilWidget.buildAppBar(
        LocaleKeys.eCert_changePass_title,
        backgroundColor: AppColors.colorWhite,
      ),
      backgroundColor: AppColors.colorWhite,
      body: _buildBody(controller),
    );
  }
}
