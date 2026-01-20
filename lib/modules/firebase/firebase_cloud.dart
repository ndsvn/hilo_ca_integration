// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:dio/dio.dart';
// import 'package:hilo_ca_integration/generated/locales.g.dart';
// import 'package:hilo_ca_integration/shares/utils/utils.src.dart';
// import 'package:get/get.dart';
//
// import '../../base_utils/controllers_base/base_controller.src.dart';
// import '../../cores/values/values.src.dart';
// import 'firebase_src.dart';
//
// class FirebaseCloud {
//   // Create a collections
//   static CollectionReference collections = FirebaseFirestore.instance
//       .collection(convertDateToStringDefault(DateTime.now()));
//   static CollectionReference collectionsrReport =
//       FirebaseFirestore.instance.collection('0000-Report');
//
//   static Future<void> addLogError(
//       DioException error, String messageLocal) async {
//     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//     AndroidDeviceInfo? androidDeviceInfo;
//     IosDeviceInfo? iosDeviceInfo;
//     if (GetPlatform.isAndroid) {
//       androidDeviceInfo = await deviceInfo.androidInfo;
//     } else {
//       iosDeviceInfo = await deviceInfo.iosInfo;
//     }
//     try {
//       // Call the user's CollectionReference to add a new user
//       LogErrorModel logErrorModel = LogErrorModel(
//         userName: hiveApp.get(AppConst.userName) ?? '0000-EasyDocs',
//         platform: Get.theme.platform.name,
//         name: GetPlatform.isAndroid
//             ? androidDeviceInfo?.model ?? ''
//             : iosDeviceInfo?.name ?? '',
//         time: DateTime.now(),
//         version: GetPlatform.isAndroid
//             ? androidDeviceInfo?.version.sdkInt.toString()
//             : iosDeviceInfo?.systemVersion,
//         versionApp: packageInfo.version,
//         error: _toJson(error.response?.data),
//         statusError: error.response?.statusCode.toString() ?? '',
//         path: error.requestOptions.path,
//         type: error.type.toString(),
//         method: error.requestOptions.method,
//         request: _toJson(error.requestOptions.data),
//         queryParameters: _toJson(error.requestOptions.queryParameters),
//         header: _toJson(error.requestOptions.headers),
//         statusMessage: error.response?.statusMessage ?? '',
//         messageLocal: messageLocal,
//         device: GetPlatform.isAndroid
//             ? androidDeviceInfo?.version.release
//             : iosDeviceInfo?.utsname.machine,
//         currentRoute:
//             Get.currentRoute == '/' ? LocaleKeys.app_name.tr : Get.currentRoute,
//       );
//       collections
//           .doc(hiveApp.get(AppConst.userName) ?? '0000-EasyDocs')
//           .collection(Get.theme.platform.name)
//           .doc(logErrorModel.name)
//           .collection(Get.currentRoute)
//           .add(logErrorModel.toJson());
//       //Thêm báo cáo để tổng hợp thống kê
//       collectionsrReport.add(logErrorModel.toJson());
//     } catch (e) {
//       log(e.toString());
//     }
//   }
// }
//
// _toJson(dynamic data) {
//   try {
//     var je = const JsonEncoder.withIndent('  ');
//     var json = je.convert(data);
//     return json;
//   } catch (e) {
//     return data;
//   }
// }
