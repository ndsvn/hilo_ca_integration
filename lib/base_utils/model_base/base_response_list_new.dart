class BaseResponseListBE<T> {
  BaseResponseListBE({
    required this.timestamp,
    required this.statusCode,
    required this.data,
  });

  final String timestamp;
  final int statusCode;

  final List<T> data;

  factory BaseResponseListBE.fromJson(
      Map<String, dynamic> json,
      Function(dynamic x) func,
      ) {
    return BaseResponseListBE<T>(
      timestamp: json["timestamp"] ?? '',
      statusCode: json["statusCode"] ?? -1,
      data: json["data"] != null
          ? List<T>.from(json["data"].map((x) => func(x)))
          : [],
    );
  }
}
