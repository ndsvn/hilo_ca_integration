import 'package:hilo_ca_integration/base_utils/base_src.dart';
import 'package:hilo_ca_integration/shares/export_packge.dart';

class BusinessInfo {
  String email;
  String phone;
  String password;
  String address;
  String businessHouseholdName;
  String businessHouseholdOwner;
  String businessAddress;
  String businessNumber;
  // String businessRegistration;
  String businessRegistrationDate;
  String businessEntity;
  String secretKey;

  BusinessInfo({
    this.email = "",
    this.phone = "",
    this.password = "",
    this.address = "",
    this.businessHouseholdOwner = "",
    this.businessHouseholdName = "",
    this.businessAddress = "",
    this.businessNumber = "",
    // this.businessRegistration = "",
    this.businessRegistrationDate = "",
    this.businessEntity = "",
    this.secretKey = "",
  });

  Map<String, dynamic> toJson() {
    // return {
    //   "email": "asenelupin248@gmail.com",
    //   "phone": "0902113274",
    //   "password": "123456aA@",
    //   "address": "Thôn Quyết Thắng, Xích Thổ, Nho Quan, Ninh Bình",
    //   "frontCardFileId": "fc2a2776-21cd-4cba-9a58-341d6c6187dd.jpg",
    //   "backCardFileId": "fc2a2776-21cd-4cba-9a58-341d6c6187dd.jpg",
    //   "bodyFileId": "fc2a2776-21cd-4cba-9a58-341d6c6187dd.jpg",
    //   "handSignFileId": "699579d0-29ad-4a0d-b61e-18d5700aff24.jpg",
    //   "businessRegistrationFileId": "899a9b17-c370-4a94-9e21-f0bf5b6118d8.jpg",
    //   "businessHouseholdName": "HỘ KINH DOANH THÁI LAB",
    //   "businessHouseholdOwner": "Đinh Công Sơn",
    //   "businessAddress": "Gia Hưng, Gia Viễn, Ninh Bình",
    //   "businessNumber": "17A8061280",
    //   "businessRegistration": "8703822054-001",
    //   "businessRegistrationDate": "2025-01-17",
    //   "businessEntity":
    //       "PERSONAL", //Sử dụng 1 trong hai giá trị: PERSONAL (Cá nhân) | BUSINESS (tổ chức
    //   "secretKey": "123456"
    // };
    return {
      'email': email,
      'phone': phone,
      'password': password,
      'address': address,
      'businessHouseholdOwner': businessHouseholdOwner,
      'businessHouseholdName': businessHouseholdName,
      'businessAddress': businessAddress,
      'businessNumber': businessNumber,
      // 'businessRegistration': businessRegistration,
      'businessRegistrationDate': businessRegistrationDate,
      'businessEntity': "ORG",
      'secretKey': GetPlatform.isAndroid
          ? androidDeviceInfo?.id ?? ""
          : iosDeviceInfo?.identifierForVendor ?? "",
    };
  }
}

class PersionalInfo {
  String email;
  String phone;
  String password;
  String address;
  String businessEntity;
  String secretKey;

  PersionalInfo({
    this.email = "",
    this.phone = "",
    this.password = "",
    this.address = "",
    this.businessEntity = "",
    this.secretKey = "",
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
      'password': password,
      'address': address,
      'businessEntity': "PERSONAL",
      'secretKey': GetPlatform.isAndroid
          ? androidDeviceInfo?.id ?? ""
          : iosDeviceInfo?.identifierForVendor ?? "",
    };
  }
}
