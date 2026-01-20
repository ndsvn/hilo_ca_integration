import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_log_sds/interceptor/dio_log_interceptor.dart';
import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/cores/enum/enum_request_method.dart';
import 'package:hilo_ca_integration/cores/values/base_url.dart';
import 'package:hilo_ca_integration/cores/values/values.src.dart';
import 'package:hilo_ca_integration/shares/utils/log/dio_log.dart';

class BaseRequest {
  static Dio dio = getBaseDio();

  static Dio getBaseDio() {
    Dio dio = Dio();

    dio.options = buildDefaultOptions();
    if (Diolog().showDebug) {
      dio.interceptors.add(SDSDioLogInterceptor());
    }
    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      },
    );

/*    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };*/
    return dio;
  }

  static BaseOptions buildDefaultOptions() {
    return BaseOptions()
      ..connectTimeout = const Duration(seconds: AppConst.receiveTimeoutRegister)
      ..receiveTimeout = const Duration(seconds: AppConst.receiveTimeoutRegister);
  }

  static void close() {
    dio.close(force: true);
    updateCurrentDio();
  }

  static void updateCurrentDio() {
    dio = getBaseDio();
  }

  static Dio getCurrentDio() {
    return dio;
  }

  void setOnErrorListener(Function(Object error) onErrorCallBack) {
    this.onErrorCallBack = onErrorCallBack;
  }

  late Function(Object error) onErrorCallBack;

  /// [isQueryParametersPost]: `true`: phương thức post gửi params, mặc định = `false`
  ///
  /// [dioOptions]: option của Dio() sử dụng khi gọi api có option riêng
  ///
  /// [functionError]: chạy function riêng khi request xảy ra Exception (mặc định sử dụng [showDialogError])
  Future<dynamic> sendRequest(
    String action,
    String requestMethod, {
    dynamic jsonMap,
    bool isDownload = false,
    String? urlOther,
    Map<String, String>? headersUrlOther,
    bool isQueryParametersPost = false,
    required BaseGetxController controller,
    BaseOptions? dioOptions,
    Function(Object error)? functionError,
    bool isToken = true,
    Map<String, dynamic>? queryParameters,
    String? contentType,
    bool enableChunkedTransfer = false,
    Duration receiveTimeout =
        const Duration(milliseconds: AppConst.requestTimeOut),
  }) async {
    dio.options = dioOptions ?? buildDefaultOptions();
    dynamic response;
    String url = urlOther ?? (BaseUrl.instance.getBaseUrl() + action);
    Map<String, dynamic> headers = isToken
        ? (headersUrlOther ?? getBaseHeader())
        : {"Content-Type": "application/json"};

    if (enableChunkedTransfer) {
      // Set Transfer-Encoding là 'chunked' để BE tự tính content-length, nhằm tránh lỗi sai content-length
      headers['Transfer-Encoding'] = 'chunked';
    }
    Options options = isDownload
        ? Options(
            headers: headers,
            responseType: ResponseType.bytes,
            followRedirects: false,
            contentType: contentType,
            receiveTimeout: receiveTimeout,
            validateStatus: (status) {
              return status != null && status < 500;
            })
        : Options(
            headers: headers,
            //method: requestMethod.toString(),
            // contentType: Headers.formUrlEncodedContentType,
            contentType: contentType,
            receiveTimeout: receiveTimeout,
            responseType: ResponseType.json,
          );
    final CancelToken cancelToken = CancelToken();
    controller.addCancelToken(cancelToken);

    try {
      if (requestMethod == EnumRequestMethod.post) {
        if (isQueryParametersPost) {
          response = await dio.post(
            url,
            queryParameters: jsonMap,
            options: options,
            cancelToken: cancelToken,
          );
        } else {
          response = await dio.post(
            url,
            data: jsonMap,
            options: options,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
          );
        }
      } else if (requestMethod == EnumRequestMethod.delete) {
        response = await dio.delete(
          url,
          data: jsonMap,
          options: options,
          cancelToken: cancelToken,
        );
      } else if (requestMethod == EnumRequestMethod.put) {
        response = await dio.put(
          url,
          data: jsonMap,
          options: options,
          cancelToken: cancelToken,
        );
      } else {
        response = await dio.get(
          url,
          queryParameters: jsonMap,
          options: options,
          cancelToken: cancelToken,
        );
      }
      return response.data;
    } catch (e) {
      var baseResponseError = catchErrorBE(e);
      if (baseResponseError != null) {
        return baseResponseError;
      }
      controller.cancelRequest(cancelToken);
      return functionError != null ? functionError(e) : showDialogError(e);
    }
  }

  dynamic catchErrorBE(Object e) {
    try {
      if (e is DioException && e.response?.data is Map) {
        // if (Get.isDialogOpen ?? false) {
        //   Get.back();
        // }
        final BaseResponseBECert temp =
            BaseResponseBECert.fromJson(e.response?.data);
        if (!temp.status) {
          // if (temp.errors?.first.code == "TOKEN_EXPIRED") {
          //   isCheckShowDialog = true;
          //   gotoLogin();
          // }

          return ((e.response?.statusCode ?? 0) == AppConst.error401)
              ? showDialogError(e)
              : e.response?.data;
        }
      }
    } catch (e) {
      return null;
    }
  }

  dynamic showDialogError(dynamic e) {
    if (e.response?.data != null &&
        e.response.data is Map &&
        e.response.data["errorMessage"] != null) return e.response.data;
    onErrorCallBack(e);
  }

  Map<String, dynamic> getBaseHeader() {
    return {
      "Content-Type": "application/json",
      'Authorization': "Bearer ${hiveApp.get(AppConst.keyToken)}",
    };
  }
}
