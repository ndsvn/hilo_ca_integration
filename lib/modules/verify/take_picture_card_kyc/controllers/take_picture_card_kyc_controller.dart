import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/modules/modules_src.dart';
import 'package:ecert/modules/verify/update_photo_information_kyc/update_photo_information_kyc.src.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../shares/shares_src.dart';

class TakePictureCardKycController extends BaseGetxController {
  ScreenshotController screenshotController = ScreenshotController();
  ScreenshotController screenshotControllerResult = ScreenshotController();

  late CameraController cameraController;
  final AppController appController = Get.find<AppController>();
  final UpdateInformationController updateInformationController =
      Get.find<UpdateInformationController>();
  final RxBool isFlashOn = false.obs;
  Rx<Uint8List?> imageTemp = Rx<Uint8List?>(null);
  Uint8List? imageResult;
  late List<CameraDescription> cameras;
  RxBool isCameraInit = false.obs;

  bool isTakeFront = false;

  late UploadFileRepository uploadFileRepository = UploadFileRepository(this);

  @override
  Future<void> onInit() async {
    super.onInit();
    showLoadingOverlay();
    await initCamera();
    isCameraInit.value = true;
    hideLoadingOverlay();
    // cameraController = appController.cameraController;
    isTakeFront = Get.arguments;
  }

  Future<void> initCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.max,
      enableAudio: false,
    );
    await cameraController.initialize();
  }

  @override
  void onClose() {
    // cameraController.setFlashMode(FlashMode.off);
    cameraController.dispose();
    super.onClose();
  }

  Future<void> takePictureScreen() async {
    cameraController.pausePreview();
    showLoadingOverlay();
    // Get.dialog(ShowPopup().openLoadingDialog(), barrierDismissible: true);

    imageTemp.value = await screenshotController.capture(
      pixelRatio: 3,
      delay: 10.milliseconds,
    );
    hideLoadingOverlay();
  }

  void retakePicture() {
    cameraController.resumePreview();
    imageTemp.value = null;
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    showLoadingOverlay();
    if (image != null) {
      Uint8List imageData = await image.readAsBytes();
      await scanImage(image.path);
      await uploadFile(imageData);
    }
    hideLoadingOverlay();
    Get.back();
  }

  Future<void> takePictureScreenResult() async {
    showLoadingOverlay();

    imageResult = await screenshotControllerResult.capture(
      pixelRatio: 3,
      delay: 10.milliseconds,
    );
    if (imageResult != null) {
      await scanImageBytes(imageResult!);
      await uploadFile(imageResult!);
    }

    hideLoadingOverlay();
    Get.back();
  }

  Future<void> uploadFile(Uint8List image) async {
    showLoadingOverlay();
    await uploadFileRepository.uploadFile(image).then((value) async {
      if (value.status) {
        if (isTakeFront) {
          AppInfoCert.instance.documentFiles
              .setFrontCardFileId(value.data?.filename ?? "");
          updateInformationController.filesImageFront.fileData.value = image;
        } else {
          AppInfoCert.instance.documentFiles
              .setBackCardFileId(value.data?.filename ?? "");
          updateInformationController.filesImageBack.fileData.value = image;
        }
      }
    });
    hideLoadingOverlay();
  }

  Future<void> scanImage(String pathImage) async {
    try {
      QrInformation? qrInformation =
          await GetDataQr.instance.scanImage(pathImage);
      AppConfig.instance.nfcModelApp.registrationDateVMN =
          qrInformation?.dateOfIssuer;
      AppConfig.instance.nfcModelApp.residentVMN = qrInformation?.address;
    } catch (e) {}
  }

  Future<void> scanImageBytes(Uint8List bytesImage) async {
    try {
      QrInformation? qrInformation =
          await GetDataQr.instance.scanImageByte(bytesImage);

      AppConfig.instance.nfcModelApp.registrationDateVMN =
          qrInformation?.dateOfIssuer;
      AppConfig.instance.nfcModelApp.residentVMN = qrInformation?.address;
    } catch (e) {}
  }
}
