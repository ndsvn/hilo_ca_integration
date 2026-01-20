part of '../views_part/login_page.dart';

Widget _body(LoginController controller) {
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
                height: Get.height / 10,
              ),
              GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    controller.showLog();
                  },
                  child: SvgPicture.asset(
                    Assets.ASSETS_ECERT_ICONAPP_SVG,
                    height: 60.h,
                    width: 106.w,
                  )),
              UtilWidget.sizedBox20,
              // Text(
              //   LocaleKeys.app_name.tr,
              //   style: FontStyleUtils.fontStyleOpenSans(
              //     fontSize: AppDimens.size30,
              //     fontWeight: FontWeight.w700,
              //     color: AppColors.lightPrimaryColor,
              //   ),
              // ),
              UtilWidget.sizedBox20,
              // SizedBox(
              //   width: Get.width / 1.5,
              //   child: Text(
              //     LocaleKeys.eCert_login_title.tr,
              //     textAlign: TextAlign.center,
              //     style: FontStyleUtils.fontStyleOpenSans(
              //       fontSize: AppDimens.sizeTextLarge,
              //       fontWeight: FontWeight.w700,
              //       color: AppColors.colorBack,
              //     ),
              //   ).paddingSymmetric(
              //     horizontal: AppDimens.paddingSmallest,
              //     vertical: AppDimens.paddingMedium,
              //   ),
              // ),
              _buildInfoSystemInvoice(),
              _buildFormLogin(controller),
              const Spacer(),
              Text(
                LocaleKeys.eCert_login_company.tr,
                textAlign: TextAlign.center,
                style: FontStyleUtils.fontStyleOpenSans(
                  fontSize: AppDimens.sizeTextSmaller,
                  color: AppColors.colorBasicGrey,
                ),
              ),
              UtilWidget.sizedBox20,
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildInfoSystemInvoice() {
  return Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextUtils(
              text: AppConfig.instance.getSystemInvoices()?.name ?? "",
              textAlign: TextAlign.left,
              textOverflow: TextOverflow.ellipsis,
              customStyle: FontStyleUtils.fontStyleOpenSans(
                fontSize: AppDimens.sizeTextLarge,
                fontWeight: FontWeight.w700,
                color: AppColors.colorBack,
              ),
            ),
            // TextUtils(
            //   text: AppConfig.instance.getSystemInvoices()?.host ?? "",
            //   textAlign: TextAlign.left,
            //   customStyle: FontStyleUtils.fontStyleOpenSans(
            //     fontSize: AppDimens.sizeTextMediumTb,
            //     fontWeight: FontWeight.w700,
            //     color: AppColors.colorBack,
            //   ),
            // ),
          ],
        ),
      ),
      UtilWidget.sizedBoxWidth10,
      InkWell(
        onTap: () {
          Get.offAndToNamed(AppRoutes.routeSystemInvoices);
        },
        child: Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: AppColors.lightPrimaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: SvgPicture.asset(Assets.ASSETS_ECERT_CHANGE_SVG),
          ),
        ),
      ),
    ],
  ).paddingSymmetric(horizontal: AppDimens.paddingHuge);
}

Widget _buildFormLogin(LoginController controller) {
  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(
          height: Get.height * 0.02,
        ),
        Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UtilWidget.sizedBox10,
              _buildInputData(
                title: LocaleKeys.eCert_login_taxCode.tr,
                textEditingController: controller.taxCodeController,
                isLoading: controller.isShowLoading.value,
                hintText: LocaleKeys.eCert_login_hintTextTaxCode.tr,
                errorValidator: (value) {
                  if (value.isNullOrEmpty) {
                    return LocaleKeys.login_taxCodeError.tr;
                  }
                  return null;
                },
                currentNode: controller.taxCodeFocus,
                nextMode: controller.userNameFocus,
                iconLeadingSVG: Assets.ASSETS_ECERT_TAX_CODE_SVG,
              ),
              UtilWidget.sizedBox10,
              _buildInputData(
                title: LocaleKeys.login_userName.tr,
                textEditingController: controller.userNameController,
                isLoading: controller.isShowLoading.value,
                hintText: LocaleKeys.login_userName.tr,
                currentNode: controller.userNameFocus,
                nextMode: controller.passwordFocus,
                iconLeadingSVG: Assets.ASSETS_ECERT_ICONUSER_SVG,
              ),
              UtilWidget.sizedBox10,
              _buildInputData(
                title: LocaleKeys.login_password.tr,
                textEditingController: controller.passwordController,
                isLoading: controller.isShowLoading.value,
                hintText: LocaleKeys.login_password.tr,
                errorValidator: validatePass,
                isPassword: true,
                currentNode: controller.passwordFocus,
                iconNextTextInputAction: TextInputAction.done,
                onEditingComplete: controller.funcLogin,
                iconLeadingSVG: Assets.ASSETS_ECERT_PASSWORD_SVG,
                inputFormatters: InputFormatterEnum.password,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: AppDimens.btnSmall,
        ),
        // UtilWidget.sizedBox25,
        _buildButtonLogin(controller),
        // UtilWidget.sizedBox10,
        // _buildResgister().paddingSymmetric(
        //   horizontal: AppDimens.paddingSmall,
        //   vertical: AppDimens.paddingMedium,
        // ),
      ],
    ).paddingSymmetric(horizontal: AppDimens.paddingHuge),
  );
}

