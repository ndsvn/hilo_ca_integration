class BaseResponseBENew<T> {
  BaseResponseBENew({
    required this.statusCode,
    required this.data,
  });

  final int statusCode;
  final T? data;

  factory BaseResponseBENew.fromJson(
    Map<String, dynamic> json, {
    Function(Map<String, dynamic> x)? func,
  }) {
    T? convertObject() => func != null ? func(json["data"]) : json["data"];
    return BaseResponseBENew<T>(
      statusCode: json["statusCode"] ?? false,
      data: json["data"] != null ? convertObject() : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "data": data,
      };
}
