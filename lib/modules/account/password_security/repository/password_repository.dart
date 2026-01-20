import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/cores/enum/enum_request_method.dart';
import 'package:ecert/cores/values/values.src.dart';
import 'package:ecert/shares/shares_src.dart';

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
