import 'dart:typed_data';

import 'package:hilo_ca_integration/base_utils/base_src.dart';

import 'package:hilo_ca_integration/cores/enum/enum_request_method.dart';
import 'package:hilo_ca_integration/cores/values/values.src.dart';
import 'package:hilo_ca_integration/modules/modules_src.dart';
import 'package:dio/dio.dart' as di;
import 'package:http_parser/http_parser.dart';

class UploadFileRepository extends BaseRepository {
  UploadFileRepository(super.controller);

  Future<BaseResponseBECert<FileInfo>> uploadFile(Uint8List images) async {
    final formData = di.FormData();

    formData.files.add(
      MapEntry(
        'file',
        di.MultipartFile.fromBytes(
          images,
          filename: 'Image.jpg',
          contentType: MediaType('image', 'jpg'),
        ),
      ),
    );

    var response = await baseSendRequest(
      AppUrl.uploadFile,
      EnumRequestMethod.post,
      jsonMap: formData,
    );
    return BaseResponseBECert.fromJson(
      response,
      func: (x) => FileInfo.fromJson(x),
    );
  }
}
