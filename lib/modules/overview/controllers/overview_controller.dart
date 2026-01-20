import 'dart:async';

import 'package:hilo_ca_integration/base_utils/controllers_base/base_controller.src.dart';
import 'package:hilo_ca_integration/generated/locales.g.dart';
import 'package:hilo_ca_integration/modules/modules_src.dart';
import 'package:hilo_ca_integration/routes/routes.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:hilo_ca_integration/shares/utils/log/dio_log.dart';

class OverviewCtrl extends BaseGetxController {
  int clickCount = 0;
  Timer? clickTimer;

  GetListCts getListCts = GetListCts.instance;

  void showLog() {
    clickCount++;
    if (clickCount == 1) {
      clickTimer = Timer(const Duration(seconds: 2), () {
        clickCount = 0;
      });
    } else if (clickCount >= 5) {
      Diolog().showDiolog();
    }
  }

  @override
  void onClose() {
    clickTimer?.cancel();
    super.onClose();
  }

  Future<void> getList({bool isPersonal = false}) async {
    // AppInfoCert.instance.isPersonal = isPersonal;
    // Get.toNamed(AppRoutes.routeGuideCert);

    var list = await getListCts.getListCTS();
    // Bỏ check CTS đang hoạt động
    // bool hasCTSActive = list.any((e) => e.listCtsModel.status == "ACTIVE");
    ListCtsModelView? ecertInactive =
        list.firstWhereOrNull((e) => e.listCtsModel.status == "INACTIVE");
    // if (hasCTSActive) {
    //   ShowPopup.showDialogNotification(
    //     LocaleKeys.eCert_home_registerContent.tr,
    //     isActiveBack: false,
    //   );
    // } else
    if (ecertInactive != null) {
      ShowPopup.showDialogNotification(
        LocaleKeys.eCert_home_eCertInactive.tr,
        nameAction: LocaleKeys.info_cts_button.tr,
        isActiveBack: false,
        function: () {
          Get.toNamed(AppRoutes.routeConfirmCTS, arguments: ecertInactive);
        },
      );
    } else {
      AppInfoCert.instance.isPersonal = isPersonal;
      AppInfoCert.instance.clearData();
      AppConfig.instance.clearData();
      Get.toNamed(AppRoutes.routeGuideCert);
    }
  }
}
