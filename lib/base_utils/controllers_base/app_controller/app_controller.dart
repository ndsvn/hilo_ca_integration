import 'dart:async';

import 'package:camera/camera.dart';
import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/cores/values/values.src.dart';
import 'package:hilo_ca_integration/generated/locales.g.dart';
import 'package:hilo_ca_integration/routes/routes.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
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
  final Completer<void> _ready = Completer<void>();
  Future<void> get ready => _ready.future;
  bool get isReady => _ready.isCompleted;
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
    super.onInit();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    try {
      await initHive();
      Get.put(BaseRequest(), permanent: true);
      Get.put(BaseGetxController(), permanent: true);

      if (!_ready.isCompleted) _ready.complete();
    } catch (e, st) {
      if (!_ready.isCompleted) _ready.completeError(e, st);
      rethrow;
    }
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
