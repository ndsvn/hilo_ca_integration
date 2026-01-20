part of 'list_cts_page.dart';

Widget _itemBody(ListPageController controller) {
  return Column(
    children: [
      Expanded(
        child: controller.list.isEmpty
            ? UtilWidget.baseEmpty()
            : UtilWidget.buildSmartRefresher(
                refreshController: controller.refreshController,
                onRefresh: controller.onRefresh,
                enablePullUp: false,
                child: ListView.builder(
                  itemCount: controller.list.length,
                  itemBuilder: (context, index) => _itemPage(
                    item: controller.list[index],
                    controller: controller,
                    index: index,
                  ),
                ),
              ),
      ),
      GetPlatform.isAndroid ? UtilWidget.sizedBox10 : UtilWidget.sizedBox15,
    ],
  ).paddingSymmetric(horizontal: 0);
}

Widget _itemPage({
  required ListCtsModelView item,
  required ListPageController controller,
  required int index,
}) {
  return UtilWidget.itemCard(
    onTap: () {
      controller.goToDetail(item);
    },
    color: ListCTSCollection.colorBackground[item.listCtsModel.status],
    child: Container(
      margin: EdgeInsets.symmetric(vertical: AppDimens.defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextUtils(
                      text: item.distinguishedName.cn ?? "",
                      availableStyle: StyleEnum.bodyMedium,
                      color: AppColors.colorTextWhite,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: AppColors.colorTextWhite,
                    size: AppDimens.iconVerySmall,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Divider(color: Colors.white.withOpacity(0.3)),
              SizedBox(height: 8),
              UtilWidget.sizedBox10,
              _itemRow(
                value: item.listCtsModel.serial,
                title: LocaleKeys.list_cts_Serial,
                img: Assets.ASSETS_ECERT_SERI_SVG,
              ),
              UtilWidget.sizedBox5,
              _itemRow(
                value:
                    "${controller.convertStringDate(item.listCtsModel.issueTime)} - ${controller.convertStringDate(item.listCtsModel.expireTime)}",
                title: LocaleKeys.list_cts_date,
                img: Assets.ASSETS_ECERT_CLOCK_SVG,
              ),
              UtilWidget.sizedBox32,
            ],
          ),
          _buildStatus(item)
        ],
      ),
    ),
  ).paddingAll(AppDimens.paddingVerySmall);
}

Widget _buildStatus(ListCtsModelView item) {
  return Align(
    alignment: Alignment.bottomLeft,
    child: Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.paddingSmaller, vertical: AppDimens.size3D),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.colorNeutral6, width: 1),
          borderRadius: BorderRadius.circular(AppDimens.radius8),
          color: AppColors.colorNeutral6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            Assets.ASSETS_ECERT_PRICE_EXPIRE_SVG,
            colorFilter: ColorFilter.mode(
              ListCTSCollection.colorBackground[item.listCtsModel.status] ??
                  AppColors.colorRed,
              BlendMode.srcIn,
            ),
          ),
          UtilWidget.sizedBoxWidth10,
          TextUtils(
            text: ListCTSCollection.colorTitle[item.listCtsModel.status]?.tr ??
                LocaleKeys.detail_cts_waitActivate.tr,
            availableStyle: StyleEnum.bodySmall,
            maxLine: 3,
            color: ListCTSCollection.colorBackground[item.listCtsModel.status],
            textAlign: TextAlign.start,
          ),
        ],
      ),
    ),
  );
}

Row _itemRow({
  required String title,
  required String value,
  required String img,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SvgPicture.asset(
        img,
        colorFilter: const ColorFilter.mode(
          AppColors.white,
          BlendMode.srcIn,
        ),
      ),
      UtilWidget.sizedBoxWidth5,
      Expanded(
        flex: 1,
        child: TextUtils(
          text: title.tr,
          availableStyle: StyleEnum.bodySmall,
          maxLine: 3,
          color: AppColors.colorNeutral6,
          textAlign: TextAlign.start,
        ),
      ),
      Expanded(
        flex: 2,
        child: TextUtils(
          text: value.tr,
          availableStyle: StyleEnum.titleSmall,
          maxLine: 3,
          color: AppColors.colorNeutral6,
          textAlign: TextAlign.end,
        ),
      ),
    ],
  );
}
