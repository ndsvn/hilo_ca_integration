import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:hilo_ca_integration/modules/modules_src.dart';

class FaceMatchingRepository extends BaseRepository {
  FaceMatchingRepository(super.controller);
  Future<BaseResponseBESDK<FaceMatchSDKResponse>> faceMatching({
    required img1,
    required img2,
    required bool isProd,
    required String merchantKey,
  }) async {
    var response = await baseSendRequest(
        AppUrl.faceMatching, EnumRequestMethod.post,
        jsonMap: {
          "img1": img1,
          "img2": img2,
        },
        queryParameters: {
          "merchantKey": merchantKey,
        },
        urlOther:
            isProd ? AppUrl.faceMatchingOtherProd : AppUrl.faceMatchingOther,
        headersUrlOther: {
          "ApiKey": AppInfoCert.instance.sdkRequestModel?.apiKey ?? "",
        });
    return BaseResponseBESDK<FaceMatchSDKResponse>.fromJson(
      response,
      func: (x) => FaceMatchSDKResponse.fromJson(x),
    );
  }
}
