part of 'provision_page.dart';

Widget _itemBody(ProvisionECretController controller) {
  return Column(
    children: [
      Expanded(
        child: SingleChildScrollView(
          child: HtmlWidget(
            controller.html,
            // textStyle: Get.textTheme.bodyLarge
            //     ?.copyWith(fontSize: AppDimens.sizeTextSmall, height: 1.6),
            onTapUrl: (url) {
              // openUrlString(url);
              return true;
            },
            enableCaching: true,
          ).paddingSymmetric(
            vertical: AppDimens.iconVerySmall,
          ),
        ),
      ),
      UtilWidget.sizedBox5,
      UtilWidget.buildCheckBox(
        LocaleKeys.provision_provision.tr,
        controller.acceptProvision,
      ),
      UtilWidget.sizedBox15,
      Obx(
        () => UtilWidget.buildButtonPrimary(
          LocaleKeys.provision_button.tr,
          () {
            if (controller.acceptProvision.value) {
              if (AppInfoCert.instance.isPersonal) {
                Get.toNamed(AppRoutes.routeGuideNFC);
              } else {
                Get.toNamed(AppRoutes.routeGuideUploadRegistration);
              }
            }
          },
          isLoading: controller.isShowLoading.value,
          backgroundColor:
              controller.acceptProvision.value ? null : AppColors.colorNeutral2,
        ),
      ),
      GetPlatform.isAndroid ? UtilWidget.sizedBox10 : UtilWidget.sizedBox15,
    ],
  ).paddingSymmetric(horizontal: AppDimens.iconVerySmall);
}
