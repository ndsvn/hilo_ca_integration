import 'package:bot_toast/bot_toast.dart';
import 'package:hilo_ca_integration/assets/assets.src.dart';
import 'package:hilo_ca_integration/base_utils/repository_base/base_request.dart';
import 'package:hilo_ca_integration/cores/theme/theme.src.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/material.dart';

import '../../../cores/values/values.src.dart';

class BaseGetxController extends GetxController {
  RxBool isShowLoading = false.obs;
  String errorContent = '';
  RxBool isRemember = false.obs;
  BaseRequest baseRequestController = Get.find();

  ///1 CancelToken để huỷ 1 request.
  ///1 màn hình gắn với 1 controller, 1 controller có nhiều requests khi huỷ 1 màn hình => huỷ toàn bộ requests `INCOMPLETED` tại màn hình đó.
  List<CancelToken> cancelTokens = [];

  /// Sử dụng một số màn bắt buộc sử dụng loading overlay
  RxBool isLoadingOverlay = false.obs;

  void showLoading() {
    isShowLoading.value = true;
  }

  void hideLoading() {
    isShowLoading.value = false;
  }

  void showLoadingOverlay() {
    isLoadingOverlay.value = true;
  }

  void hideLoadingOverlay() {
    isLoadingOverlay.value = false;
  }

  void addCancelToken(CancelToken cancelToken) {
    cancelTokens.add(cancelToken);
  }

  void cancelRequest(CancelToken cancelToken) {
    if (!cancelToken.isCancelled) {
      cancelToken.cancel('Cancel when close controller!!!');
    }
  }

  // Future<void> showFlushNoti(
  //   String message, {
  //   Duration duration = const Duration(seconds: 2),
  //   final FlushBarType type = FlushBarType.notification,
  // }) async {
  //   ShowFlushBar.showFlushBar(
  //     message.tr,
  //     type: type,
  //   );
  // }

