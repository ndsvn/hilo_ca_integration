import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/cores/values/const.dart';
import 'package:hilo_ca_integration/modules/modules_src.dart';
import 'package:hilo_ca_integration/modules/nfc_kyc/nfc/model/nfc_model.dart';

class AppConfig {
  static AppConfig? _instance;

  static AppConfig get instance => _instance ??= AppConfig._internal();

  AppConfig._internal();
  String? keyAccessDataNFCIos;
 
  /// Biến chứa thông tin đăng ký
  NfcModelApp nfcModelApp = NfcModelApp();

  void setSystemInvoices(SystemInvoicesResponse systemInvoicesResponse) {
    hiveApp.put(AppConst.sytemsInvoices, systemInvoicesResponse.toJsonString());
  }

  SystemInvoicesResponse? getSystemInvoices() {
    if (hiveApp.get(AppConst.sytemsInvoices) == null) {
      return null;
    }
    return SystemInvoicesResponse.fromJsonString(
        hiveApp.get(AppConst.sytemsInvoices));
  }

  void setKeyAccessDataNFCIos(String key) {
    keyAccessDataNFCIos = key;
  }

  String? getKeyAccessDataNFCIos() {
    return keyAccessDataNFCIos;
  }

  void clearData() {
    nfcModelApp = NfcModelApp();
    keyAccessDataNFCIos = null;
  }
}
