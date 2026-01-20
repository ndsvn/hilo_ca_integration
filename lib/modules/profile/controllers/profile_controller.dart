import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/routes/routes.dart';
import 'package:ecert/shares/shares_src.dart';

class ProfileController extends BaseGetxController {
  bool isFaceID = false;
  RxBool isUseFingerprint = false.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  void funcLogout() async {
    if (Get.isSnackbarOpen) {
      Get.back();
    }
    ShowPopup.showDialogConfirm(
      LocaleKeys.eCert_profile_logoutContent.tr,
      isActiveBack: false,
      title: LocaleKeys.eCert_profile_logoutTitle.tr,
      // cancelFunc: () => ShowDialog.dismissDialog(),
      confirm: () {
        Get.offAllNamed(AppRoutes.routeLogin);
      },
      actionTitle: LocaleKeys.eCert_profile_confirm.tr,
      colorConfirm: AppColors.colorRed,
    );
  }
}
