import 'package:hilo_ca_integration/base_utils/views_base/views_base_src.dart';
import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:hilo_ca_integration/generated/locales.g.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
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
