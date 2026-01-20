import 'package:ecert/assets/assets.src.dart';
import 'package:ecert/cores/theme/theme.src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/routes/routes.dart';
import 'package:ecert/shares/shares_src.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../cores/values/values.src.dart';

class ShowPopup {
  static int _numDialog = 0;

  static void _showDialog(Widget dialog, bool isActiveBack,
      {bool barrierDismissible = false}) {
    _numDialog++;
    Get.dialog(
      WillPopScope(
        onWillPop: () => onBackPress(isActiveBack),
        child: dialog,
      ),
      barrierDismissible: barrierDismissible,
    ).whenComplete(() => _numDialog--);
  }

  static Future<bool> onBackPress(bool isActiveBack) {
    return Future.value(isActiveBack);
  }

  static void dismissDialog() {
    if (_numDialog > 0) {
      Get.back();
    }
  }

  static Widget showDialogFull({required Widget body}) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            AppDimens.paddingMedium,
          ),
        ),
      ),
      contentPadding: EdgeInsets.zero,
      insetPadding:
          const EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      content: SizedBox(
        // color: AppColors.white,
        width: Get.width,
        child: body,
      ),
    );
  }

  /// Hiển thị loading
  ///
  /// `isActiveBack` có cho phép back từ bàn phím Android khi loading hay không, default = true
  void showLoadingWave({bool isActiveBack = true}) {
    _showDialog(getLoadingWidget(), isActiveBack);
  }

  static Widget getLoadingWidget() {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }

  /// Hiển thị dialog thông báo với nội dung cần hiển thị
  ///
  /// `funtion` hành động khi bấm đóng
  ///
  /// `isActiveBack` có cho phép back từ bàn phím Android hay không, default = true
  ///
  /// `isChangeContext` default true: khi gọi func không close dialog hiện tại (khi chuyển sang màn mới thì dialog hiện tại sẽ tự đóng)
  static void showDialogNotification(
    String content, {
    bool isActiveBack = true,
    Function? function,
    String nameAction = AppStr.close,
    bool isExpiredToken = false,
  }) {
    _showDialog(
        Dialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  child: Icon(
                    _buildIconDialog(content),
                    size: AppDimens.sizeDialogNotiIcon,
                    color: Colors.blueAccent,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  constraints: const BoxConstraints(maxHeight: 200),
                  child: SingleChildScrollView(
                    child: Text(
                      content,
                      style: TextStyle(fontSize: AppDimens.fontMedium()),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                      textScaleFactor: 1,
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                SizedBox(
                  width: double.infinity,
                  child: _baseButton(
                    function,
                    nameAction.tr,
                    colorText: AppColors.colorBlueAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
        isActiveBack);
  }

  static Widget _baseButton(
    Function? function,
    String text, {
    Color? colorText,
  }) {
    return UtilWidget.baseOnAction(
        onTap: () {
          dismissDialog();
          function?.call();
        },
        child: TextButton(
          onPressed: null,
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
          ),
          child: TextUtils(
            text: text,
            availableStyle: StyleEnum.bodyMedium,
            color: colorText ?? AppColors.colorTextBlack,
          ),
        ));
  }

  static void showErrorMessage(String error, {bool isExpiredToken = false}) {
    if (_numDialog < 1) {
      if (isExpiredToken) {
        showDialogNotification(error, nameAction: AppStr.accept, function: () {
          Get.offAllNamed(AppRoutes.routeLogin);
        });
      } else {
        showDialogNotification(error, isActiveBack: false);
      }
    }
  }

  static IconData _buildIconDialog(String errorStr) {
    IconData iconData;
    switch (errorStr) {
      case AppStr.errorConnectTimeOut:
        iconData = Icons.alarm_off;
        break;
      // case AppStr.error400:
      // case AppStr.error401:
      // case AppStr.error404:
      // case AppStr.error502:
      // case AppStr.error503:
      // case AppStr.errorInternalServer:
      //   iconData = Icons.warning;
      //   break;
      case AppStr.errorConnectFailedStr:
        iconData = Icons.signal_wifi_off;
        break;
      default:
        iconData = Icons.notifications_none;
    }
    return iconData;
  }

  static void showDialogConfirmSign({
    required VoidCallback functionConfirm,
    required VoidCallback functionCancel,
    String content = LocaleKeys.nfcResult_notification,
    String title = "",
    String textCancel = LocaleKeys.dialog_cancel,
    String textConfirm = "",
    bool isActiveBack = true,
    bool isTowButton = true,
  }) {
    Get.dialog(
      showDialogFull(
          body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _bodyConfirm(
            functionCancel: functionCancel,
            functionConfirm: functionConfirm,
            content: content,
            title: title,
            textCancel: textCancel,
            textConfirm: textConfirm,
            isTowButton: isTowButton,
          ),
        ],
      )),
      barrierDismissible: isActiveBack,
    );
  }

  static Widget _bodyConfirm({
    required VoidCallback functionConfirm,
    required VoidCallback functionCancel,
    String content = AppStr.notification,
    String title = "",
    String textCancel = AppStr.notification,
    String textConfirm = "",
    bool isTowButton = true,
  }) {
    return CardWidgets(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UtilWidget.sizedBox15,
          Align(
            alignment: Alignment.centerRight,
            child: UtilWidget.baseOnAction(
              onTap: () {
                Get.back();
              },
              child: SvgPicture.asset(
                Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_CANCEL_SVG,
                colorFilter: const ColorFilter.mode(
                  AppColors.colorGrey,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          UtilWidget.sizedBox20,
          TextUtils(
            text: content.tr,
            availableStyle: StyleEnum.titleLarge,
            maxLine: AppDimens.size2,
            textAlign: TextAlign.center,
          ),
          UtilWidget.sizedBox25,
          TextUtils(
            text: title.tr,
            availableStyle: StyleEnum.bodySmall,
            maxLine: AppDimens.size3,
            textAlign: TextAlign.center,
          ),
          UtilWidget.sizedBox25,
          isTowButton
              ? UtilWidget.buildTwoButtons(
                  onTapLeft: functionCancel,
                  titleButtonLeft: textCancel,
                  titleButtonRight: textConfirm,
                  onTapRight: functionConfirm,
                )
              : UtilWidget.buildSolidButtonIcon(
                  onPressed: functionConfirm,
                  titleStyle: FontStyleUtils.fontStyleSans(
                    fontSize: AppDimens.sizeTextMediumTb,
                    fontWeight: FontWeight.bold,
                  ),
                  title: textConfirm,
                  backgroundColor: AppColors.colorBlueX,
                ),
          UtilWidget.sizedBox15,
        ],
      ).paddingSymmetric(horizontal: AppDimens.iconVerySmall),
    );
  }

  static void showDialogConfirm(
    String content, {
    required Function confirm,
    required String actionTitle,
    bool isActiveBack = true,
    String title = AppStr.notification,
    String exitTitle = AppStr.cancel,
    Function? cancelFunc,
    bool isAutoCloseDialog = false,
    Color? colorConfirm,
  }) {
    _showDialog(
        Dialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: UtilWidget.baseOnAction(
                    onTap: () {
                      Get.back();
                    },
                    child: SvgPicture.asset(
                      Assets.ASSETS_IMAGES_ICON_ICON_SVG_ICON_CANCEL_SVG,
                    ),
                  ),
                ).paddingAll(AppDimens.paddingVerySmall),
                AutoSizeText(
                  title.tr,
                  textScaleFactor: 1,
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: AppDimens.sizeTextLarge,
                      color: AppColors.textColor()),
                ),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  constraints: const BoxConstraints(maxHeight: 200),
                  child: SingleChildScrollView(
                    child: Text(
                      content.tr,
                      style: Get.textTheme.bodyLarge?.copyWith(
                        color: AppColors.textColor(),
                        fontSize: AppDimens.sizeTextMediumTb,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                SizedBox(
                  width: double.infinity,
                  height: AppDimens.btnMedium,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: _baseButton(cancelFunc, exitTitle.tr,
                            colorText: AppColors.colorTextBlack),
                      ),
                      const VerticalDivider(
                        width: 1,
                      ),
                      Expanded(
                        child: _baseButton(
                          confirm,
                          actionTitle.tr,
                          colorText:
                              colorConfirm ?? AppColors.lightPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        isActiveBack);
  }

  static void reason({
    String? title,
    String? holder,
    Widget? widget,
    VoidCallback? voidCallback1,
    TextEditingController? textEditingController,
    bool isActiveBack = true,
  }) {
    _showDialog(
        Dialog(
          child: SizedBox(
            // height: ConstSizeWidget.height_05,
            // width: ConstSizeWidget.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 28,
                    ),
                    Text(
                      title!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (textEditingController != null) {
                          textEditingController.text = "";
                        }
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.clear,
                        size: 30,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: Get.size.width,
                  height: 0.5,
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  decoration: const BoxDecoration(
                    color: DefaultTheme.greyText,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 16,
                            color: DefaultTheme.black,
                          ),
                          controller: textEditingController,
                          maxLength: 100,
                          maxLines: 8,
                          minLines: 8,
                          decoration: InputDecoration(
                              fillColor: DefaultTheme.greyChat,
                              filled: true,
                              counterText: "",
                              contentPadding: const EdgeInsets.all(10),
                              hintText: holder,
                              hintStyle: const TextStyle(
                                fontSize: 16,
                                color: DefaultTheme.greyText,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.black12))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          widget!,
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        isActiveBack);
  }

  messageDialog(
      {required String title,
      required String description,
      String? textBtnCancel,
      Widget? widget,
      bool isCenterDescription = false,
      VoidCallback? voidCallback1}) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      titlePadding: const EdgeInsets.only(top: 10),
      title: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 48,
            ),
            Center(
              child: Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              width: 48,
            ),
          ],
        ),
      ),
      content: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Divider(
                height: 1,
                color: Colors.black12,
              ),
            ),
            widget ?? Container(),
            Container(
              width: Get.width,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  description,
                  textAlign: isCenterDescription ? TextAlign.center : null,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                child: Container(
                  height: 40,
                  width: 115,
                  decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text(
                    '$textBtnCancel',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
                onTap: () {
                  voidCallback1!();
                },
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  confirmDialog(
      {required String title,
      required String description,
      String? textBtnCancel,
      String? textBtnCancel2,
      Widget? widget,
      VoidCallback? voidCallback1,
      VoidCallback? voidCallback2}) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      titlePadding: const EdgeInsets.only(top: 10),
      title: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 48,
            ),
            Center(
              child: Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              width: 48,
            ),
          ],
        ),
      ),
      content: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Divider(
                height: 1,
                color: Colors.black12,
              ),
            ),
            widget ?? Container(),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 2,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                            color: DefaultTheme.greyBox,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                            child: Text(
                          '$textBtnCancel',
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      onTap: () {
                        voidCallback1!();
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: Text(
                          '$textBtnCancel2',
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      onTap: () {
                        voidCallback2!();
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  // showDialogNotification(String notification){
  //   return AlertDialog(
  //     content: Column(
  //       children: [
  //         Text("Thông báo", style: Get.textTheme.bodyMedium!.copyWith(fontSize: 18),),
  //         Text(notification,style: Get.textTheme.bodyMedium!.copyWith(fontSize: 18))
  //       ],
  //     ),
  //   );
  // }

  customfirmDialog(
      {required String title,
      String? textBtnCancel,
      String? textBtnCancel2,
      Widget? widget,
      VoidCallback? voidCallback1,
      VoidCallback? voidCallback2}) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      titlePadding: const EdgeInsets.only(top: 10),
      title: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 48,
            ),
            Center(
              child: Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              width: 48,
            ),
          ],
        ),
      ),
      content: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Divider(
                height: 1,
                color: Colors.black12,
              ),
            ),
            widget ?? Container(),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                            color: DefaultTheme.greyBox,
                            borderRadius: BorderRadius.circular(30)),
                        child: Center(
                            child: Text(
                          '$textBtnCancel',
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      onTap: () {
                        voidCallback1!();
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: Text(
                          '$textBtnCancel2',
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      onTap: () {
                        voidCallback2!();
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  openLoadingDialog() {
    return const Material(
      color: DefaultTheme.transparent,
      child: Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: CupertinoActivityIndicator(
            radius: 30,
            color: DefaultTheme.white,
          ),
        ),
      ),
    );
  }

  dismiss({required BuildContext context}) {
    Navigator.pop(context);
  }

/* showSnackBar<T>(
    String message, {
    Duration duration = const Duration(seconds: 2),
    Widget? mainButton,
    Color backgroundColor = AppColors.darkAccentColor,
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
  }*/

  /// Chọn chứng thư số dialog
  // static void showChooseDigitalCertDialog({
  //   bool isActiveBack = true,
  //   String title = PersonalSignatureStr.chooseDigitalCertificate,
  // }) {
  //   _showDialog(
  //     Dialog(
  //       surfaceTintColor: AppColors.colorBackgroundWhite,
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           UtilWidget.sizedBox10,
  //           TextUtils(
  //             text: title,
  //             availableStyle: StyleEnum.titleMedium,
  //           ),
  //           UtilWidget.sizedBox10,
  //           Align(
  //             alignment: Alignment.centerLeft,
  //             child: Column(
  //               children: [
  //                 buildTextField(title: PersonalSignatureStr.serialNumber),
  //                 UtilWidget.sizedBox10,
  //                 buildTextField(title: PersonalSignatureStr.name),
  //                 UtilWidget.sizedBox10,
  //                 buildTextField(title: PersonalSignatureStr.issuer),
  //               ],
  //             ),
  //           ),
  //           UtilWidget.sizedBox20,
  //           UtilWidget.buildTwoButtons(
  //             titleButtonLeft: PersonalSignatureStr.addNew,
  //             titleButtonRight: PersonalSignatureStr.choose,
  //             onTapLeft: () => showAddNewDigitalCertDialog(),
  //             onTapRight: () => null,
  //           ),
  //           UtilWidget.sizedBox10,
  //         ],
  //       ),
  //     ).paddingAll(12),
  //     isActiveBack,
  //     barrierDismissible: true,
  //   );
  // }

  /// Thêm chứng thư số mới dialog
  // static void showAddNewDigitalCertDialog({
  //   bool isActiveBack = true,
  //   String title = PersonalSignatureStr.addNew,
  // }) {
  //   _showDialog(
  //     Dialog(
  //       surfaceTintColor: AppColors.colorBackgroundWhite,
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           UtilWidget.sizedBox10,
  //           TextUtils(
  //             text: title,
  //             availableStyle: StyleEnum.titleMedium,
  //           ),
  //           UtilWidget.sizedBox10,
  //           SvgPicture.asset(ImageAsset.iconEasyCA),
  //           UtilWidget.sizedBox10,
  //           Align(
  //             alignment: Alignment.centerLeft,
  //             child: Column(
  //               children: [
  //                 buildTextField(title: PersonalSignatureStr.serialNumber),
  //                 UtilWidget.sizedBox10,
  //                 buildTextField(title: PersonalSignatureStr.name),
  //               ],
  //             ),
  //           ),
  //           UtilWidget.sizedBox15,
  //           Column(
  //             children: [
  //               UtilWidget.buildCheckBox(PersonalSignatureStr.defaultMode),
  //               UtilWidget.sizedBox20,
  //               Row(
  //                 children: [
  //                   UtilWidget.buildCheckBox(PersonalSignatureStr.useMode),
  //                   UtilWidget.sizedBoxWidth25,
  //                   UtilWidget.buildCheckBox(PersonalSignatureStr.lockMode),
  //                 ],
  //               ),
  //             ],
  //           ),
  //           UtilWidget.sizedBox20,
  //           UtilWidget.buildTwoButtons(
  //             titleButtonLeft: PersonalSignatureStr.close,
  //             titleButtonRight: PersonalSignatureStr.save,
  //             onTapLeft: () => dismissDialog(),
  //             onTapRight: () => null,
  //           ),
  //           UtilWidget.sizedBox10,
  //         ],
  //       ),
  //     ).paddingAll(12),
  //     isActiveBack,
  //     barrierDismissible: true,
  //   );
  // }

  static Widget buildTextField({
    required String title,
  }) {
    return Row(
      children: [
        TextUtils(
          text: title,
          availableStyle: StyleEnum.titleMedium,
        ),
        UtilWidget.sizedBoxWidth5,
        const TextUtils(
          text: 'data',
        ),
      ],
    );
  }

  /// Base cho các confirm dialog khi xóa, hủy, đăng xuất,...
  static void showDialogConfirmChoice({
    required String dialogTitle,
    String? confirmQuestion,
    required String leftButtonTitle,
    required String rightButtonTitle,
    required Function() leftButtonFunc,
    required Function() rightButtonFunc,
    bool isActiveBack = true,
  }) {
    _showDialog(
      Dialog(
        surfaceTintColor: AppColors.colorBackgroundWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.radius8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextUtils(
              text: dialogTitle,
              availableStyle: StyleEnum.titleMedium,
            ),
            UtilWidget.sizedBox15,
            TextUtils(
              text: confirmQuestion ?? '',
              availableStyle: StyleEnum.bodySmall,
              maxLine: 2,
              textAlign: TextAlign.center,
            ).paddingSymmetric(
              horizontal: AppDimens.paddingSmaller,
            ),
            UtilWidget.sizedBox15,
            UtilWidget.buildTwoButtons(
              titleButtonLeft: leftButtonTitle,
              titleButtonRight: rightButtonTitle,
              onTapLeft: leftButtonFunc,
              onTapRight: rightButtonFunc,
            )
          ],
        )
            .paddingSymmetric(vertical: AppDimens.defaultPadding)
            .paddingSymmetric(horizontal: AppDimens.paddingSmall),
      ),
      isActiveBack,
      barrierDismissible: true,
    );
  }

  /// Hiển thị dialog thông báo bật quyền truy cập ở setting
  static void openAppSetting({
    required String content,
    required String titleAction,
  }) {
    showDialogConfirm(
      content,
      confirm: () {
        Get.back();
        AppSettings.openAppSettings();
      },
      actionTitle: titleAction,
    );
  }
}
