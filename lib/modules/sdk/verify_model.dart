class VerifyRequestModel {
  VerifyRequestModel({
    this.sodData,
    this.dg1DataB64,
    this.dg2DataB64,
    this.dg13DataB64,
    this.dg14DataB64,
    this.fileId,
    this.bodyFileId,
    this.phone,
    this.method = "C06",
  });

  ///base64
  String? sodData;
  String? dg1DataB64;
  String? dg2DataB64;
  String? dg13DataB64;
  String? dg14DataB64;
  String? fileId;
  String? bodyFileId;

  String? phone;
  String? method;

  factory VerifyRequestModel.fromJson(Map<String, dynamic> json) {
    return VerifyRequestModel(
      sodData: json["sodData"],
      dg1DataB64: json["dg1DataB64"],
      dg2DataB64: json["dg2DataB64"],
      dg13DataB64: json["dg13DataB64"],
      dg14DataB64: json["dg14DataB64"],
      fileId: json["fileId"],
      bodyFileId: json["bodyFileId"],
      phone: json["phone"],
      method: json["method"],
    );
  }

  Map<String, dynamic> toJson() => {
        "sodData": sodData,
        "dg1DataB64": dg1DataB64,
        "dg2DataB64": dg2DataB64,
        "dg13DataB64": dg13DataB64,
        "dg14DataB64": dg14DataB64,
        "fileId": fileId,
        "bodyFileId": bodyFileId,
        "phone": phone,
        "method": method,
      };
}
