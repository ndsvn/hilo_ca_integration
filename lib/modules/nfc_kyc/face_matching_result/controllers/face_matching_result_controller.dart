import 'dart:convert';
import 'dart:typed_data';

import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/modules/modules_src.dart';
import 'package:ecert/routes/routes.dart';
import 'package:ecert/shares/shares_src.dart';

class FaceMatchingResultController extends BaseGetxController {
  late UploadFileRepository uploadFileRepository = UploadFileRepository(this);
  late FaceMatchingRepository faceMatchingRepository =
      FaceMatchingRepository(this);

  Uint8List? image;

  RxBool faceMatchingResult = RxBool(false);

  @override
  Future<void> onInit() async {
    if (Get.arguments != null) {
      image = Get.arguments;
      await faceMatchingAPI();
    }
    super.onInit();
  }

  Future<void> faceMatchingAPI() async {
    showLoadingOverlay();
    await faceMatchingRepository
        .faceMatching(
      img1: base64Encode(image ?? []),
      img2: AppConfig.instance.nfcModelApp.file,
      isProd: AppInfoCert.instance.sdkRequestModel?.isProd ?? false,
      merchantKey: AppInfoCert.instance.sdkRequestModel?.merchantKey ?? "",
    )
        .then((value) async {
      if (value.status == false) {
        showFlushNoti(
          LocaleKeys.live_ness_matchingFailTitle.tr,
          content: LocaleKeys.live_ness_matchingFailContent.tr,
          isSuccess: false,
        );
      } else {
        faceMatchingResult.value = value.data?.match == AppConst.matchSuccess;
      }
    });
    hideLoadingOverlay();
  }

  Future<void> confirmFace() async {
    showLoadingOverlay();
    await uploadFile();
    hideLoadingOverlay();
    Get.offAndToNamed(AppRoutes.routeInformationNfc);
  }

  Future<void> uploadFile() async {
    if (image == null) return;

    await uploadFileRepository.uploadFile(image!).then((value) async {
      if (value.status) {
        AppInfoCert.instance.documentFiles
            .setBodyFileId(value.data?.filename ?? "");
      }
    });
  }
}
