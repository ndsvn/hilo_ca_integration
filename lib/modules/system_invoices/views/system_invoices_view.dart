part of 'system_invoices_page.dart';

Widget _body(SystemInvoicesController controller) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          height: Get.height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(AppDimens.sizeBorderNavi),
            ),
            image: DecorationImage(
              image: AssetImage(
                Assets.ASSETS_ECERT_LOGINBACKGROUND_PNG,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 108.h,
              ),
              SvgPicture.asset(
                Assets.ASSETS_ECERT_ICONAPP_SVG,
                height: 60.h,
                width: 106.w,
              ),
              UtilWidget.sizedBox20,
              SizedBox(
                height: Get.width / 4,
              ),
              _buildFormSystemInvoices(controller),
              const Spacer(),
              Text(
                LocaleKeys.eCert_login_company.tr,
                textAlign: TextAlign.center,
                style: FontStyleUtils.fontStyleOpenSans(
                  fontSize: AppDimens.sizeTextSmaller,
                  color: AppColors.colorBasicGrey,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildbtnSelect(SystemInvoicesController controller) {
  return Obx(
    () => Container(
      height: 52.h,
      decoration: BoxDecoration(
          color: AppColors.colorInput,
          borderRadius: BorderRadius.circular(AppDimens.radius5)),
      child: ElevatedButton(
        onPressed: () async {
          controller.textEditingController.clear();
          controller.listSystemInvoicesSearch
              .assignAll(controller.listSystemInvoices);
          Get.bottomSheet(
            _buildBottomSheet(controller),
            isScrollControlled: true,
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          padding: EdgeInsets.zero,
          foregroundColor: AppColors.colorTransparent,
          backgroundColor: AppColors.colorTransparent,
          shadowColor: AppColors.colorTransparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.radius5)),
        ),
        child: Row(
          children: [
            UtilWidget.sizedBoxWidth10,
            SizedBox(
              child: SvgPicture.asset(
                Assets.ASSETS_ECERT_SEARCH_SVG,
                width: AppDimens.iconVerySmall,
                height: AppDimens.iconVerySmall,
              ),
            ),
            UtilWidget.sizedBoxWidth10,
            Expanded(
              child: TextUtils(
                text: controller.systemInvoicesSelect.value?.name ?? "",
                availableStyle: StyleEnum.subBold,
                color: AppColors.colorTextBlack,
              ),
            ),
            UtilWidget.sizedBoxWidth10,
            SvgPicture.asset(
              Assets.ASSETS_ECERT_DROPDOWN_SVG,
              width: AppDimens.iconVerySmall,
              height: AppDimens.iconVerySmall,
            ),
            UtilWidget.sizedBoxWidth10,
          ],
        ),
      ),
    ),
    // UtilWidget.buildButton(
    //   controller.systemInvoicesSelect.value?.name ?? "",
    //   () async {
    //     controller.textEditingController.clear();
    //     controller.listSystemInvoicesSearch
    //         .assignAll(controller.listSystemInvoices);
    //     Get.bottomSheet(
    //       _buildBottomSheet(controller),
    //       isScrollControlled: true,
    //     );
    //   },
    //   backgroundColor: AppColors.colorInput,
    //   borderRadius: BorderRadius.circular(AppDimens.radius5),
    //   height: 52.h,
    //   colorText: AppColors.colorTextBlack,
    // ),
  );
}

Widget _buildBottomSheet(SystemInvoicesController controller) {
  return UtilWidget.baseBottomSheet(
    title: LocaleKeys.eCert_system_invoices_titleSelect.tr,
    body: _buildListSystemInvoices(controller),
    noHeader: true,
  );
}

Widget _buildFormSystemInvoices(SystemInvoicesController controller) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        SizedBox(
          height: Get.height * 0.02,
        ),
        UtilWidget.sizedBox10,
        _buildbtnSelect(controller),
        const SizedBox(
          height: AppDimens.btnSmall,
        ),
        // UtilWidget.sizedBox25,
        _buildButtonSystemInvoices(controller),
        // UtilWidget.sizedBox10,
      ],
    ).paddingSymmetric(horizontal: AppDimens.paddingHuge),
  );
}

Widget _buildButtonSystemInvoices(
  SystemInvoicesController controller,
) {
  return SizedBox(
    height: AppDimens.btnMediumMaz,
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: UtilWidget.buildButton(
            LocaleKeys.eCert_system_invoices_continue.tr,
            () async => await controller.funcSystemInvoices(),
            backgroundColor: AppColors.lightPrimaryColor,
            height: 52.h,
          ),
        ),
      ],
    ),
  );
}

