part of 'password_page.dart';

Widget _buildBody(PasswordCtrl passwordCtrl) {
  return Column(
    children: [
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UtilWidget.sizedBox25,
              SizedBox(
                height: Get.height / 25,
              ),
              TextUtils(
                text:
                    "${LocaleKeys.eCert_changePass_userName.tr}: ${hiveApp.get(AppConst.userName) ?? ""}",
                availableStyle: StyleEnum.titleMedium,
              ),
              SizedBox(
                height: Get.height / 25,
              ),
              Form(
                key: passwordCtrl.formKey,
                child: Column(
                  children: [
                    _buildInputData(
                      title: LocaleKeys.eCert_changePass_currentPassword.tr,
                      textEditingController: passwordCtrl.passwordOldController,
                      hintText: LocaleKeys
                          .eCert_changePass_hintTextcurrentPassword.tr,
                      isLoading: passwordCtrl.isLoadingOverlay.value,
                      errorValidator:
                          LocaleKeys.change_password_validateCurrentPassword.tr,
                      currentNode: passwordCtrl.passwordFocus,
                    ),
                    _buildInputData(
                      title: LocaleKeys.eCert_changePass_newPassword.tr,
                      textEditingController: passwordCtrl.passwordNewController,
                      hintText:
                          LocaleKeys.eCert_changePass_hintTextnewPassword.tr,
                      isLoading: passwordCtrl.isLoadingOverlay.value,
                      errorValidator:
                          LocaleKeys.change_password_validateNewPassword.tr,
                      currentNode: passwordCtrl.passwordNewFocus,
                    ),
                    _buildInputData(
                      title: LocaleKeys.eCert_changePass_reNewPassword.tr,
                      textEditingController:
                          passwordCtrl.passwordConfirmController,
                      hintText: LocaleKeys.eCert_changePass_reNewPassword.tr,
                      isLoading: passwordCtrl.isLoadingOverlay.value,
                      errorValidator:
                          LocaleKeys.change_password_validateChangePassword.tr,
                      currentNode: passwordCtrl.passwordConfirmFocus,
                      validator: (value) => validateRepass(
                        value,
                        passwordCtrl.passwordNewController.text,
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: AppDimens.defaultPadding),
              ),
            ],
          ),
        ),
      ),
      _buildSaveButton(passwordCtrl).paddingSymmetric(
        horizontal: AppDimens.defaultPadding,
        vertical: AppDimens.paddingSmaller,
      ),
    ],
  );
}

Widget _buildInputData({
  required String title,
  required TextEditingController textEditingController,
  required bool isLoading,
  required String hintText,
  required String errorValidator,
  required FocusNode currentNode,
  FocusNode? nextMode,
  TextInputType textInputType = TextInputType.text,
  int? maxLength,
  VoidCallback? onEditingComplete,
  TextInputAction iconNextTextInputAction = TextInputAction.next,
  FormFieldValidator<String>? validator,
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
          labelTextStyle: AppTextStyle.labelStyle(
            size: AppDimens.sizeTextSmall,
          ),
        ),
        inputTextFormModel: InputTextModel(
          borderRadius: AppDimens.radius5,
          isShowCounterText: false,
          maxLengthInputForm: maxLength ?? AppDimens.btnMediumFont,
          validator: (value) =>
              validator != null ? validator(value) : validatePass(value),
          controller: textEditingController,
          fillColor: AppColors.colorInput,
          contentPadding: const EdgeInsets.symmetric(
            vertical: AppDimens.paddingMedium,
            horizontal: AppDimens.paddingMedium,
          ),
          isReadOnly: isLoading,
          hintTextColor: AppColors.colorHintText,
          hintText: hintText,
          colorBorder: AppColors.white,
          floatingLabelStyle: AppTextStyle.labelStyle(
            size: AppDimens.sizeTextLarge,
          ),
          colorFocusedBorder: AppColors.lightPrimaryColor,
          obscureText: true,
          currentNode: currentNode,
          nextNode: nextMode,
          textInputType: textInputType,
          iconNextTextInputAction: iconNextTextInputAction,
          onEditingComplete: onEditingComplete,
          labelText: hintText,
          fontWeight: FontWeight.normal,
          inputFormatters: InputFormatterEnum.password,
        ),
      ).paddingSymmetric(vertical: AppDimens.paddingSize5),
    ],
  );
}

Widget _buildSaveButton(PasswordCtrl passwordCtrl) {
  return Obx(
    () => UtilWidget.buildButtonPrimary(
      LocaleKeys.eCert_changePass_button.tr,
      () async {
        await passwordCtrl.changePassword();
      },
      isLoading: passwordCtrl.isLoadingOverlay.value,
    ),
  );
}
