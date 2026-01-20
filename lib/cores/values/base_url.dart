
class BaseUrl {
  static BaseUrl? _instance;
  static BaseUrl get instance => _instance ??= BaseUrl._internal();
  BaseUrl._internal();
  String baseUrl = "";
  String faceMatchingOtherUrl = "";
  String faceMatchingOtherProdUrl = "";
  String verifyC06Url = "";
  String verifyC06ProdUrl = "";

  setBaseUrl(String url) {
    baseUrl = url;
  }
  String getBaseUrl() {
    return baseUrl;
  }
  setFaceMatchingOtherUrl(String url) {
    faceMatchingOtherUrl = url;
  }
  String getFaceMatchingOtherUrl() {
    return faceMatchingOtherUrl;
  }
  setFaceMatchingOtherProdUrl(String url) {
    faceMatchingOtherProdUrl = url;
  }
  String getFaceMatchingOtherProdUrl() {
    return faceMatchingOtherProdUrl;
  }
  setVerifyC06Url(String url) {
    verifyC06Url = url;
  }
  String getVerifyC06Url() {
    return verifyC06Url;
  }
  setVerifyC06ProdUrl(String url) {
    verifyC06ProdUrl = url;
  }
  String getVerifyC06ProdUrl() {
    return verifyC06ProdUrl;
  }
}