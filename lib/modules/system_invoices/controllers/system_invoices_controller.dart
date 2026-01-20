import 'dart:async';

import 'package:hilo_ca_integration/routes/routes.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/material.dart';

import '../../../../base_utils/base_src.dart';
import '../system_invoices.src.dart';

class SystemInvoicesController extends BaseGetxController {
  Rxn<SystemInvoicesResponse> systemInvoicesSelect =
      Rxn<SystemInvoicesResponse>();
  late RepositorySystemInvoices systemInvoicesRepository;
  RxList<SystemInvoicesResponse> listSystemInvoices =
      RxList<SystemInvoicesResponse>();
  late TextEditingController textEditingController = TextEditingController();
  RxList<SystemInvoicesResponse> listSystemInvoicesSearch =
      RxList<SystemInvoicesResponse>();

  @override
  Future<void> onInit() async {
    systemInvoicesSelect.value = AppConfig.instance.getSystemInvoices();
    systemInvoicesRepository = RepositorySystemInvoices(this);
    await getSystemInvoices();
    super.onInit();
  }

  Future<void> getSystemInvoices() async {
    showLoading();
    BaseResponseListBECert<SystemInvoicesResponse> baseResponseList =
        await systemInvoicesRepository.getSystemInvoices();
    final listResult = baseResponseList.data;
    listSystemInvoices.assignAll(listResult);
    listSystemInvoicesSearch.assignAll(listResult);
    hideLoading();
  }

  Future<void> funcSystemInvoices() async {
    if (systemInvoicesSelect.value == null) {
      return;
    }
    AppConfig.instance.setSystemInvoices(systemInvoicesSelect.value!);
    Get.offAndToNamed(AppRoutes.routeLogin);
  }

  void functionSearch() {
    if (textEditingController.text.isEmpty) {
      listSystemInvoicesSearch.assignAll(listSystemInvoices);
      return;
    }
    listSystemInvoicesSearch.assignAll(listSystemInvoices.where((element) {
      return element.name.contains(textEditingController.text) ||
          element.host.contains(textEditingController.text);
    }).toList());
  }
}
