import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/generated/locales.g.dart';
import 'package:hilo_ca_integration/modules/modules_src.dart';
import 'package:hilo_ca_integration/routes/routes.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/material.dart';

class ConfirmCTSPageController extends BaseGetxController {
  late SignCtsResponse signCtsResponse;

  TextEditingController name = TextEditingController();
  TextEditingController seri = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController infoUser = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController status = TextEditingController();
  late ConfirmCtsRepo confirmCtsRepo = ConfirmCtsRepo(this);

  @override
  Future<void> onInit() async {
    if (Get.arguments != null) {
      if (Get.arguments is SignCtsResponse) {
        signCtsResponse = Get.arguments;
      } else if (Get.arguments is ListCtsModelView) {
        signCtsResponse = SignCtsResponse.fromListCtsModel(Get.arguments);
      }
    }

    IssuerName issuerName = IssuerName.fromDnString(signCtsResponse.issuer);
    DistinguishedName distinguishedName =
        DistinguishedName.fromDnString(signCtsResponse.subject);
    name.text = distinguishedName.cn ?? "";
    seri.text = signCtsResponse.serial;
    company.text = issuerName.o ?? "";

    infoUser.text = distinguishedName.toString();
    time.text =
        "${convertStringDate(signCtsResponse.issueTime)} - ${convertStringDate(signCtsResponse.expireTime)}";
    status.text = ListCTSCollection.colorTitle[signCtsResponse.status]?.tr ??
        LocaleKeys.detail_cts_waitActivate.tr;

    super.onInit();
  }

  String convertStringDate(String dateTimeStr) {
    return convertDateToString(
        convertStringToDate(dateTimeStr, pattern20), pattern10);
  }

  Future<void> confirmSignCTS() async {
    showLoadingOverlay();

    await confirmCtsRepo
        .confirmCts(signCtsResponse.certAlias)
        .then((value) async {
      if (value.status) {
        Get.until((route) => Get.routing.current == AppRoutes.routeHome);
        showFlushNoti(
          LocaleKeys.eCert_register_registerSuccessCTSTitle.tr,
          content: LocaleKeys.eCert_register_registerSuccessCTSContent.tr,
        );
      } else {
        showFlushNoti(
          LocaleKeys.eCert_register_registerFailCTSTitle.tr,
          content: value.errors?.firstOrNull?.message?.vn ?? "",
          isSuccess: false,
        );
      }
    }).whenComplete(() => hideLoadingOverlay());
  }
}
