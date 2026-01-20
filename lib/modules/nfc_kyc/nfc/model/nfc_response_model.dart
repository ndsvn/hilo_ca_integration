class NfcResponseModel {
  NfcResponseModel({
    required this.status,
    required this.timestamp,
    required this.transId,
    required this.data,
    required this.transactionId,
  });

  final bool? status;
  final DateTime? timestamp;
  final String? transId;
  final DatVerify? data;
  final String? transactionId;

  factory NfcResponseModel.fromJson(Map<String, dynamic> json) {
    return NfcResponseModel(
      status: json["status"],
      timestamp: DateTime.tryParse(json["timestamp"] ?? ""),
      transId: json["transId"],
      transactionId: json["transactionId"],
      data: json["data"] == null ? null : DatVerify.fromJson(json["data"]),
    );
  }
}

class DatVerify {
  DatVerify({
    this.result,
    this.timestamp,
    this.signature,
    this.responseId,
    this.exitcode,
    this.message,
  });

  final bool? result;
  final int? timestamp;
  final String? signature;
  final String? responseId;
  final int? exitcode;
  final String? message;


  Map<String, dynamic> toJson() => {
    "signature": signature,
    "responseId": responseId,
    "exitcode": exitcode,
    "result": result,
    "message": message,
    "time": timestamp,
  };

  factory DatVerify.fromJson(Map<String, dynamic> json) {
    return DatVerify(
      result: json["result"],
      timestamp: json["time"],
      signature: json["signature"],
      responseId: json["responseId"],
      exitcode: json["exitcode"],
      message: json["message"],
    );
  }
}
