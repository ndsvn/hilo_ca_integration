part of 'detail_cts_page.dart';

Widget _itemBody(DetailPageController controller) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 40),
        ItemTextWidget.buildItemText(
          LocaleKeys.confirm_cts_name.tr,
          controller.name,
        ),
        ItemTextWidget.buildItemText(
          LocaleKeys.confirm_cts_seri.tr,
          controller.seri,
        ),
        ItemTextWidget.buildItemText(
          LocaleKeys.confirm_cts_company.tr,
          controller.company,
        ),
        ItemTextWidget.buildItemText(
          LocaleKeys.confirm_cts_infoUser.tr,
          controller.infoUser,
        ),
        ItemTextWidget.buildItemText(
          LocaleKeys.confirm_cts_time.tr,
          controller.time,
        ),
        ItemTextWidget.buildItemText(
          LocaleKeys.confirm_cts_status.tr,
          controller.status,
        ),
      ],
    ),
  ).paddingSymmetric(horizontal: AppDimens.paddingMedium);
}

