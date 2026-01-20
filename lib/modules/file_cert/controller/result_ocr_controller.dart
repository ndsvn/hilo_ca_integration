import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/routes/routes.dart';
import 'package:hilo_ca_integration/shares/shares_src.dart';
import 'package:flutter/material.dart';

class ResultOcrController extends BaseGetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController taxCodeController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  TextEditingController ownerFullNameController = TextEditingController();
  TextEditingController ownerCitizenNumberController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode addressFocus = FocusNode();
  FocusNode nameFocus = FocusNode();
  FocusNode taxCodeFocus = FocusNode();
  FocusNode codeFocus = FocusNode();
  FocusNode ownerFullNameFocus = FocusNode();
  FocusNode ownerCitizenNumberFocus = FocusNode();

  @override
  Future<void> onInit() async {
    emailController.text =
        AppInfoCert.instance.infoDataApp?.businessEmail ?? "";
    phoneController.text =
        AppInfoCert.instance.infoDataApp?.businessPhone ?? "";
    // codeController.text =
    //     AppInfoCert.instance.infoDataApp?.businessRegistration ?? "";
    taxCodeController.text =
        AppInfoCert.instance.infoDataApp?.businessNumber ?? "";
    nameController.text =
        AppInfoCert.instance.infoDataApp?.businessHouseholdName ?? "";
    addressController.text =
        AppInfoCert.instance.infoDataApp?.businessAddress ?? "";
    ownerFullNameController.text =
        AppInfoCert.instance.infoDataApp?.ownerFullName ?? "";
    ownerCitizenNumberController.text =
        AppInfoCert.instance.infoDataApp?.ownerCitizenNumber ?? "";

    super.onInit();
  }

  void confirmRegister() async {
    if (formKey.currentState?.validate() ?? false) {
      KeyBoard.hide();
      AppInfoCert.instance.setFileInfoDataReInput(
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        name: nameController.text.trim(),
        address: addressController.text.trim(),
        taxCode: taxCodeController.text.trim(),
        codeRegister: codeController.text.trim(),
        ownerFullName: ownerFullNameController.text.trim(),
        ownerCitizenNumber: ownerCitizenNumberController.text.trim(),
      );
      Get.toNamed(AppRoutes.routeGuideNFC);
    }
  }
}
