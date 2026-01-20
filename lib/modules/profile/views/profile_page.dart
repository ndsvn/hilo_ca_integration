//Tạm thời để BottomSheet vì view sẵn, sau này đổi lại page
import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:hilo_ca_integration/generated/locales.g.dart';
import 'package:hilo_ca_integration/modules/profile/controllers/profile_controller.dart';
import 'package:hilo_ca_integration/routes/routes.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'profile_view.dart';

class ProfilePage extends BaseGetWidget<ProfileController> {
  const ProfilePage({super.key});

  @override
  ProfileController get controller => Get.put(ProfileController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      body: _body(controller),
    );
  }
}
