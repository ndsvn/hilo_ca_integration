import 'package:hilo_ca_integration/cores/cores_src.dart';
import 'package:hilo_ca_integration/generated/locales.g.dart';
import 'package:flutter/material.dart';

class ListCTSCollection {
  static const Map<String, Color> colorBackground = {
    "ACTIVE": AppColors.lightPrimaryColor,
    "INACTIVE": AppColors.colorGreen,
    "DEACTIVE": AppColors.colorRed,
  };
  static Map<String, String> colorTitle = {
    "ACTIVE": LocaleKeys.eCert_listCTS_active,
    "INACTIVE": LocaleKeys.eCert_listCTS_inactive,
    "DEACTIVE": LocaleKeys.eCert_listCTS_expired,
  };
}
