import 'package:ecert/base_utils/views_base/base_widget.dart';
import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/modules/account/resset_password/reset_password_src.dart';
import 'package:ecert/shares/shares_src.dart';
import 'package:ecert/shares/widgets/count_down.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

part 'reset_password_widget.dart';

class ResetPasswordPage extends BaseGetWidget<ResetPasswordCtrl> {
  const ResetPasswordPage({super.key});

  @override
  ResetPasswordCtrl get controller => Get.put(ResetPasswordCtrl());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: UtilWidget.buildAppBar(
        "",
      ),
      body: _buildBody(controller),
    );
  }
}
