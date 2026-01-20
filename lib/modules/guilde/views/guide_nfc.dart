import 'package:flutter/material.dart';

import '../../../generated/locales.g.dart';
import '../../../routes/routes.dart';
import '../../../shares/shares_src.dart';
import '../register_cert.src.dart';

class GuideNFC extends StatelessWidget {
  const GuideNFC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: AppColors.colorWhite,
        appBar: UtilWidget.buildAppBar(
          LocaleKeys.eCert_CCCD_title.tr,
          isColorGradient: false,
          leading: true,
        ),
        body: GuideComponent.itemBody([
          GuideComponent.itemInstruct(
            step: LocaleKeys.eCert_CCCD_step1.tr,
            content: LocaleKeys.eCert_CCCD_step1TitlePersonal.tr,
            image: Assets.ASSETS_ECERT_IMGSTEPCCCD1_PNG,
          ),
          UtilWidget.sizedBox10,
          GuideComponent.buildIconNext(),
          UtilWidget.sizedBox10,
          GuideComponent.itemInstruct(
            step: LocaleKeys.eCert_CCCD_step2.tr,
            content: LocaleKeys.eCert_CCCD_step2Title.tr,
            image: Assets.ASSETS_ECERT_IMGSTEPCCCD2_PNG,
          ),
          UtilWidget.sizedBox10,
          GuideComponent.buildIconNext(),
          UtilWidget.sizedBox10,
          GuideComponent.itemInstruct(
            step: LocaleKeys.eCert_CCCD_step3.tr,
            content: LocaleKeys.eCert_CCCD_step3Title.tr,
            image: Assets.ASSETS_ECERT_IMGSTEPCCCD3_PNG,
          ),
        ], () {
          Get.toNamed(AppRoutes.routeUpdatePhoToInformationKyc);
        }));
  }
}
