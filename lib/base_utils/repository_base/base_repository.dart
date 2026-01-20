import 'package:dio/dio.dart';
import 'package:ecert/cores/cores_src.dart';
import 'package:get/get.dart';
import 'package:ecert/base_utils/controllers_base/base_controller.src.dart';
import 'package:ecert/base_utils/repository_base/base_request.dart';

class BaseRepository {
  final BaseRequest _baseRequest = Get.find<BaseRequest>();
  final BaseGetxController controller;

  BaseRepository(this.controller);

  /// [isQueryParametersPost]: `true`: phương thức post gửi params, mặc định = `false`
  ///
  /// [dioOptions]: option của Dio() sử dụng khi gọi api có option riêng
  ///
  /// [functionError]: chạy function riêng khi request xảy ra Exception (mặc định sử dụng [showDialogError])
  Future<dynamic> baseSendRequest(
    String action,
    String requestMethod, {
    dynamic jsonMap,
    bool isDownload = false,
    String? urlOther,
    Map<String, String>? headersUrlOther,
    bool isQueryParametersPost = false,
    BaseOptions? dioOptions,
    Function(Object error)? functionError,
    bool isToken = true,
    Map<String, dynamic>? queryParameters,
    String? contentType,
    bool enableChunkedTransfer = false,
    Duration receiveTimeout =
        const Duration(milliseconds: AppConst.requestTimeOut),
  }) {
    return _baseRequest.sendRequest(
      action,
      requestMethod,
      jsonMap: jsonMap,
      isDownload: isDownload,
      urlOther: urlOther,
      headersUrlOther: headersUrlOther,
      isQueryParametersPost: isQueryParametersPost,
      controller: controller,
      dioOptions: dioOptions,
      functionError: functionError,
      isToken: isToken,
      queryParameters: queryParameters,
      contentType: contentType,
      enableChunkedTransfer: enableChunkedTransfer,
      receiveTimeout: receiveTimeout,
    );
  }
}
