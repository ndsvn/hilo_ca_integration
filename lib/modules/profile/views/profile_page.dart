//Tạm thời để BottomSheet vì view sẵn, sau này đổi lại page
import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/modules/profile/controllers/profile_controller.dart';
import 'package:ecert/routes/routes.dart';
import 'package:ecert/shares/shares_src.dart';
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
