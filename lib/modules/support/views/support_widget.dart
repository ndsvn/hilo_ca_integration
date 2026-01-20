part of 'support_page.dart';

Widget _buildBody(SupportController passwordCtrl) {
  return SingleChildScrollView(
    child: Column(
      children: [
        UtilWidget.sizedBox25,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SvgPicture.asset(
            //   Assets.ASSETS_ECERT_ICONAPP_SVG,
            //   height: AppDimens.iconSmall.h,
            // ),
            // UtilWidget.sizedBoxWidth10,
            TextUtils(
              text: LocaleKeys.eCert_support_company,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        UtilWidget.sizedBox25,
        _itemSupport(
          title: LocaleKeys.eCert_support_addressTitle,
          content: LocaleKeys.eCert_support_address,
          icon: Assets.ASSETS_ECERT_ADDRESS_SVG,
          onTap: () {},
        ),
        _itemSupport(
          title: LocaleKeys.eCert_support_phone1Title,
          content: LocaleKeys.eCert_support_phone1,
          icon: Assets.ASSETS_ECERT_HEADPHONES_01_SVG,
          onTap: () {
            UtilWidget.launchInBrowser(LocaleKeys.eCert_support_phone1.tr);
          },
        ),
        _itemSupport(
          title: LocaleKeys.eCert_support_emailTitle,
          content: LocaleKeys.eCert_support_email,
          icon: Assets.ASSETS_ECERT_MAIL_LINE_SVG,
          onTap: () {
            UtilWidget.launchInBrowser(LocaleKeys.eCert_support_email.tr);
          },
        ),
        _itemSupport(
          title: LocaleKeys.eCert_support_webTitle,
          content: LocaleKeys.eCert_support_web,
          icon: Assets.ASSETS_ECERT_GLOBE_02_SVG,
          onTap: () {
            UtilWidget.launchInBrowser(LocaleKeys.eCert_support_web.tr);
          },
        ),
      ],
    ).paddingSymmetric(
      horizontal: AppDimens.defaultPadding,
    ),
  );
}

Widget _itemSupport({
  required String title,
  required String content,
  required String icon,
  required Function onTap,
  FontWeight? fontWeight,
}) {
  return InkWell(
    onTap: () {
      UtilWidget.onTapButton(
        onTap: onTap,
        isLoading: false,
      );
    },
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    text: title.tr,
                    customStyle: FontStyleUtils.fontStyleOpenSans(
                      fontSize: AppDimens.sizeTextMediumTb,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  UtilWidget.sizedBox5,
                  TextUtils(
                    text: content.tr,
                    customStyle: FontStyleUtils.fontStyleOpenSans(
                      fontWeight: fontWeight ?? FontWeight.w500,
                      fontSize: AppDimens.sizeText14,
                      color: AppColors.colorNeutral1,
                    ),
                    maxLine: 3,
                  ),
                ],
              ),
            ),
            Container(
              height: 43.h,
              width: 68.w,
              decoration: BoxDecoration(
                color: AppColors.lightPrimaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.defaultPadding),
              child: Center(
                child: SvgPicture.asset(icon),
              ),
            ),
          ],
        ).paddingSymmetric(vertical: AppDimens.defaultPadding),
        UtilWidget.dividerDefault,
      ],
    ),
  );
}
