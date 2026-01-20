import 'dart:async';

import 'package:hilo_ca_integration/routes/routes.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/material.dart';

import 'base_utils/base_src.dart';

class AppLinkContract {
  static void initDeepLinks(
      AppLinks appLinks, StreamSubscription<Uri>? linkSubscription) async {
    // Handle links
    linkSubscription = appLinks.uriLinkStream.listen((uri) {
      debugPrint('onAppLink: $uri');
      200.milliseconds.delay(() {
        if (uri.queryParameters["taskId"] != null) {
          // Nếu đã mở ứng dụng thì đóng các trang hiện tại và vào luôn màn chi tiết hồ sơ
          if (Get.isRegistered<AppController>()) {
            Get.offAllNamed(
              AppRoutes.routeLogin,
              parameters: uri.queryParameters,
            );
          } else {
            // Nếu chưa mở ứng dụng thì init dữ liệu và vào màn chi tiết hồ sơ
            Get.offAllNamed(
              AppRoutes.routeSplash,
              parameters: uri.queryParameters,
            );
          }

          // Get.toNamed(uri.path);
        } else {
          Get.offAllNamed(AppRoutes.routeLogin);
        }
      });
    });
  }
}
