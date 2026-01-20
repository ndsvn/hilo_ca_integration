import 'package:ecert/base_utils/model_base/base_response_be_new.dart';
import 'package:ecert/base_utils/repository_base/base_repository.dart';
import 'package:ecert/cores/enum/enum_request_method.dart';
import 'package:ecert/cores/values/values.src.dart';
import 'package:ecert/modules/verify/live_ness/live_ness_kyc.src.dart';
import 'package:ecert/modules/verify/update_photo_information_kyc/update_photo_information_kyc.src.dart';

class UpdatePhotoInformationRepository extends BaseRepository {
  UpdatePhotoInformationRepository(super.controller);

  Future<BaseResponseBENew<EkycResponse>> checkStatusCard({
    required int taskId,
    required String idCardFront,
    required String idCardBack,
  }) async {
    var response =
        await baseSendRequest(AppUrl.checkCard, EnumRequestMethod.post,
            jsonMap: {
              "taskId": taskId,
              "idCardFront": idCardFront,
              "idCardBack": idCardBack,
            },
            functionError: (e) {});
    return BaseResponseBENew.fromJson(
      response,
      func: (x) => EkycResponse.fromJson(x),
    );
  }

  Future<BaseResponseBENew<FaceMatchingResponse>> checkFaceMatching({
    required int taskId,
    required String idCardFront,
    required String faceFront,
  }) async {
    var response =
        await baseSendRequest(AppUrl.faceMatching, EnumRequestMethod.post,
            jsonMap: {
              "taskId": taskId,
              "idCardFront": idCardFront,
              "faceFront": faceFront,
            },
            functionError: (e) {});
    return BaseResponseBENew.fromJson(
      response,
      func: (x) => FaceMatchingResponse.fromJson(x),
    );
  }
}
