import 'package:hilo_ca_integration/base_utils/base_src.dart';

class BaseResponseBECert<T> {
  BaseResponseBECert({
    required this.status,
    required this.timestamp,
    required this.transId,
    required this.data,
    this.errors,
  });

  final bool status;
  final DateTime? timestamp;
  final String transId;
  final T? data;
  final List<ErrorModelResponse>? errors;

  factory BaseResponseBECert.fromJson(
    Map<String, dynamic> json, {
    Function(Map<String, dynamic> x)? func,
  }) {
    T? convertObject() => func != null ? func(json["data"]) : json["data"];
    return BaseResponseBECert<T>(
      status: json["status"] ?? false,
      timestamp: DateTime.tryParse(json["timestamp"] ?? ""),
      transId: json["transId"] ?? "",
      data: json["data"] != null ? convertObject() : null,
      errors: json["errors"] == null
          ? []
          : List<ErrorModelResponse>.from(
              json["errors"]!.map((x) => ErrorModelResponse.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "timestamp": timestamp?.toIso8601String(),
        "transId": transId,
        "data": data,
      };
}
