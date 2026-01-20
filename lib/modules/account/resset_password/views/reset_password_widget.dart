part of 'reset_password_page.dart';

Widget _buildBody(ResetPasswordCtrl passwordCtrl) {
  return SingleChildScrollView(
    child: Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.ASSETS_IMAGES_ICON_ICON_SVG_IC_2ID_SVG,
          ),
          UtilWidget.sizedBox25,
          Text(
            LocaleKeys.reset_pass_appbar.tr,
            style: FontStyleUtils.fontStyleSans(
              fontSize: AppDimens.sizeTextLarge,
              fontWeight: FontWeight.w800,
              // color: AppColors.colorlueX,
            ),
          ),
          SizedBox(
            height: Get.height / 25,
          ),
          passwordCtrl.isConfirmEmail.value
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageWidget.imageSvg(
                      Assets
                          .ASSETS_IMAGES_ICON_ICON_SVG_IC_BANNER_RESET_EMAIL_SVG,
                      height: 215.h,
                      width: 200.w,
                    ),
                    SizedBox(
                      height: Get.height / 25,
                    ),
                    Column(
                      children: [
                        TextUtils(
                          text: LocaleKeys.reset_pass_titleSend.tr,
                          availableStyle: StyleEnum.bodySmall,
                          color: AppColors.colorNeutral2,
                          textAlign: TextAlign.center,
                          maxLine: 2,
                        ),
                        TextUtils(
                          text: passwordCtrl.email,
                          availableStyle: StyleEnum.bodySmall,
                          color: AppColors.colorNeutral2,
                          textAlign: TextAlign.center,
                          maxLine: 2,
                        ),
                      ],
                    ).paddingSymmetric(
                      horizontal: AppDimens.paddingHuge,
                    ),
                    SizedBox(
                      height: Get.height / 25,
                    ),
                    pinCodeTextField(passwordCtrl).paddingSymmetric(
                      horizontal: AppDimens.paddingTextHis,
                    ),
                    Visibility(
                      visible: passwordCtrl.isLifeTime.value,
                      child: CountdownFormatted(
                        duration: Duration(
                            seconds: passwordCtrl.remainingSeconds.value),
                        builder: (BuildContext ctx, String remaining) {
                          return Column(
                            children: [
                              TextUtils(
                                text: LocaleKeys.reset_pass_titleOTP.tr,
                                availableStyle: StyleEnum.bodySmall,
                                color: AppColors.colorNeutral2,
                              ),
                              TextUtils(
                                text: remaining,
                                availableStyle: StyleEnum.bodySmall,
                                color: AppColors.colorPrimary1,
                              ),
                            ],
                          );
                        },
                        onFinish: () {
                          passwordCtrl.isLifeTime.value = false;
                        },
                      ),
                    ),
                    UtilWidget.sizedBox10,
                    _buildSendButton(passwordCtrl).paddingSymmetric(
                      horizontal: AppDimens.paddingTextHis,
                      vertical: AppDimens.paddingSmaller,
                    ),
                    Visibility(
                      visible: !passwordCtrl.isLifeTime.value,
                      child: passwordCtrl.isLoadResend.value
                          ? const SizedBox(
                              height: AppDimens.padding14,
                              width: AppDimens.padding14,
                              child: CircularProgressIndicator(
                                strokeWidth: 1,
                                backgroundColor: AppColors.colorWhite,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.colorPrimary1,
                                ),
                              ),
                            )
                          : RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: LocaleKeys.reset_pass_notSend.tr,
                                    style: const TextStyle(
                                        height: 1.3,
                                        color: AppColors.colorHintText,
                                        fontSize: AppDimens.sizeText14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  TextSpan(
                                      text: LocaleKeys.reset_pass_resend.tr,
                                      style: const TextStyle(
                                        height: 1.3,
                                        color: AppColors.colorBlue,
                                        fontSize: AppDimens.sizeText14,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () async {
                                          await passwordCtrl.changePassword(
                                              isResend: true);
                                        }),
                                ],
                              ),
                            ),
                    )
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageWidget.imageSvg(
                      Assets.ASSETS_IMAGES_ICON_ICON_SVG_IC_BANNER_RESET_SVG,
                      height: 190.h,
                      width: 190.w,
                    ),
                    SizedBox(
                      height: Get.height / 25,
                    ),
                    TextUtils(
                      text: LocaleKeys.reset_pass_title.tr,
                      availableStyle: StyleEnum.bodySmall,
                      color: AppColors.colorNeutral2,
                      textAlign: TextAlign.center,
                      maxLine: 2,
                    ).paddingSymmetric(
                      horizontal: AppDimens.paddingHuge,
                    ),
                    SizedBox(
                      height: Get.height / 25,
                    ),
                    Form(
                      key: passwordCtrl.formKey,
                      child: Column(
                        children: [
                          _buildInputField(
                            textEditingController:
                                passwordCtrl.phoneNumberController,
                            onValidator: (text) => text.isNullOrEmpty
                                ? LocaleKeys.reset_pass_validateEmail.tr
                                : null,
                            hintText: LocaleKeys.reset_pass_hintEmail.tr,
                            currentNode: passwordCtrl.phoneNumberConFocus,
                            onEditingComplete: () async {
                              await passwordCtrl.changePassword();
                            },
                          ),
                          // UtilWidget.sizedBox15,
                        ],
                      ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
                    ),
                    _buildSaveButton(passwordCtrl).paddingSymmetric(
                      horizontal: AppDimens.paddingTextHis,
                      vertical: AppDimens.paddingSmaller,
                    ),
                  ],
                ),
        ],
      ),
    ),
  );
}

