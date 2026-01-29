part of "profile_page.dart";

Widget _body(ProfileController controller) {
  return Column(
    children: [
      UtilWidget.sizedBox45,
      ImageAppExt.imageIconAndNameApp(),
      UtilWidget.sizedBox25,
      _buildAccount(),
      _buildAction(controller),
      // _buildLogout(controller),
    ],
  ).paddingAll(AppDimens.defaultPadding);
}

Widget _buildAccount() {
  return Card(
    color: AppColors.lightPrimaryColor,
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.white,
          child: SvgPicture.asset(
            Assets.ASSETS_ECERT_ICONUSER_SVG,
          ),
        ),
        UtilWidget.sizedBoxWidth10,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                text: AppInfoCert.instance.cusInfo.taxCode,
                availableStyle: StyleEnum.titleSmall,
                color: AppColors.white,
                maxLine: 2,
              ),
              // TextUtils(
              //   text: AppInfoCert.instance.cusInfo.taxCode,
              //   availableStyle: StyleEnum.bodySmall,
              //   color: AppColors.white,
              //   maxLine: 2,
              // ),
            ],
          ),
        )
      ],
    ).paddingSymmetric(
        horizontal: AppDimens.paddingMedium,
        vertical: AppDimens.defaultPadding),
  );
}

Widget _buildAction(ProfileController controller) {
  return UtilWidget.itemCard(
    child: Column(
      children: [
        // _buildLoginByFingerprint(controller),
        // _buildChangePassword(),
        _buildContactInfo(),
      ],
    ),
  );
}

// Tạm thời k dùng
Widget _buildLoginByFingerprint(ProfileController controller) {
  return _bottomSheetRow(
      Assets.ASSETS_ECERT_SHIELD_DONE_SVG,
      controller.isFaceID
          ? LocaleKeys.eCert_profile_loginFingerprint
          : LocaleKeys.eCert_profile_loginFaceID, onTap: () {
    _actionSwitch(
      controller.isUseFingerprint.value,
      controller,
    );
  },
      trailingWidget: Obx(
        () => Transform.scale(
          scale: 0.7,
          alignment: Alignment.centerRight,
          child: CupertinoSwitch(
            value: controller.isUseFingerprint.value,
            activeColor: AppColors.lightPrimaryColor,
            onChanged: (value) async {
              _actionSwitch(value, controller);
            },
          ),
        ),
      ));
}

Widget _buildChangePassword() {
  return _bottomSheetRow(
    Assets.ASSETS_ECERT_LOCK_SVG,
    LocaleKeys.eCert_profile_changePass,
    onTap: () {
      Get.toNamed(AppRoutes.routePasswordSecurity);
    },
  );
}

Widget _buildContactInfo() {
  return _bottomSheetRow(
    Assets.ASSETS_ECERT_VECTOR_SVG,
    LocaleKeys.eCert_profile_contactInfo,
    onTap: () {
      Get.toNamed(AppRoutes.routeSupport);
    },
  );
}

Widget _buildLogout(ProfileController controller) {
  return UtilWidget.itemCard(
    child: _bottomSheetRow(
      Assets.ASSETS_ECERT_LOGOUT_SVG,
      LocaleKeys.eCert_profile_logout,
      onTap: () {
        controller.funcLogout();
      },
      trailingWidget: SizedBox(),
      backgroundColor: AppColors.colorRedBackground,
      textColor: AppColors.colorRed,
    ),
  );
}

void _actionSwitch(bool bool, ProfileController controller) {}
Widget _bottomSheetRow(
  String svgIcon,
  String title, {
  void Function()? onTap,
  bool isSVG = true,
  Color? backgroundColor,
  Color? textColor,
  Widget? trailingWidget,
}) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(
      vertical: AppDimens.paddingVerySmall,
    ),
    onTap: onTap,
    title: TextUtils(
      text: title.tr,
      availableStyle: StyleEnum.titleSmall,
      size: AppDimens.sizeTextSmaller,
      color: textColor,
    ),
    leading: CircleAvatar(
      backgroundColor: backgroundColor ?? AppColors.lightPrimaryColor2,
      child: isSVG
          ? SvgPicture.asset(
              svgIcon,
              // width: AppDimens.btnSmall,
              // height: AppDimens.btnSmall,
              // colorFilter: const ColorFilter.mode(
              //   AppColors.primaryBlue1,
              //   BlendMode.srcIn,
              // ),
            )
          : Image.asset(
              svgIcon,
              fit: BoxFit.fill,
              width: AppDimens.btnSmall,
              height: AppDimens.btnSmall,
              // color: AppColors.primaryBlue1,
            ),
    ),
    trailing: trailingWidget ??
        const Icon(
          Icons.arrow_forward_ios_outlined,
          size: 15,
          color: AppColors.colorGrayDark,
        ),
  );
}
