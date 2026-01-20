import 'dart:async';

import 'package:camera/camera.dart';
import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/cores/values/values.src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/routes/routes.dart';
import 'package:ecert/shares/shares_src.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

late Box hiveApp;

late PackageInfo packageInfo;

// late Upgrader upgrade;

AndroidDeviceInfo? androidDeviceInfo;
IosDeviceInfo? iosDeviceInfo;

class AppController extends GetxController {
  RxBool isBusinessHousehold = false.obs;
  RxBool isFingerprintOrFaceID = false.obs;
  bool isFaceID = false;
  late CameraController cameraController;
  late List<CameraDescription> cameras;
  // int taskId = 0;
  // String typeSignPdf = "";
  // String imgFaceFront = "";
  // String documentNumberSign = "";
  // String? phoneNumberSign;
  // String? emailSign;
  // bool isToDeepLink = false;
  // DeepLinkModel deepLinkModel = DeepLinkModel();
  // SendNfcRequestModel sendNfcRequestModel = SendNfcRequestModel();

  @override
  void onInit() {
    initHive().then((value) async {
      Get.put(BaseRequest(), permanent: true);
      Get.put(BaseGetxController(), permanent: true);
      // initCamera();
      // await initConfig();
      try {
        var biometrics = await Biometrics().getAvailableBiometrics();
        isFingerprintOrFaceID.value =
            hiveApp.get(AppConst.loginBiometric) ?? false;

        if (biometrics != null) {
          isFaceID = biometrics.contains(BiometricType.face);
        }

        // Config demo SDK
        Get.toNamed(AppRoutes.routeGuideCert);


        /// Config đăng nhập như app bình thường
        // if (AppConfig.instance.getSystemInvoices() != null) {
        //   Get.offAndToNamed(AppRoutes.routeLogin);
        // } else {
        //   Get.offAndToNamed(AppRoutes.routeSystemInvoices);
        // }

        // if (Get.parameters["taskId"] == null) {
        //   // kiểm tra trạng thái lưu đăng nhập
        //   if (hiveApp.get(AppConst.keyToken) != null) {
        //     LoginController loginController = Get.put(LoginController());
        //     await loginController.loginUserFromLogin(
        //         LoginModelRequest(
        //           // taxCode: hiveApp.get(AppConst.textTaxCode),
        //           username: hiveApp.get(AppConst.userName),
        //           password: hiveApp.get(AppConst.password),
        //         ),
        //         isLoginFromApp: true);
        //   } else {
        //     Get.offAndToNamed(AppRoutes.routeLogin);
        //   }
        // } else {
        //   Get.offNamed(
        //     AppRoutes.routeLogin,
        //     parameters: Map.from(Get.parameters),
        //   );
        // }
      } catch (e) {
        Get.offAndToNamed(AppRoutes.routeLogin);
      }
    });
    super.onInit();
  }

  Future<void> initCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.high,
      enableAudio: false,
    );
    await cameraController.initialize();
  }

  // void clearDataSign() {
  //   deepLinkModel = DeepLinkModel();
  //   sendNfcRequestModel = SendNfcRequestModel();
  // }
//
// void changeBusinessType() {
//   isBusinessHousehold.toggle();
// }
}

Future<void> initHive() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  hiveApp = await Hive.openBox(LocaleKeys.app_name.tr);

  packageInfo = await PackageInfo.fromPlatform();

  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  if (GetPlatform.isAndroid) {
    androidDeviceInfo = await deviceInfoPlugin.androidInfo;
  } else if (GetPlatform.isIOS) {
    iosDeviceInfo = await deviceInfoPlugin.iosInfo;
  }
  print(androidDeviceInfo?.version.sdkInt);
}


