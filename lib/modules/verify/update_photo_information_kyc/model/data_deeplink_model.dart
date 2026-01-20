class DeepLinkModel {
  int taskId;
  String typeSignPdf;
  String imgFaceFront;
  String imgFace;
  bool isToDeepLink;
  String documentNumberSign;
  String? phoneNumberSign;
  String? emailSign;

  DeepLinkModel({
    this.taskId = 0,
    this.typeSignPdf = "",
    this.imgFaceFront = "",
    this.imgFace = "",
    this.isToDeepLink = false,
    this.documentNumberSign = "",
    this.phoneNumberSign,
    this.emailSign,
  });
}
