import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:hilo_ca_integration/generated/locales.g.dart';
import 'package:hilo_ca_integration/modules/detail_cts/detail_cts.src.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/material.dart';

part 'detail_cts_view.dart';

class DetailCTSPage extends BaseGetWidget<DetailPageController> {
  const DetailCTSPage({super.key});

  @override
  DetailPageController get controller => Get.put(DetailPageController());

  @override
  Widget buildWidgets(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: UtilWidget.buildAppBar(
        LocaleKeys.eCert_listCTS_detail_cts.tr,
        isColorGradient: false,
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
