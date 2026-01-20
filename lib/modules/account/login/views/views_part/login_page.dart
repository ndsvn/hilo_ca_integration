import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/base_utils/views_base/views_base_src.dart';
import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/modules/modules_src.dart';
import 'package:ecert/routes/routes.dart';
import 'package:ecert/shares/shares_src.dart';
import 'package:flutter/material.dart';

part '../views_part_of/login_view.dart';

class LoginPage extends BaseGetWidget<LoginController> {
  const LoginPage({super.key});

  @override
  LoginController get controller => Get.put(LoginController());

  @override
  Widget buildWidgets(context) {
    return Scaffold(
      body: _body(controller),
    );
  }
}
