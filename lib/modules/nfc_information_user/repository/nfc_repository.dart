import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/modules/modules_src.dart';

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
