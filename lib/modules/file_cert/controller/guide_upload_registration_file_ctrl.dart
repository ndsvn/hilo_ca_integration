import 'dart:io';
import 'dart:typed_data';

import 'package:ecert/modules/modules_src.dart';
import 'package:ecert/shares/shares_src.dart';

class GuideUploadRegistrationFileCtrl extends FileOcrCtrl {
  late final Rx<Uint8List> pickedFiles = Rx(Uint8List(0));

  @override
  onInit() {
    super.onInit();
    pickFile().then((onValue) {
      if (pickedFiles.value.isEmpty) {
        Get.back();
      }
    });
  }

  Future<void> pickFile() async {
    String? path = await FilePickerUtils.pickFile();
    if (path != null) {
      pickedFiles.value = await File(path).readAsBytes();
    }
  }
}
