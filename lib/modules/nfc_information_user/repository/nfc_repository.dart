import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:hilo_ca_integration/modules/modules_src.dart';

class NfcRepository extends BaseRepository {
  NfcRepository(super.controller);

  Future<BaseResponseBECert<VerifySDKResponse>> sendNfcVerify(
    VerifyRequestModel verifyRequestModel,
    SdkRequestAPI sdkRequestAPI,
    bool isProd,
  ) async {
    var response = await baseSendRequest(
      isProd ? AppUrl.verifyC06Prod : AppUrl.verifyC06,
      EnumRequestMethod.post,
      urlOther: isProd ? AppUrl.verifyC06Prod : AppUrl.verifyC06,
      jsonMap: verifyRequestModel.toJson(),
      queryParameters: sdkRequestAPI.toJson(),
    );
    return BaseResponseBECert.fromJson(
      response,
      func: (x) => VerifySDKResponse.fromJson(x),
    );
  }
}
