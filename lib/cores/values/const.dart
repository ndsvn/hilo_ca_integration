class AppConst {
  static const int requestTimeOut = 30000; //ms
  static const int receiveTimeoutRegister = 240; //seconds
  static const int currencyUtilsMaxLength = 12;
  static const int statusCodeSuccess = 200;
  static const int pageDefault = 1;
  static const int pageSize = 20;

  ///hive
  static const String keyToken = "keyToken";
  static const String userName = "userName";
  static const String password = "password";
  static const String taxCode = "taxCode";
  static const String loginBiometric = "loginBiometric";
  static const String sytemsInvoices = "sytemsInvoices";

  static const String nfcFailDocumentNumber =
      "PACE key establishment failed: PACE <ECDH> key establishment failed: PACE <ECDH> (4); Failed: ICC Error: General authentication template (step 4) failed sw=6300";
  static const String nfcTagwaslost = "Tag was lost";

  ///status nfc
  static const String nfcAvailable = "nfc_available";
  static const String nfcDisabled = "nfc_disabled";
  static const String nfcDisabledNotSupported = "nfc_not_supported";

  ///otp
  static const int countdownOtp = 59;

  ///Signature
  static const double signatureRatio = 1.64;

  //status error
  static const int error500 = 500;
  static const int error404 = 404;
  static const int error401 = 401;
  static const int error400 = 400;
  static const int error502 = 502;
  static const int error503 = 503;

  ///type sign info
  static const String typeSignImage = "typeSignImage";
  static const String typeSignElectronic = "typeSignElectronic";
  static const String typeAuthority = "authority";
  static const String typeInfo = "info";

  //type verify
  static const String signC06 = "nfc";
  static const String signNFCCert = "nfc_onetimecert";
  static const String signeKYC = "ekyc";
  static const String signeKycNfc = "ekyc_nfc";
  static const String signNFCEKYCCert = "nfc_ekyc_onetimecert";
  static const String signeUSB = "external_cert";

  //sign submit
  static const String imageSignature = "image_signature";
  static const String appSubmit = "app_submit";
  static const String digitalSignature = "digital_signature";

  ///fileType send image
  static const String fileTypeFront = "ID_FRONT";
  static const String fileTypeBack = "ID_BACK";
  static const String fileTypeFace = "FACE";

  ///max step live ness
  static const int currentStepMax = 3;

  ///status match
  static const String matchSuccess = "1";
  static const String matchFail = "-1";
  static const String matchNormal = "0";
}
