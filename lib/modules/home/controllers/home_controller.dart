import 'package:ecert/modules/modules_src.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../base_utils/base_src.dart';

class HomeController extends BaseGetxController
    with GetSingleTickerProviderStateMixin {
  Rx<TabItem> currentTab = TabItem.homePage.obs;

  late final TabController tabController;

  int tabIndex = 0;

  @override
  void onInit() {
    _setTab();

    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void _setTab() {
    tabController = TabController(length: 3, vsync: this);
  }

  funcPageChange(int index) {
    currentTab.value = TabItem.values[index];
    if (currentTab.value == TabItem.listCert) {
      if (Get.isRegistered<ListPageController>()) {
        Get.find<ListPageController>().onRefresh();
      }
    }
  }
}
