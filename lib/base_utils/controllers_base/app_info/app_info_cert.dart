import 'package:ecert/modules/modules_src.dart';
import 'package:ecert/shares/shares_src.dart';

import '../app_controller/app_controller.dart';

class AppInfoCert {
  static AppInfoCert? _instance;

  static AppInfoCert get instance => _instance ??= AppInfoCert._internal();

  AppInfoCert._internal();

  InfoData? infoDataApp;

  ///lưu 1 số thông tin cơ bản của cus
  late CusInfo cusInfo;

  SdkRequestModel? sdkRequestModel;

  /// Biến chứa thông tin ảnh
  DocumentFiles documentFiles = DocumentFiles();

  /// Biến chứa thông tin kinh doanh
  BusinessInfo businessInfo = BusinessInfo();

  /// Biến chứa thông tin NFC
  NfcInfo nfcInfo = NfcInfo();

  /// Biến chứa thông tin verify
  VerifyRequestModel verifyRequestModel = VerifyRequestModel();

  /// Biến xác định đăng ký cá nhân hay tổ chức
  bool isPersonal = false;

  void setSdkRequestModel(SdkRequestModel sdkRequestModel) {
    AppInfoCert.instance.sdkRequestModel = sdkRequestModel;
  }
  void setNfcInfoData(NfcInfo nfcInfo) {
    nfcInfo.issueDate = convertDateToString(
        convertStringToDate(nfcInfo.issueDate, pattern1), patternDefault);
    AppInfoCert.instance.nfcInfo = nfcInfo;
  }

  void setFileInfoData(FileInfoData? fileInfoData) {
    if (fileInfoData == null) return;
    infoDataApp = fileInfoData.info;
    documentFiles.setBusinessRegistrationFileId(fileInfoData.fileInfo.filename);

    AppInfoCert.instance.businessInfo = BusinessInfo(
      businessNumber: fileInfoData.info?.businessNumber ?? "",
      // businessRegistration: fileInfoData.info?.businessRegistration ?? "",
      businessRegistrationDate: convertDateToString(
          convertStringToDate(
              fileInfoData.info?.businessRegistrationDate ?? "", pattern1),
          patternDefault),
      businessHouseholdName: fileInfoData.info?.businessHouseholdName ?? "",
      businessHouseholdOwner: fileInfoData.info?.ownerFullName ?? "",
      businessAddress: fileInfoData.info?.businessAddress ?? "",
      phone: fileInfoData.info?.businessPhone ?? "",
      address: fileInfoData.info?.ownerAddress ?? "",
      email: fileInfoData.info?.businessEmail ?? "",
      password: "123456aA@",
      businessEntity: convertBusinessEntity(fileInfoData.info?.businessEntity),
      secretKey: GetPlatform.isAndroid
          ? androidDeviceInfo?.id ?? ""
          : iosDeviceInfo?.identifierForVendor ?? "",
    );
  }

  void setFileInfoDataReInput({
    required String email,
    required String phone,
    required String name,
    required String address,
    required String taxCode,
    required String codeRegister,
    required String ownerFullName,
    required String ownerCitizenNumber,
  }) {
    AppInfoCert.instance.businessInfo
      ..email = email.trim()
      ..phone = phone.trim()
      ..businessHouseholdName = name
      ..businessAddress = address.trim()
      ..businessNumber = taxCode.trim()
      // ..businessRegistration = codeRegister.trim()
      ..businessHouseholdOwner = ownerFullName.trim();
    AppInfoCert.instance.cusInfo.code = ownerCitizenNumber.trim();
  }

// Tạm thời không gọi vì BE veify
  // void setVerifyRequestModel() {
  //   verifyRequestModel = VerifyRequestModel(
  //     sodData: nfcInfo.sodData,
  //     dg1DataB64: nfcInfo.dg1DataB64,
  //     dg2DataB64: nfcInfo.dg2DataB64,
  //     dg13DataB64: nfcInfo.dg13DataB64,
  //     dg14DataB64: nfcInfo.dg14DataB64,
  //     fileId: documentFiles.businessRegistrationFileId,
  //     bodyFileId: documentFiles.businessRegistrationFileId,
  //     phone: businessInfo.phone,
  //     method: sdkRequestModel.method,
  //   );
  // }

 

  void clearData() {
    infoDataApp = null;
    documentFiles = DocumentFiles();
    businessInfo = BusinessInfo();
    nfcInfo = NfcInfo();
  }
}
