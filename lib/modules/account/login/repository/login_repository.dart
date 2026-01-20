import 'package:ecert/cores/enum/enum_request_method.dart';
import 'package:ecert/cores/values/values.src.dart';
import 'package:ecert/shares/shares_src.dart';

import '../../../../base_utils/base_src.dart';
import '../../../modules_src.dart';

class RepositoryLogin extends BaseRepository {
  RepositoryLogin(super.controller);

  Future<BaseResponseBECert<LoginModelResponse>> loginUser(
      LoginModelRequest loginModelRequest) async {
    var response = await baseSendRequest(
      AppUrl.login,
      EnumRequestMethod.post,
      jsonMap: loginModelRequest.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      functionError: (e) {},
    );
    return BaseResponseBECert.fromJson(
      response,
      func: (x) => LoginModelResponse.fromJson(x),
    );
  }

  // Future<BaseResponseBENew<LoginModelResponse>> loginUserToToken(
  //     LoginModelRequest loginModelRequest) async {
  //   var response = await baseSendRequest(AppUrl.login, EnumRequestMethod.post,
  //       jsonMap: loginModelRequest.toJsonToken(), isToken: false);
  //   return BaseResponseBENew.fromJson(
  //     response,
  //     func: (x) => LoginModelResponse.fromJson(x),
  //   );
  // }

  Future<BaseResponseBECert<CusInfo>> getCusInfo() async {
    var response = await baseSendRequest(
      AppUrl.cusInfo,
      EnumRequestMethod.get,
      functionError: (e) {},
    );
    return BaseResponseBECert.fromJson(
      response,
      func: (x) => CusInfo.fromJson(x),
    );
  }
}
