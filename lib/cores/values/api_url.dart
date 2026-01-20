import 'package:ecert/cores/values/base_url.dart';

class AppUrl {
  static const String version = "?v=1.0";
  static const String login = "/auth/customer/login";
  static const String loginOtp = "Authen/verify-login-otp";
  static const String verifyCard = "ekyc/c06-verify-card";
  static const String changePass = "auth/change-password";
  static const String checkCard = "ekyc/cards";
  static const String getProvision = "/policy";
  static const String faceMatching = "ekyc/face-matching";

  ///reset password
  static const String forgotPassword = "auth/forgot-password";
  static const String verifyOtp = "auth/verify-otp";
  static const String resetPassword = "auth/reset-password";

  static String documentDetailECM(int id) => "ecm/folder/$id";

  static const String getListDocument = "ecm/folder";

  static const String getListDocumentHandle = "bpm/tasks";

  static const String getListDocumentProcessed = "bpm/task-history";

  static const String getListCTS = "ekyc/onetime-cert";

  // Overview
  static String getOverviewTotal(
          int organizationId, int userId, String fromDate, String toDate) =>
      "report/bpm-task-overview/?organizationId=$organizationId&userId=$userId&fromDate=$fromDate&toDate=$toDate";

  static String getChart(
          int organizationId, int userId, String fromDate, String toDate) =>
      "report/ecm-node-by-class/?organizationId=$organizationId&userId=$userId&fromDate=$fromDate&toDate=$toDate";

  static String getChartStatus(
          int organizationId, int userId, String fromDate, String toDate) =>
      "report/ecm-node-overview/?organizationId=$organizationId&userId=$userId&fromDate=$fromDate&toDate=$toDate";

  ///
  static const String getOverviewPeriod = "Package/period";
  static const String getOverviewContractStatistics =
      "DocumentManager/contract-statistics";
  static const String getOverviewPacksQuota = "Package/packs_quota";

  // Document detail
  static String documentDetail(int id) => "bpm/tasks/$id";

  static String documentComment(int id) =>
      "comment/?entityId=$id&entityType=ecm_node";

  static String addComment = "comment";

  static String documentHistory(String id) => "Contract/get-all-history/$id";

  static String noteDocument(String id) => "commentbox/get-list-comment/$id";

  static String attachmentsDocument(String id) => "contract/files/$id";

  static String documentFileName(int id, {int ecmClassId = 1}) =>
      "ecm/files/$id/items/?type=2&documentType=$ecmClassId";

  static String documentFileId(int id) =>
      "ecm/files/$id/items/?type=2&documentType=1";

  // static const String sendNoteDocument = "commentbox/create-comment";

  // Get file
  static String getFile(String id) => "file-manager/$id";

  static String getFilePdf(String id) => "ecm/files/$id";

  static String completePdf(int id) => "bpm/tasks/$id/complete";

  static String imageSign(int id) => "bpm/tasks/image-signature/$id";

  static String imageSignAnonymous(int id) =>
      "bpm/anonymous-tasks/image-signature/$id";

  /// sign cts
  static const String registerCTS = "ekyc/onetime-cert";
  static const String authenticationCTS = "ekyc/verify-onetime-cert";

  // Signature
  static const String signatureTemplate = "signature-template/get-all";

  static String defaultSignature(int id) => "signature-template/updatedef/$id";

  static String deleteSignature(int id) => "signature-template/$id";
  static const String createSignature = "signature-template";

  // Personal (user)
  static const String getPersonalInfo = "user/get_current_user_info";
  static const String editPersonalInfo = "user/update_current_user_info";

  // View PDF
  static const String contractDetail = "signing/contract-detail";
  static const String signDocument = "signing/sign";
  static const String digitalCertificate = "certificate/get-by-type/3";
  static const String certAndSave = "SigningProvider/get-cert-and-save";
  static const String getCertInfo = "SigningProvider/get-cert-info";
  static const String getSigningAccess = "signing/access";
  static const String sendActionDocOtp = "otp/send-action-doc-otp";
  static const String approveDocument = 'signing/approval';
  static const String rejectDocument = 'signing/reject';

//notification
  static const String notifications = 'notifications';
  static const String notiReadAll = '$notifications/read-all';

  static String notiDetailById(int id) => '$notifications/$id';

  static String notiReadById(int id) => '$notifications/$id/read';

  //profile
  static String getPersonalById(int id) => 'users/$id';
  static const String getUserAuthorization = 'users';

  static String updateUserAuthorization(int id) => 'users/$id/assign';

  static const String getProvisionNew = "system/policy";

  ///sdk
  static String faceMatchingOther =
      "${BaseUrl.instance.getFaceMatchingOtherUrl()}/v.1/face-matches/base64?imageType=CARD";
  static String faceMatchingOtherProd =
      "${BaseUrl.instance.getFaceMatchingOtherProdUrl()}/v.1/face-matches/base64?imageType=CARD";
  static String verifyC06 =
      "${BaseUrl.instance.getVerifyC06Url()}/v.1/c06-verify/integration/verify-card";
  static String verifyC06Prod =
      "${BaseUrl.instance.getVerifyC06ProdUrl()}/v.1/c06-verify/integration/verify-card";

  // customer
  static const String cusInfo = "/customers/me";
  static const String getCusFile = "/customers/me/files";
  static const String registerCert = "/customers/me/certs/register";
  static const String confirmCert = "/customers/me/certs/confirm";
  static const String listCert = "/customers/me/certs/search";
  static const String changePassword = "/customers/me/change-pass";

// file
  static const String uploadFile = "/files";
  static const String uploadFileAndOcr = "/files/ocr";
  static const String uploadMultiFile = "/files/uploads";

  //authen
  static const String getSystemInvoices = "/tenants";
}
