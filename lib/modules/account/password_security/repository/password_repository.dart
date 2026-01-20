import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/cores/enum/enum_request_method.dart';
import 'package:hilo_ca_integration/cores/values/values.src.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';

class RepositoryPassword extends BaseRepository {
  RepositoryPassword(super.controller);

  Future<BaseResponseBECert> changePass(
    String oldPassword,
    String newPassword,
  ) async {
    var response = await baseSendRequest(
      AppUrl.changePassword,
      EnumRequestMethod.post,
      jsonMap: {
        "oldPassword": oldPassword,
        "newPassword": newPassword,
      },
      contentType: Headers.formUrlEncodedContentType,
    );
    return BaseResponseBECert.fromJson(
      response,
    );
  }
}
