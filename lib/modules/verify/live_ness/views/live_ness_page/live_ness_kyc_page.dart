import 'package:camera/camera.dart';
import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/modules/guilde/register_cert.src.dart';
import 'package:ecert/modules/verify/live_ness/live_ness_kyc.src.dart';
import 'package:ecert/shares/shares_src.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

part 'live_ness_kyc_view.dart';

class LiveNessKycPage extends BaseGetWidget<LiveNessKycController> {
  const LiveNessKycPage({super.key});

  @override
  LiveNessKycController get controller => Get.put(LiveNessKycController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      body: buildLoadingOverlay(
        () => _body(controller),
      ),
    );
  }
}
