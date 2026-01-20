import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/modules/list_cts/list_cts.src.dart';
import 'package:ecert/shares/shares_src.dart';

class DetailPageController extends BaseGetxController {
  late ListCtsModelView detail;
  String name = "";
  String seri = "";
  String company = "";
  String infoUser = "";
  String time = "";
  String status = "";

  @override
  Future<void> onInit() async {
    if (Get.arguments != null && Get.arguments is ListCtsModelView) {
      detail = Get.arguments;

      name = detail.distinguishedName.cn ?? "";
      seri = detail.listCtsModel.serial;
      company = detail.issuerName.o ?? "";

      infoUser = detail.distinguishedName.toString();
      time =
          "${convertStringDate(detail.listCtsModel.issueTime)} - ${convertStringDate(detail.listCtsModel.expireTime)}";
      status = ListCTSCollection.colorTitle[detail.listCtsModel.status]?.tr ??
          LocaleKeys.detail_cts_waitActivate.tr;
    }

    super.onInit();
  }

  String convertStringDate(String dateTimeStr) {
    return convertDateToString(
        convertStringToDate(dateTimeStr, pattern20), pattern10);
  }
}
