import 'package:hilo_ca_integration/base_utils/controllers_base/base_controller.src.dart';
import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/material.dart';
import 'package:hilo_ca_integration/modules/system_invoices/models/system_invoices_response.dart';
import 'package:hilo_ca_integration/routes/routes.dart';
import 'package:get/get.dart';
import 'package:hilo_ca_integration/base_utils/controllers_base/app_controller/app_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final AppController controller;

  @override
  void initState() {
    super.initState();

   
    controller = Get.isRegistered<AppController>()
        ? Get.find<AppController>()
        : Get.put(AppController(), permanent: true);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.ready; // nếu đã init rồi -> chạy ngay

      if (!mounted) return;

      // Tránh chuyển lại nếu đang ở đúng route (tuỳ bạn)
      if (Get.currentRoute != AppRoutes.routeLogin) {
        AppConfig.instance.setSystemInvoices(new SystemInvoicesResponse(
          id: "b1747115-c812-40cd-8d39-7413116f7e3b",
          code: "HILO.CRM",
          name: "[HILO.CRM] Hệ thống CRM",
          host: "https://crmapi.hilo.com.vn",
        ));
        Get.offAndToNamed(AppRoutes.routeLogin);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.splashColor(),
      alignment: Alignment.center,
      child: Center(
        child: SvgPicture.asset(
          Assets.ASSETS_ECERT_ICONAPP_SVG,
          width: 136,
          height: 115,
        ),
      ),
    );
  }
}
