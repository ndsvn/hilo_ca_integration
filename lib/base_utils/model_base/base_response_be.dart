class BaseResponseBE<T> {
  BaseResponseBE({
    required this.message,
    required this.success,
    required this.data,
  });

  final String message;
  final bool success;

  final T? data;

  factory BaseResponseBE.fromJson(
    Map<String, dynamic> json, {
    Function(Map<String, dynamic> x)? func,
  }) {
    T? convertObject() => func != null ? func(json["data"]) : json["data"];
    return BaseResponseBE<T>(
      message: json["message"] ?? '',
      success: json["success"] ?? false,
      data: json["data"] != null ? convertObject() : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "data": data,
      };
}
