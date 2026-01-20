import 'package:ecert/base_utils/model_base/base_response_be_new.dart';
import 'package:ecert/base_utils/repository_base/base_repository.dart';
import 'package:ecert/cores/enum/enum_request_method.dart';
import 'package:ecert/cores/values/values.src.dart';
import 'package:ecert/modules/account/resset_password/reset_password_src.dart';

class RepositoryResetPassword extends BaseRepository {
  RepositoryResetPassword(super.controller);

  Future<BaseResponseBENew> forgotPassword({
    required String identifier,
  }) async {
    var response =
        await baseSendRequest(AppUrl.forgotPassword, EnumRequestMethod.post,
            jsonMap: {
              "identifier": identifier,
            },
            functionError: (e) {});
    return BaseResponseBENew.fromJson(
      response,
    );
  }

  Future<BaseResponseBENew<VerifyOtpModel>> verifyOtp({
    required String identifier,
    required String otp,
  }) async {
    var response =
        await baseSendRequest(AppUrl.verifyOtp, EnumRequestMethod.post,
            jsonMap: {
              "identifier": identifier,
              "otp": otp,
            },
            functionError: (e) {});
    return BaseResponseBENew.fromJson(
      response,
      func: (json) => VerifyOtpModel.fromJson(json),
    );
  }

  Future<BaseResponseBENew> resetPassword({
    required String identifier,
    required String resetToken,
    required String newPassword,
  }) async {
    var response =
        await baseSendRequest(AppUrl.resetPassword, EnumRequestMethod.post,
            jsonMap: {
              "resetToken": resetToken,
              "newPassword": newPassword,
              "identifier": identifier,
            },
            functionError: (e) {});
    return BaseResponseBENew.fromJson(
      response,
    );
  }
}
