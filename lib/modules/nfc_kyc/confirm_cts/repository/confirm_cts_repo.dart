import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';

class ConfirmCtsRepo extends BaseRepository {
  ConfirmCtsRepo(super.controller);

  Future<BaseResponseBECert> confirmCts(String certAlias) async {
    var response = await baseSendRequest(
      AppUrl.confirmCert,
      EnumRequestMethod.post,
      jsonMap: {"certAlias": certAlias},
      contentType: Headers.formUrlEncodedContentType,
      receiveTimeout: const Duration(seconds: AppConst.receiveTimeoutRegister),
    );
    return BaseResponseBECert.fromJson(
      response,
    );
  }
}