RichText _buildResgister() {
  return RichText(
    textAlign: TextAlign.start,
    text: TextSpan(
      children: [
        TextSpan(
          text: LocaleKeys.eCert_login_notAccount.tr,
          style: FontStyleUtils.fontStylePoppins(
              fontSize: AppDimens.sizeTextSmaller,
              color: AppColors.colorBasicGrey,
              fontWeight: FontWeight.w300),
        ),
        TextSpan(
          text: LocaleKeys.eCert_login_register.tr,
          style: FontStyleUtils.fontStylePoppins(
              fontSize: AppDimens.sizeTextSmaller,
              color: AppColors.lightPrimaryColor,
              fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}

Widget _buildButtonLogin(LoginController controller,
    {Function? function, String? titleButton}) {
  return SizedBox(
    height: AppDimens.btnMediumMaz,
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Obx(
            () => UtilWidget.buildButton(
              titleButton ?? LocaleKeys.login_loginBtn.tr,
              function?.call() ?? () async => await controller.funcLogin(),
              isLoading: controller.isShowLoading.value,
              backgroundColor: AppColors.lightPrimaryColor,
              height: 52.h,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildInputData({
  required String title,
  required TextEditingController textEditingController,
  required bool isLoading,
  required String hintText,
  FormFieldValidator<String>? errorValidator,
  required FocusNode currentNode,
  FocusNode? nextMode,
  bool isPassword = false,
  TextInputType textInputType = TextInputType.text,
  int? maxLength,
  VoidCallback? onEditingComplete,
  TextInputAction iconNextTextInputAction = TextInputAction.next,
  IconData? iconLeading,
  String? iconLeadingSVG,
  int? inputFormatters,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      BuildInputTextWithLabel(
        inputLabelModel: InputLabelModel(
          label: title,
          isValidate: true,
          paddingLabel: const EdgeInsets.symmetric(
            horizontal: AppDimens.paddingSmallest,
          ),
        ),
        inputTextFormModel: InputTextModel(
          borderRadius: AppDimens.radius5,
          isShowCounterText: false,
          maxLengthInputForm: maxLength ?? AppDimens.btnMediumFont,
          validator: errorValidator,
          controller: textEditingController,
          fillColor: AppColors.colorInput,
          isReadOnly: isLoading,
          hintTextColor: AppColors.colorHintText,
          hintText: hintText,
          colorBorder: AppColors.white,
          floatingLabelStyle: AppTextStyle.labelStyle(
            size: AppDimens.sizeTextLarge,
          ),
          colorFocusedBorder: AppColors.lightPrimaryColor,
          obscureText: isPassword,
          currentNode: currentNode,
          nextNode: nextMode,
          textInputType: textInputType,
          iconNextTextInputAction: iconNextTextInputAction,
          onEditingComplete: onEditingComplete,
          labelText: hintText,
          iconLeading: iconLeading,
          fontWeight: FontWeight.normal,
          inputFormatters:
              inputFormatters ?? InputFormatterEnum.lengthLimitingText,
          iconLeadingSVG: iconLeadingSVG,
        ),
      ).paddingSymmetric(vertical: AppDimens.paddingSize5),
    ],
  );
}

String? _validateTaxCode(String value) {
  if (isTaxCode(taxCode: value)) {
    return LocaleKeys.login_validatorTaxCode.tr;
  }
  return null;
}
