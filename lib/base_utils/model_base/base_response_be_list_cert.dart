import 'package:hilo_ca_integration/base_utils/base_src.dart';

class BaseResponseListBECert<T> {
  BaseResponseListBECert({
    required this.status,
    required this.timestamp,
    required this.transId,
    required this.data,
    this.errors,
  });
  final bool status;
  final DateTime? timestamp;
  final String transId;
  final List<ErrorModelResponse>? errors;
  final List<T> data;

  factory BaseResponseListBECert.fromJson(
    Map<String, dynamic> json,
    Function(dynamic x) func,
  ) {
    return BaseResponseListBECert<T>(
      status: json["status"] ?? false,
      timestamp: DateTime.tryParse(json["timestamp"] ?? ""),
      transId: json["transId"] ?? "",
      data: json["data"] != null
          ? List<T>.from(json["data"].map((x) => func(x)))
          : [],
      errors: json["errors"] == null
          ? []
          : List<ErrorModelResponse>.from(
              json["errors"]!.map((x) => ErrorModelResponse.fromJson(x))),
    );
  }
}
