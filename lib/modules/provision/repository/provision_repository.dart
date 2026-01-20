import '../../../base_utils/base_src.dart';
import '../../../cores/cores_src.dart';

class ProvisionECertRepository extends BaseRepository {
  ProvisionECertRepository(super.controller);

  Future<BaseResponseBE<String>> getPolicyRepository() async {
    var response = await baseSendRequest(
      AppUrl.getProvision,
      EnumRequestMethod.get,
      // jsonMap: registerRequestModel.toJson(),
    );
    return BaseResponseBE.fromJson(
      response,
    );
  }
}
