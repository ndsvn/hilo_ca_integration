import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:ecert/base_utils/base_src.dart';
import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/generated/locales.g.dart';
import 'package:ecert/modules/verify/live_ness/live_ness_kyc.src.dart';
import 'package:ecert/modules/verify/update_photo_information_kyc/update_photo_information_kyc.src.dart';
import 'package:ecert/routes/routes.dart';
import 'package:ecert/shares/shares_src.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image/image.dart' as img;

class LiveNessKycController extends BaseGetxController {
  late CameraController cameraController;

  Rx<Uint8List?> imageTemp = Rx<Uint8List?>(null);
  String urlRecordVideoTemp = "";
  late List<CameraDescription> cameras;
  RxBool cameraIsInitialize = false.obs;
  final FaceDetector _faceDetector = FaceDetector(
    options: FaceDetectorOptions(
      enableContours: true,
      enableLandmarks: true,
      enableClassification: true,
    ),
  );

  List<String> typesTemp = [];
  RxList<String> listFaceDetectionTemp = <String>[].obs;
  List<String> questionTemp = [];
  int lastQuestion = -1;
  int randomIndex = 10;
  List<int> numbers = [0, 1, 2, 3, 4, 5];

  // FilesImageModel filesImageLiveNess = FilesImageModel(
  //   fileData: Rx<Uint8List?>(null),
  //   fileType: AppConst.fileTypeFace,
  // );

  /// dùng để radom action

  bool isStreamingImage = false;
  bool isTakeFront = false;
  bool detecting = false;
  RxBool isFaceEmpty = false.obs;
  RxBool isManyFace = false.obs;
  String question = '';
  String type = '';
  RxInt currentStep = 0.obs;
  RxBool isSuccessLiveNess = false.obs;

  ///list api
  List<double> listSmiling = [];
  List<String> listOrderSequence = [];
  List<String> listFaceDirection = [];
  Uint8List? imageLiveNess;
  double eyeOpenRightOld = 1.0;
  double eyeOpenLeftOld = 1.0;
  List<String> listSequence = [];
  List<int> listRadonNumber = [];
  double rateFaceMatching = 0.0;
  bool isUpdateLiveNess = false;
  late UpdatePhotoInformationRepository updatePhotoInformationRepository =
      UpdatePhotoInformationRepository(this);

  @override
  Future<void> onInit() async {
    super.onInit();
    if (Get.arguments != null) {
      if (Get.arguments is bool) {
        isUpdateLiveNess = Get.arguments;
      }
    }
    showLoadingOverlay();
    await initCamera();
    // await _getListSequence();
    randomListQuestion();
    hideLoadingOverlay();
  }

  @override
  Future<void> onClose() async {
    await closePros();
    super.onClose();
  }

