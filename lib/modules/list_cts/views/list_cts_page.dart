import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:hilo_ca_integration/generated/locales.g.dart';
import 'package:hilo_ca_integration/modules/list_cts/list_cts.src.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/material.dart';

part 'list_cts_view.dart';

class ListCTSPage extends BaseGetWidget<ListPageController> {
  const ListCTSPage({super.key});

  @override
  ListPageController get controller => Get.put(ListPageController());

  @override
  Widget buildWidgets(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      appBar: UtilWidget.buildAppBar(
        LocaleKeys.list_cts_appbar.tr,
        isColorGradient: false,
        leading: false,
        backgroundColor: AppColors.colorWhite,
      ),
      body: baseShowLoading(
        () => SizedBox(
            height: Get.height, width: Get.width, child: _itemBody(controller)),
      ),
    );
  }
}