Widget _buildInputField({
  String? Function(String?)? onValidator,
  required TextEditingController textEditingController,
  required FocusNode currentNode,
  FocusNode? nextMode,
  String? hintText,
  VoidCallback? onEditingComplete,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      // TextUtils(
      //   text: label,
      //   availableStyle: StyleEnum.titleMedium,
      //   color: AppColors.colorBasicGrey,
      // ),
      // UtilWidget.sizedBox5,
      BuildInputText(
        InputTextModel(
            controller: textEditingController,
            validator: onValidator ?? (value) => null,
            textColor: AppColors.colorBasicBlack,
            hintText: hintText,
            currentNode: currentNode,
            nextNode: nextMode,
            hintTextColor: AppColors.colorHintText,
            colorBorder: AppColors.colorBorder,
            fillColor: AppColors.colorGreyBody,
            borderRadius: AppDimens.radiusBig,
            colorFocusedBorder: AppColors.colorBlueX,
            iconLeadingSVG: Assets.ASSETS_IMAGES_ICON_ICON_SVG_IC_PASS_SVG,
            onEditingComplete: onEditingComplete,
            fontWeight: FontWeight.normal),
      ),
      UtilWidget.sizedBox5,
    ],
  ).paddingSymmetric(
    vertical: AppDimens.paddingSmaller,
  );
}

Widget _buildSaveButton(ResetPasswordCtrl passwordCtrl) {
  return Obx(
    () => UtilWidget.buildSolidButtonIcon(
      onPressed: () async {
        await passwordCtrl.changePassword();
      },
      title: LocaleKeys.reset_pass_button.tr,
      fixedSize: Size(
        Get.width,
        AppDimens.btnMediumTb,
      ),
      radius: 12,
      isLoading: passwordCtrl.isShowLoading.value,
      titleStyle: FontStyleUtils.fontStyleSans(
        fontSize: AppDimens.sizeTextMediumTb,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget _buildSendButton(ResetPasswordCtrl passwordCtrl) {
  return Obx(
    () => UtilWidget.buildSolidButtonIcon(
      onPressed: () async {
        await passwordCtrl.verifyOTP();
      },
      title: LocaleKeys.reset_pass_button.tr,
      fixedSize: Size(
        Get.width,
        AppDimens.btnMediumTb,
      ),
      radius: 12,
      isLoading: passwordCtrl.isShowLoading.value,
      titleStyle: FontStyleUtils.fontStyleSans(
        fontSize: AppDimens.sizeTextMediumTb,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

PinCodeTextField pinCodeTextField(ResetPasswordCtrl controller) {
  return PinCodeTextField(
    length: 6,
    obscureText: false,
    animationType: AnimationType.fade,
    autoFocus: true,
    pinTheme: PinTheme(
      shape: PinCodeFieldShape.box,
      borderRadius: BorderRadius.circular(AppDimens.radius12),
      fieldHeight: AppDimens.btnMedium / ratioHeight,
      fieldWidth: 45 / ratioHeight,
      activeFillColor: AppColors.colorWhite,
      inactiveColor: AppColors.colorNeutral2,
      activeColor: AppColors.colorGrey,
      selectedColor: AppColors.colorPrimary1,
      inactiveFillColor: AppColors.colorNeutral5,
      selectedFillColor: AppColors.colorWhite,
      activeBorderWidth: 0.8,
      selectedBorderWidth: 0.8,
      inactiveBorderWidth: 0.8,
      disabledBorderWidth: 0.8,
    ),
    textStyle: FontStyleUtils.fontStyleSans(
      fontSize: AppDimens.sizeText14,
      fontWeight: FontWeight.w700,
    ),
    cursorColor: AppColors.colorPrimary1,
    cursorWidth: 1,
    cursorHeight: AppDimens.paddingMedium / ratioHeight,
    animationDuration: const Duration(milliseconds: 300),
    enableActiveFill: true,
    keyboardType: TextInputType.number,
    controller: controller.pinController,
    onCompleted: (v) async {
      await controller.verifyOTP();
    },
    beforeTextPaste: (text) {
      return true;
    },
    appContext: Get.context!,
  );
}
