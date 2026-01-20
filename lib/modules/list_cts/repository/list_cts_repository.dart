import 'package:hilo_ca_integration/cores/enum/enum_request_method.dart';
import 'package:hilo_ca_integration/cores/values/values.src.dart';
import 'package:hilo_ca_integration/modules/list_cts/list_cts.src.dart';

import '../../../base_utils/base_src.dart';

class ListCTSRepository extends BaseRepository {
  ListCTSRepository(super.controller);

  Future<BaseResponseListBECert<ListCtsModel>> getListCTS() async {
    var response = await baseSendRequest(
      AppUrl.listCert,
      EnumRequestMethod.get,
    );
    return BaseResponseListBECert.fromJson(
      response,
      (x) => ListCtsModel.fromJson(x),
    );
  }
}
