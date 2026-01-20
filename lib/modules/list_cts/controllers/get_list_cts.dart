import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/modules/list_cts/list_cts.src.dart';

class GetListCts extends BaseGetxController {
  static GetListCts? _instance;

  static GetListCts get instance => _instance ??= GetListCts._internal();

  GetListCts._internal();

  late ListCTSRepository listRepository = ListCTSRepository(this);
  
  List<ListCtsModelView> list = [];

  Future<List<ListCtsModelView>> getListCTS() async {
    BaseResponseListBECert<ListCtsModel> baseResponseList =
        await listRepository.getListCTS();
    final listResult = baseResponseList.data;
    list.clear();
    list.addAll(
        listResult.map((e) => ListCtsModelView.fromListCtsModel(e)).toList());

    return list;
  }
}
