import 'package:ecert/base_utils/views_base/views_base_src.dart';
import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/shares/shares_src.dart';
import 'package:flutter/material.dart';

import '../system_invoices.src.dart';

part 'system_invoices_view.dart';

class SystemInvoicesPage extends BaseGetWidget<SystemInvoicesController> {
  const SystemInvoicesPage({super.key});

  @override
  SystemInvoicesController get controller =>
      Get.put(SystemInvoicesController());

  @override
  Widget buildWidgets(context) {
    return Scaffold(
      body: _body(controller),
    );
  }
}
