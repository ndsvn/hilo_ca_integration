import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/cores/theme/colors.dart';
import 'package:hilo_ca_integration/generated/locales.g.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/material.dart';

import '../../../cores/values/values.src.dart';
import '../overview_src.dart';

part 'overview_widget.dart';

class OverviewPage extends BaseGetWidget<OverviewCtrl> {
  const OverviewPage({super.key});

  @override
  OverviewCtrl get controller => Get.put(OverviewCtrl());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      body: _buildBody(controller),
    );
  }
}
