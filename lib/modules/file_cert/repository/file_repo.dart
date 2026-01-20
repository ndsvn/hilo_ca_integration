import 'dart:typed_data';

import 'package:dio/dio.dart' as di;
import 'package:ecert/modules/modules_src.dart';
import 'package:http_parser/http_parser.dart';

import '../../../base_utils/base_src.dart';
import '../../../cores/cores_src.dart';

class RepositoryFile extends BaseRepository {
  RepositoryFile(super.controller);

  Future<BaseResponseBECert<FileInfoData>> upFileAndOCR(
      Uint8List images) async {
    final formData = di.FormData();

    formData.files.add(
      MapEntry(
        'files',
        di.MultipartFile.fromBytes(
          images,
          filename: 'Image.jpg',
          contentType: MediaType('image', 'jpg'),
        ),
      ),
    );

    var response = await baseSendRequest(
      AppUrl.uploadFileAndOcr,
      EnumRequestMethod.post,
      jsonMap: formData,
    );
    return BaseResponseBECert.fromJson(
      response,
      func: (x) => FileInfoData.fromJson(x),
    );
  }

  Future<BaseResponseListBECert<FileInfo>> uploadMultipleFiles(
      List<String> paths) async {
    final formData = di.FormData();

    for (var path in paths) {
      formData.files.add(
        MapEntry(
          'files',
          await di.MultipartFile.fromFile(path, filename: path.split('/').last),
        ),
      );
    }

    var response = await baseSendRequest(
      AppUrl.uploadMultiFile,
      EnumRequestMethod.post,
      jsonMap: formData,
    );
    return BaseResponseListBECert<FileInfo>.fromJson(
      response,
      (x) => FileInfo.fromJson(x),
    );
  }
}
