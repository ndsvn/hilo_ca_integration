import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';

class RegisterInfoCtsRepo extends BaseRepository {
  RegisterInfoCtsRepo(super.controller);

  Future<BaseResponseBECert<SignCtsResponse>> register(
      RegistrationRequest registrationRequest) async {
    var response = await baseSendRequest(
      AppUrl.registerCert,
      EnumRequestMethod.post,
      jsonMap: AppInfoCert.instance.isPersonal
          ? registrationRequest.toJsonPersonal()
          : registrationRequest.toJson(),
      // jsonMap: registrationRequest.toJsonMock(),
      enableChunkedTransfer: true,
      receiveTimeout: const Duration(seconds: AppConst.receiveTimeoutRegister),
    );
    return BaseResponseBECert.fromJson(
      response,
      func: (x) => SignCtsResponse.fromJson(x),
    );
  }
}
