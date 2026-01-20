import 'dart:typed_data';

import 'package:ecert/cores/cores_src.dart';
import 'package:ecert/modules/modules_src.dart';
import 'package:ecert/shares/shares_src.dart';
import 'package:image_stitcher/image_stitcher.dart';

class GuideUploadRegistrationImgCtrl extends FileOcrCtrl {
  late final Rx<Uint8List> imageResult = Rx(Uint8List(0));

  ImagePicker imagePicker = ImagePicker();

  @override
  Future<void> onInit() async {
    if (Get.arguments is ImageSourceApp) {
      if (Get.arguments == ImageSourceApp.camera) {
        await getTakePicture();
      } else {
        await getImageFromGallery();
      }
      if (imageResult.value.isEmpty) {
        Get.back();
      }
    }
    super.onInit();
  }

  Future<void> getImageFromGallery({bool isBack = false}) async {
    if (isBack) {
      Get.back();
    }
    final picked = await imagePicker.pickMultiImage();
    if (picked.isEmpty) return;
    if (picked.isNotEmpty) {
      final bytesList = await Future.wait(picked.map((e) => e.readAsBytes()));

      final result = await ImageStitcher.stitchImages(
        images: bytesList,
        direction: 'vertical',
      );
      if (result != null) {
        imageResult.value = result;
      }
    }
  }

  Future<void> getTakePicture({bool isBack = false}) async {
    if (isBack) {
      Get.back();
    }
    XFile? image = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (image != null) {
      imageResult.value = await image.readAsBytes();
    }
  }
}
