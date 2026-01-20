import 'package:ecert/modules/nfc_kyc/qr/qr.src.dart';
import 'package:flutter/services.dart';
import '../../../../shares/shares_src.dart';

class GetDataQr {
  static GetDataQr? _instance;

  static GetDataQr get instance => _instance ??= GetDataQr._internal();

  GetDataQr._internal();

  QrInformation getData(String barcodeScanRes) {
    QrInformation qrInformation = QrInformation();
    String? idIdentity = barcodeScanRes.substring(0, 12);

    String? information = barcodeScanRes.substring(13);
    List<String> splitStrings = information.split("|");
    if (splitStrings.isNotEmpty) {
      DateTime? dateTimeDob = _convertDatetimeQr(splitStrings[2]);
      DateTime? dateTimeDor = _convertDatetimeQr(splitStrings[5]);
      qrInformation.documentNumber = idIdentity;
      qrInformation.dateOfBirth = convertDateToString(dateTimeDob, pattern1);
      qrInformation.dateOfIssuer = convertDateToString(dateTimeDor, pattern1);

      qrInformation.fullName = splitStrings[1];
      qrInformation.gender = splitStrings[3];
      qrInformation.address = splitStrings[4];
      qrInformation.informationIdCard = splitStrings[0];
    }
    return qrInformation;
  }

  DateTime? _convertDatetimeQr(String dateString) {
    if (dateString.length == 8) {
      int day = int.parse(dateString.substring(0, 2));
      int month = int.parse(dateString.substring(2, 4));
      int year = int.parse(dateString.substring(4, 8));

      return DateTime(year, month, day);
    }
    return null;
  }

  Future<QrInformation?> scanImage(String pathImage) async {
    final result = await FlutterQrScanner.scanQRFromImage(pathImage);
    if (result != null) {
      QrInformation qrInformation = getData(result["content"] ?? "");
      return qrInformation;
    }
    return null;
  }

  Future<QrInformation?> scanImageByte(Uint8List bytesImage) async {
    final result = await FlutterQrScanner.scanQRFromImageBytes(bytesImage);
    if (result != null) {
      QrInformation qrInformation = getData(result["content"] ?? "");
      return qrInformation;
    }
    return null;
  }
}