Widget _buildListSystemInvoices(SystemInvoicesController controller) {
  Rxn<SystemInvoicesResponse> systemInvoicesSelectTemp =
      Rxn<SystemInvoicesResponse>(controller.systemInvoicesSelect.value);
  return Expanded(
    child: Obx(() {
      return Column(
        children: [
          UtilWidget.sizedBox10,
          _buildTitle(),
          UtilWidget.sizedBox10,
          Expanded(
            child: Column(
              children: [
                _buildInputSearch(controller),
                UtilWidget.sizedBox10,
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => _itemSystemInvoices(
                      controller.listSystemInvoicesSearch[index],
                      controller,
                      systemInvoicesSelectTemp,
                    ),
                    itemCount: controller.listSystemInvoicesSearch.length,
                  ),
                ),
              ],
            ),
          ),
          _buildbtnConfirm(controller, systemInvoicesSelectTemp),
        ],
      );
    }),
  );
}

Widget _buildInputSearch(SystemInvoicesController controller) {
  return BuildInputText(
    InputTextModel(
      borderRadius: AppDimens.radiusMedium,
      isShowCounterText: false,
      maxLengthInputForm: AppDimens.btnMediumFont,
      controller: controller.textEditingController,
      fillColor: AppColors.colorSearch,
      hintTextSize: AppDimens.sizeTextSmall,
      hintTextColor: AppColors.colorHintText,
      colorBorder: AppColors.colorSearchBorder,
      floatingLabelStyle: AppTextStyle.labelStyle(
        size: AppDimens.sizeTextLarge,
      ),
      textInputType: TextInputType.text,
      contentPadding: const EdgeInsets.all(AppDimens.paddingSmall),
      isDense: true,
      iconLeadingSVG: Assets.ASSETS_ECERT_SEARCH_SVG,
      colorFocusedBorder: AppColors.colorSearchBorder,
      functionSearch: controller.functionSearch,
      iconNextTextInputAction: TextInputAction.done,
      onEditingComplete: controller.functionSearch,
      onChanged: (value) => controller.functionSearch(),
    ),
  );
}

Widget _buildTitle() {
  return Center(
    child: TextUtils(
      text: LocaleKeys.eCert_system_invoices_title.tr.toUpperCase(),
      customStyle: FontStyleUtils.fontStyleOpenSans(
        fontSize: AppDimens.size20,
        fontWeight: FontWeight.w700,
        color: AppColors.colorTextBlack,
      ),
    ),
  ).paddingOnly(bottom: AppDimens.paddingSize5);
}

Widget _buildbtnConfirm(SystemInvoicesController controller,
    Rxn<SystemInvoicesResponse> systemInvoicesSelectTemp) {
  return UtilWidget.buildButtonPrimary(
    LocaleKeys.eCert_system_invoices_confirm.tr,
    () async {
      if (systemInvoicesSelectTemp.value == null) {
        controller.showFlushNoti(LocaleKeys.eCert_system_invoices_select.tr);
        return;
      }
      controller.systemInvoicesSelect.value = systemInvoicesSelectTemp.value;
      Get.back();
    },
  );
}

Widget _itemSystemInvoices(
    SystemInvoicesResponse item,
    SystemInvoicesController controller,
    Rxn<SystemInvoicesResponse> systemInvoicesSelectTemp) {
  return Obx(
    () {
      RxBool isSelected = (systemInvoicesSelectTemp.value == item).obs;
      return UtilWidget.itemCard(
        borderColor: AppColors.colorBorderSide,
        color: isSelected.value
            ? AppColors.colorPrimary2
            : AppColors.colorBackgroundWhite,
        onTap: () {
          systemInvoicesSelectTemp.value = item;
        },
        borderRadius: AppDimens.radius5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextUtils(
              text: item.name,
              customStyle: FontStyleUtils.fontStyleOpenSans(
                fontSize: AppDimens.sizeTextMediumTb,
                fontWeight: FontWeight.w700,
              ),
            ),
            UtilWidget.sizedBox10,
            TextUtils(
              text: item.host,
              customStyle: FontStyleUtils.fontStyleOpenSans(
                fontSize: AppDimens.sizeTextSmall,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ).paddingSymmetric(
          vertical: AppDimens.paddingVerySmall,
        ),
      );
    },
  );
}
