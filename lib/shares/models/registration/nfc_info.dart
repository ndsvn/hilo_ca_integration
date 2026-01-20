class NfcInfo {
  String sodData;
  String dg1DataB64;
  String dg2DataB64;
  String dg13DataB64;
  String dg14DataB64;
  String issueDate;

  NfcInfo({
    this.issueDate = "",
    this.sodData = "",
    this.dg1DataB64 = "",
    this.dg2DataB64 = "",
    this.dg13DataB64 = "",
    this.dg14DataB64 = "",
  });

  Map<String, dynamic> toJson() {
    return {
      'issueDate': issueDate,
      'sodData': sodData,
      'dg1DataB64': dg1DataB64,
      'dg2DataB64': dg2DataB64,
      'dg13DataB64': dg13DataB64,
      'dg14DataB64': dg14DataB64,
    };
  }
}