  Future<void> initCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras[1],
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.nv21,
    );
    await cameraController.initialize();
    cameraIsInitialize.value = cameraController.value.isInitialized;
  }

  Future<void> startStreamPicture() async {
    if (!isStreamingImage) {
      isStreamingImage = true;
      if (!cameraController.value.isStreamingImages) {
        cameraController.startImageStream((image) async {
          if (!detecting) {
            await _processImage(image);
          }
        });
      }
    }
  }

  Future<void> closePros() async {
    isStreamingImage = false;
    // if (cameraController.value.isStreamingImages) {
    await cameraController.stopImageStream();
    await _faceDetector.close();
    await cameraController.dispose();
    // }
  }

  /// Xử lý khung hình và trả về kết quả hành động vào action
  Future<void> _processImage(CameraImage image) async {
    detecting = true;
    InputImage? inputImage = CameraImageConverter.inputImageFromCameraImage(
      image,
      cameras[1],
      cameraController,
    );

    if (inputImage != null) {
      final faces = await _faceDetector.processImage(inputImage);
      if (faces.isNotEmpty) {
        isManyFace.value = faces.length > 1;

        isFaceEmpty.value = false;
        if (currentStep.value == 0) {
          // randomQuestion();
          currentStep.value++;
          type = typesTemp[currentStep.value - 1];
        }
        LiveNessDetectionData liveNessData = LiveNessDetector(
          faces,
          eyeOpenRightOld,
          eyeOpenLeftOld,
        ).liveNess(type);
        eyeOpenRightOld = faces[0].rightEyeOpenProbability ?? 0.0;
        eyeOpenLeftOld = faces[0].leftEyeOpenProbability ?? 0.0;
        question = liveNessData.question;
        if (isSuccessLiveNess.value) {
          await liveNessSuccess();
        } else {
          if (currentStep.value <= AppConst.currentStepMax) {
            if (question.compareTo(questionTemp[currentStep.value - 1]) == 0) {
              if (question
                      .compareTo(LocaleKeys.live_ness_actionFaceBetween.tr) ==
                  0) {
                await Future.delayed(const Duration(milliseconds: 500));
                await waitAtLeast(
                    isolateConvertImg(inputImage), const Duration(seconds: 2));
                // await isolateConvertImg(inputImage);
              }
              currentStep.value++;
              if (listSmiling.length < AppConst.currentStepMax) {
                listSmiling.add(liveNessData.percentSmile);
              }
              if (currentStep.value <= AppConst.currentStepMax) {
                type = typesTemp[currentStep.value - 1];
              }
            }
          } else {
            isSuccessLiveNess.value = true;
          }
        }
      } else {
        isManyFace.value = false;
        isFaceEmpty.value = true;
      }
    }
    detecting = false;
  }

  void randomListQuestion() {
    final rng = Random();
    final List<int> result = [];

    for (int i = 0; i < AppConst.currentStepMax; i++) {
      if (numbers.isEmpty) break;

      final randomIndex = rng.nextInt(numbers.length);
      final value = numbers[randomIndex];
      result.add(value);
      numbers.removeAt(randomIndex);
    }

    //  Đảm bảo danh sách có ít nhất 1 câu hỏi là nhìn thẳng
    if (!result.contains(2)) {
      final replaceIndex = rng.nextInt(result.length);
      result[replaceIndex] = 2;
    }

    for (final v in result) {
      _addListQuestion(v);
    }
  }

  void _addListQuestion(int index) {
    listFaceDetectionTemp.add(LiveNessCollection.listFaceDetach[index]);
    typesTemp.add(LiveNessCollection.types[index]);
    questionTemp.add(LiveNessCollection.questions[index]);
  }

  Future<T> waitAtLeast<T>(Future<T> future, Duration minDuration) async {
    final results = await Future.wait([future, Future.delayed(minDuration)]);
    return results[0] as T;
  }

  ///take picture liveness
  Future<void> liveNessSuccess() async {
    try {
      if (isStreamingImage) {
        isStreamingImage = false;
        cameraController.pausePreview();
        if (cameraIsInitialize.value) {
          await finishLiveNess();
        }
      }
    } catch (e) {
      await cameraController.resumePreview();
      showFlushNoti(
        "Dữ liệu api gửi về không hợp lệ",
        isSuccess: false,
      );
      // Get.back();
    } finally {
      hideLoadingOverlay();
    }
  }

  Future<void> finishLiveNess() async {
    /// Set dữ liệu ảnh live ness

    /// Chuyển sang màn kiểm tra
    Get.offNamed(AppRoutes.routeFaceMatchingResult, arguments: imageLiveNess);
    await closePros();
  }

  ///gọi hàm này chụp lại ảnh khi xong bước nhìn thẳng
  Future<void> isolateConvertImg(InputImage image) async {
    await compute(CameraImageConverter.isolateProcessImage, image)
        .then((value) async {
      imageLiveNess = value;
    });
  }

  static Uint8List isolateProcessImage(InputImage item) {
    img.Image convertedImage = Platform.isAndroid
        ? CameraImageConverter.decodeYUV420SP(item)
        : img.Image.fromBytes(
            width: item.metadata!.size.width.toInt(),
            height: item.metadata!.size.height.toInt(),
            bytes: item.bytes!.buffer, // For iOS
            order: img.ChannelOrder.bgra,
          );

    // Xử lý hướng xoay ảnh và giảm size
    if (item.metadata!.size.width.toInt() >
        item.metadata!.size.height.toInt()) {
      convertedImage = img.copyRotate(convertedImage, angle: -90);
      convertedImage = img.copyResize(convertedImage, width: 480, height: 640);
    }

    //Giảm chất lượng ảnh
    final compressedBytes = img.encodeJpg(convertedImage, quality: 50);

    return Uint8List.fromList(compressedBytes);
  }
}