  Future<void> showFlushNoti<T>(
    String message, {
    Duration duration = const Duration(seconds: 2),
    // Widget? mainButton,
    String? content,
    bool isSuccess = true,
  }) async {
    BotToast.showCustomText(
      duration: message.length > 100 ? 5.seconds : duration,
      align: Alignment.topCenter,
      toastBuilder: (cancel) {
        return Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(
                vertical: AppDimens.defaultPadding,
                horizontal: AppDimens.paddingMedium),
            margin: const EdgeInsets.all(AppDimens.paddingSmall),
            decoration: BoxDecoration(
              color: isSuccess
                  ? AppColors.colorSemantic2Bland
                  : AppColors.colorSemantic3Bland,
              border: Border.all(
                color: isSuccess
                    ? AppColors.colorSemantic2
                    : AppColors.colorSemantic3,
              ),
              borderRadius: BorderRadius.circular(AppDimens.paddingMedium),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2, 4),
                  blurRadius: 8.1,
                  color: Colors.black.withOpacity(0.15),
                )
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        isSuccess
                            ? Assets.ASSETS_ECERT_CHECK_CIRCLE_SVG
                            : Assets.ASSETS_ECERT_EXCLAMATION_CIRCLE_SVG,
                      ).paddingOnly(
                        right: AppDimens.defaultPadding,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextUtils(
                              text: message.tr,
                              availableStyle: StyleEnum.titleSmall,
                              color: isSuccess
                                  ? AppColors.colorSuccessContent
                                  : AppColors.colorErrorContent,
                              maxLine: 2,
                            ),
                            Visibility(
                              visible: content != null,
                              child: TextUtils(
                                text: (content ?? "").tr,
                                availableStyle: StyleEnum.bodySmall,
                                color: isSuccess
                                    ? AppColors.colorSuccessContent
                                    : AppColors.colorErrorContent,
                                maxLine: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // InkWell(
                //   onTap: cancel,
                //   child: SvgPicture.asset(
                //     Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_CANCEL_SVG,
                //     colorFilter: const ColorFilter.mode(
                //       AppColors.colorComment,
                //       BlendMode.srcIn,
                //     ),
                //   ).paddingOnly(left: AppDimens.iconVerySmall),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> showSnackBar<T>(
    String message, {
    Duration duration = const Duration(seconds: 2),
    Widget? mainButton,
    Color backgroundColor = AppColors.color,
  }) async {
    Get.showSnackbar(GetSnackBar(
      backgroundColor: AppColors.appBarColor(),
      messageText: Text(
        message.tr,
        style: Get.textTheme.bodyMedium,
      ),
      message: message.tr,
      mainButton: Row(
        children: [
          if (mainButton != null) mainButton,
          IconButton(
              onPressed: () => Get.back(), icon: const Icon(Icons.close)),
        ],
      ),
      duration: message.length > 100 ? 5.seconds : duration,
    ));
  }

  void _setOnErrorListener() {
    baseRequestController.setOnErrorListener((error) async {
      errorContent = AppStr.errorConnectFailedStr.tr;
      bool isExpiredToken = false;
      if (error is DioException) {
        //Nếu server có trả về message thì hiển thị
        if (error.response?.data != null &&
            error.response!.data is Map &&
            error.response!.data["Message"] != null) {
          // trường hợp tài khoản không hợp lệ thì thông báo khách hàng đăng nhập lại
          /*  if (error.response!.data['ErrorCode'] == '177') {
            errorContent = AppStr.error177.tr;
          } else {
            errorContent = error.response!.data['Message'];
          }*/
          errorContent = error.response!.data['Message'];
        } else {
          switch (error.type) {
            case DioExceptionType.connectionTimeout:
            case DioExceptionType.sendTimeout:
            case DioExceptionType.receiveTimeout:
              errorContent = AppStr.errorConnectTimeOut.tr;
              break;
            case DioExceptionType.cancel:
              // không hiện thông báo khi huỷ request
              errorContent = '';
              break;
            case DioExceptionType.badResponse:
              switch (error.response!.statusCode) {
                case AppConst.error400:
                  errorContent = AppStr.error400.tr;
                  break;
                case AppConst.error401:
                  errorContent = AppStr.error401.tr;
                  isExpiredToken = true;
                  break;
                case AppConst.error404:
                  errorContent = AppStr.error404.tr;
                  break;
                case AppConst.error500:
                  errorContent = AppStr.errorInternalServer.tr;
                  break;
                case AppConst.error502:
                  errorContent = AppStr.error502.tr;
                  break;
                case AppConst.error503:
                  errorContent = AppStr.error503.tr;
                  break;
                default:
                  errorContent = AppStr.errorInternalServer.tr;
              }
              break;
            default:
              errorContent = AppStr.errorConnectFailedStr.tr;
          }
          /*  // check lỗi khi tải pdf
         if (error.response?.data != null &&
              error.response?.data is List<int>) {
            var result = utf8.decode(error.response?.data);
            var err = jsonDecode(result);
            if (err is Map) {
              errorContent = err['Message'];
            }
          }*/
        }
        // await FirebaseCloud.addLogError(error, errorContent);
      }

      isShowLoading.value = false;
      isLoadingOverlay.value = false;
      // if (errorContent.isNotEmpty) showSnackBar(errorContent);
      if (errorContent.isNotEmpty) {
        ShowPopup.showErrorMessage(
          errorContent,
          isExpiredToken: isExpiredToken,
        );
      }
    });
  }

  /// Func goi API Danh sách
  Future<List<T>> callAPIList<T>({
    required Function functionAPI,
    required List<T> listResponse,
    bool isRefresh = true,
  }) async {
    try {
      if (isRefresh) {
        showLoading();
      }

      final res = await functionAPI();

      if (res.statusCode == AppConst.statusCodeSuccess && res.data != null) {
        if (isRefresh) {
          listResponse.clear();
        }
        listResponse.addAll(res.data?.rows ?? []);
      }
      return listResponse;
    } finally {
      if (isRefresh) {
        hideLoading();
      }
    }
  }

  /// Func goi API Đơn
  Future<void> callAPIBE<T>({
    required Function functionAPI,
    required Function(T result) functionSuccess,
    Function(T result)? functionFail,
    bool isOverlay = true,
    bool isShowLoading = false,
  }) async {
    try {
      if (isShowLoading) {
        showLoading();
      } else if (isOverlay) {
        showLoadingOverlay();
      }

      final res = await functionAPI();

      if (res.statusCode == AppConst.statusCodeSuccess && res.data != null) {
        functionSuccess(res.data);
      } else {
        functionFail?.call(res.data);
      }
    } finally {
      if (isShowLoading) {
        hideLoading();
      } else if (isOverlay) {
        hideLoadingOverlay();
      }
    }
  }

  @override
  void onClose() {
    for (var cancelToken in cancelTokens) {
      cancelRequest(cancelToken);
    }
    super.onClose();
  }

  @override
  void onReady() {
    _setOnErrorListener();
    super.onReady();
  }
}
