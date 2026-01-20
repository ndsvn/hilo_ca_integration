import 'package:hilo_ca_integration/modules/home/views/bottom_navigation.dart';
import 'package:hilo_ca_integration/modules/list_cts/list_cts.src.dart';
import 'package:hilo_ca_integration/modules/profile/profile.src.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base_utils/base_src.dart';
import '../../../shares/shares_src.dart';
import '../../overview/views/views_src.dart';
import '../home.src.dart';

class HomePage extends BaseGetWidget<HomeController> {
  const HomePage({super.key});

  @override
  HomeController get controller => Get.put(HomeController());

  // TabItem currentTab = TabItem.homePage;

  @override
  Widget buildWidgets(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, value) {
        if (didPop) {
          return;
        }
        if (controller.currentTab.value == TabItem.homePage) {
          Get.back();
        } else {
          controller.tabController.animateTo(0);
          controller.funcPageChange(0);
        }
      },
      child: DefaultTabController(
        length: HomeConst.tabName.length,
        child: Scaffold(
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.tabController,
            children: const [
              OverviewPage(),
              ListCTSPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: Obx(
            () => BottomNavigation(
              currentTab: controller.currentTab.value,
              homeController: controller,
              tabController: controller.tabController,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}
