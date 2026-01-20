import 'package:hilo_ca_integration/base_utils/views_base/base_widget.dart';
import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:hilo_ca_integration/generated/locales.g.dart';
import 'package:hilo_ca_integration/modules/support/support.rc.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/material.dart';

part 'support_widget.dart';

class SupportPage extends BaseGetWidget<SupportController> {
  const SupportPage({super.key});

  @override
  SupportController get controller => Get.put(SupportController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: UtilWidget.buildAppBar(
        LocaleKeys.eCert_support_appbar,
        backgroundColor: AppColors.colorWhite,
      ),
      backgroundColor: AppColors.colorWhite,
      body: _buildBody(controller),
    );
  }
}
