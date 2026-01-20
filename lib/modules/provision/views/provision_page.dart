import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../cores/cores_src.dart';
import '../../../shares/shares_src.dart';
import '../provision.src.dart';

part 'provision_view.dart';

class ProvisionECertPage extends BaseGetWidget<ProvisionECretController> {
  const ProvisionECertPage({super.key});

  @override
  ProvisionECretController get controller =>
      Get.put(ProvisionECretController());

  @override
  Widget buildWidgets(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: UtilWidget.buildAppBar(
        LocaleKeys.eCert_term,
        isColorGradient: false,
        centerTitle: false,
        leading: true,
        backgroundColor: AppColors.white,
      ),
      body: baseShowLoading(
        () => SizedBox(
            height: Get.height, width: Get.width, child: _itemBody(controller)),
      ),
    );
  }
}
