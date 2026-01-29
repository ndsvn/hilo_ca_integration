part of 'overview_page.dart';

Widget _buildBody(OverviewCtrl controller) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UtilWidget.sizedBox45,
        ImageAppExt.imageIconAndNameApp(),
        UtilWidget.sizedBox10,
        TextUtils(
          text: LocaleKeys.eCert_home_welcome,
          fontWeight: FontWeight.w700,
          color: AppColors.colorGrey,
        ),
        UtilWidget.sizedBox10,
        TextUtils(
          text: AppInfoCert.instance.cusInfo.name,
          fontWeight: FontWeight.w700,
          color: AppColors.colorTextBlack,
        ),
        UtilWidget.sizedBox25,
        _buildCTSRegister(controller),
        UtilWidget.sizedBox10,
        _buildCTSRegisterPersonal(controller),
        UtilWidget.sizedBox10,
        _buildLogout(controller),
        UtilWidget.sizedBox10,
        Center(
          child: GestureDetector(
            onTap: () {
              controller.showLog();
            },
            child: Image.asset(
              Assets.ASSETS_ECERT_IMAGEHOME_PNG,
              height: 204.h,
              width: 327.w,
            ),
          ),
        ),
        SizedBox(
          height: 70.h,
        ),
        // _buildQuantity(controller),
      ],
    ).paddingAll(AppDimens.defaultPadding),
  );
}

Widget _buildCTSRegister(OverviewCtrl controller) {
  return _itemCard(
    colorCard: AppColors.lightPrimaryColor,
    onTap: () {
      controller.getList(isPersonal: false);
    },
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.white,
          child: SvgPicture.asset(
            Assets.ASSETS_ECERT_ORG_SVG,
          ),
        ),
        UtilWidget.sizedBoxWidth10,
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: TextUtils(
                  text: LocaleKeys.eCert_home_register.tr,
                  availableStyle: StyleEnum.titleSmall,
                  color: AppColors.white,
                  maxLine: 2,
                ),
              ),
              UtilWidget.sizedBoxWidth15,
              Container(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  Assets.ASSETS_IMAGES_ICON_ICON_SVG_IC_MORE_SVG,
                  colorFilter:
                      const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _buildCTSRegisterPersonal(OverviewCtrl controller) {
  return _itemCard(
    colorCard: AppColors.lightPrimaryColor,
    onTap: () {
      controller.getList(isPersonal: true);
    },
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.white,
          child: SvgPicture.asset(
            Assets.ASSETS_ECERT_ACCOUNT_USER_AVATAR_SVGREPO_COM_1_SVG,
          ),
        ),
        UtilWidget.sizedBoxWidth10,
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: TextUtils(
                  text: LocaleKeys.eCert_home_registerPersonal.tr,
                  availableStyle: StyleEnum.titleSmall,
                  color: AppColors.white,
                  maxLine: 2,
                ),
              ),
              UtilWidget.sizedBoxWidth15,
              Container(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                  Assets.ASSETS_IMAGES_ICON_ICON_SVG_IC_MORE_SVG,
                  colorFilter:
                      const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _buildLogout(OverviewCtrl controller) {
  return _itemCard(
    colorCard: AppColors.lightPrimaryColor,
    onTap: () {
      Get.back();
    },
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.white,
          child: Icon(Icons.logout),
        ),
        UtilWidget.sizedBoxWidth10,
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: TextUtils(
                  text: "Đăng xuất",
                  availableStyle: StyleEnum.titleSmall,
                  color: AppColors.white,
                  maxLine: 2,
                ),
              ),
              UtilWidget.sizedBoxWidth15,
              Container(
                alignment: Alignment.topRight,
                // child: SvgPicture.asset(
                //   Assets.ASSETS_IMAGES_ICON_ICON_SVG_IC_MORE_SVG,
                //   colorFilter:
                //       const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                // ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget _buildQuantity(OverviewCtrl controller) {
  return _itemCard(
    child: Column(
      children: [
        TextUtils(
          text: LocaleKeys.eCert_home_quantity.tr,
          availableStyle: StyleEnum.titleSmall,
          color: AppColors.colorTextBlack,
          maxLine: 2,
        ),
        UtilWidget.sizedBox10,
        Row(
          children: [
            Expanded(
              child: _itemCard(
                colorCard: AppColors.colorsBackgroundHomeActive,
                onTap: () {},
                child: _itemCert(
                  content: 0.toString(),
                  title: LocaleKeys.eCert_home_active.tr,
                  color: AppColors.colorPrimary1,
                ),
                paddingLeft: AppDimens.paddingSmall,
              ),
            ),
            UtilWidget.sizedBoxWidth10,
            Expanded(
              child: _itemCard(
                onTap: () {},
                colorCard: AppColors.colorsBackgroundHomeExpire,
                child: _itemCert(
                  content: 0.toString(),
                  title: LocaleKeys.eCert_home_expire.tr,
                  color: AppColors.colorsTextHomeExpire,
                ),
                paddingLeft: AppDimens.paddingSmall,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _itemCert(
    {required String content, required String title, required Color color}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      TextUtils(
        text: content,
        availableStyle: StyleEnum.bodyMedium,
        fontWeight: FontWeight.w700,
        color: color,
      ),
      TextUtils(
        text: title,
        availableStyle: StyleEnum.bodyVerySmall,
        color: color,
      ),
    ],
  );
}

Widget _itemCard(
    {required Widget child,
    Function? onTap,
    double? paddingLeft,
    Color? colorCard}) {
  return GestureDetector(
    onTap: () {
      onTap?.call();
    },
    child: Card(
      margin: EdgeInsets.zero,
      color: colorCard ?? AppColors.colorWhite,
      child: paddingLeft != null
          ? child.paddingOnly(
              right: AppDimens.paddingMedium,
              left: paddingLeft,
              bottom: AppDimens.defaultPadding,
              top: AppDimens.defaultPadding,
            )
          : child.paddingSymmetric(
              horizontal: AppDimens.paddingMedium,
              vertical: AppDimens.defaultPadding),
    ),
  );
}
