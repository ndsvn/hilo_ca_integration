import 'package:hilo_ca_integration/base_utils/controllers_base/base_controller.src.dart';
import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/material.dart';

class SplashPage extends GetView<AppController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppController(), permanent: true);
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
