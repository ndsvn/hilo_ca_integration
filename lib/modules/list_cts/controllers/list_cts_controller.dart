import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/modules/list_cts/list_cts.src.dart';
import 'package:hilo_ca_integration/routes/routes.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';

class ListPageController extends BaseRefreshGetxController {
  List<ListCtsModelView> list = [];
  GetListCts getListCts = GetListCts.instance;
  @override
  Future<void> onInit() async {
    await getList();
    super.onInit();
  }

  Future<void> getList() async {
    showLoading();
    list = await getListCts.getListCTS();
    hideLoading();
  }

  String convertStringDate(String dateTimeStr) {
    return convertDateToString(
        convertStringToDate(dateTimeStr, pattern20), pattern1);
  }

  @override
  Future<void> onLoadMore() {
    // TODO: implement onLoadMore
    throw UnimplementedError();
  }

  @override
  Future<void> onRefresh() async {
    await getList();
    refreshController.refreshCompleted();
  }

  void goToDetail(ListCtsModelView item) {
    if (item.listCtsModel.status == "INACTIVE") {
      Get.toNamed(AppRoutes.routeConfirmCTS, arguments: item)?.then((value) {
        onRefresh();
      });
    } else {
      Get.toNamed(AppRoutes.routeDetailCTS, arguments: item);
    }
  }
}
