import 'package:hilo_ca_integration/routes/routes.dart';
import 'package:flutter/material.dart';

import '../../../base_utils/base_src.dart';
import '../../../generated/locales.g.dart';
import '../../../shares/shares_src.dart';
import '../register_cert.src.dart';

class GuideCert extends StatelessWidget {
  const GuideCert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: AppColors.colorWhite,
        appBar: UtilWidget.buildAppBar(
          LocaleKeys.eCert_guide_title.tr,
          isColorGradient: false,
          leading: true,
        ),
        body: GuideComponent.itemBody(
            AppInfoCert.instance.isPersonal
                ? _buildGuildPersonal()
                : _buildGuildOrg(), () {
          Get.toNamed(AppRoutes.routeProvisionECertPage);
        }));
  }

  List<Widget> _buildGuildOrg() => [
        GuideComponent.itemInstruct(
          step: LocaleKeys.eCert_guide_step1.tr,
          content: LocaleKeys.eCert_guide_step1Title.tr,
          image: Assets.ASSETS_ECERT_IMGSTEP1_PNG,
        ),
        UtilWidget.sizedBox10,
        GuideComponent.buildIconNext(),
        UtilWidget.sizedBox10,
        GuideComponent.itemInstruct(
          step: LocaleKeys.eCert_guide_step2.tr,
          content: LocaleKeys.eCert_guide_step2Title.tr,
          image: Assets.ASSETS_ECERT_IMGSTEP2_PNG,
        ),
        UtilWidget.sizedBox10,
        GuideComponent.buildIconNext(),
        UtilWidget.sizedBox10,
        GuideComponent.itemInstruct(
          step: LocaleKeys.eCert_guide_step3.tr,
          content: LocaleKeys.eCert_guide_step3Title.tr,
          image: Assets.ASSETS_ECERT_IMGSTEP3_PNG,
        ),
        UtilWidget.sizedBox10,
        GuideComponent.buildIconNext(),
        UtilWidget.sizedBox10,
        GuideComponent.itemInstruct(
          step: LocaleKeys.eCert_guide_step4.tr,
          content: LocaleKeys.eCert_guide_step4Title.tr,
          image: Assets.ASSETS_ECERT_IMGSTEP4_PNG,
        ),
      ];
  List<Widget> _buildGuildPersonal() => [
        GuideComponent.itemInstruct(
          step: LocaleKeys.eCert_guide_step1.tr,
          content: LocaleKeys.eCert_guide_step2Title.tr,
          image: Assets.ASSETS_ECERT_IMGSTEP2_PNG,
        ),
        UtilWidget.sizedBox10,
        GuideComponent.buildIconNext(),
        UtilWidget.sizedBox10,
        GuideComponent.itemInstruct(
          step: LocaleKeys.eCert_guide_step2.tr,
          content: LocaleKeys.eCert_guide_step3Title.tr,
          image: Assets.ASSETS_ECERT_IMGSTEP3_PNG,
        ),
        UtilWidget.sizedBox10,
        GuideComponent.buildIconNext(),
        UtilWidget.sizedBox10,
        GuideComponent.itemInstruct(
          step: LocaleKeys.eCert_guide_step3.tr,
          content: LocaleKeys.eCert_guide_step4Title.tr,
          image: Assets.ASSETS_ECERT_IMGSTEP4_PNG,
        ),
      ];
}
