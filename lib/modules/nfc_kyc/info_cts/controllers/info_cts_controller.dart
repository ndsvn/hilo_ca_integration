import 'dart:typed_data';

import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/modules/modules_src.dart';
import 'package:ecert/routes/routes.dart';
import 'package:ecert/shares/shares_src.dart';
import 'package:flutter/material.dart';

class InfoCTSPageController extends BaseGetxController {
  Rx<SignatureController> signatureController = SignatureController(
    penColor: AppColors.colorBasicBlack,
    exportBackgroundColor: AppColors.colorTransparent,
    penStrokeWidth: 1.5,
    exportPenColor: Colors.black87,
  ).obs;
  RxBool canSubmit = false.obs;

  late UploadFileRepository uploadFileRepository = UploadFileRepository(this);
  late RegisterInfoCtsRepo registerInfoCtsRepo = RegisterInfoCtsRepo(this);

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  FocusNode phoneFocus = FocusNode();
  FocusNode emailFocus = FocusNode();

  @override
  Future<void> onInit() async {
    signatureController.value.addListener(() {
      canSubmit.value = signatureController.value.isNotEmpty;
    });
    super.onInit();
  }

  Future<void> confrimRegister() async {
    if (signatureController.value.isEmpty) {
      return;
    }
    showLoadingOverlay();
    var result = await signatureController.value.toPngBytes();
    await uploadFileSignature(result);

    await register();
    hideLoadingOverlay();
  }

  Future<void> uploadFileSignature(Uint8List? image) async {
    if (image == null) return;

    await uploadFileRepository.uploadFile(image).then((value) async {
      if (value.status) {
        AppInfoCert.instance.documentFiles
            .setHandSignFileId(value.data?.filename ?? "");
      }
    });
  }

  Future<void> register() async {
    PersionalInfo personalInfo = PersionalInfo(
      email: emailController.text.trim(),
      phone: phoneController.text.trim(),
      password: "123456aA@",
      address: AppConfig.instance.nfcModelApp.residentVMN ?? "",
    );

    RegistrationRequest registrationRequest = RegistrationRequest(
      businessInfo: AppInfoCert.instance.businessInfo,
      personalInfo: personalInfo,
      documentFiles: AppInfoCert.instance.documentFiles,
      nfcInfo: AppInfoCert.instance.nfcInfo,
    );

    await registerInfoCtsRepo.register(registrationRequest).then((value) async {
      if (value.status) {
        Get.toNamed(
          AppRoutes.routeConfirmCTS,
          arguments: value.data,
        );
        showFlushNoti(
          LocaleKeys.eCert_register_success.tr,
          content: LocaleKeys.eCert_register_successContent.tr,
        );
      } else {
        showFlushNoti(
          LocaleKeys.eCert_register_fail.tr,
          content: value.errors?.firstOrNull?.message?.vn ?? "",
          isSuccess: false,
        );
      }
    });
  }
}
