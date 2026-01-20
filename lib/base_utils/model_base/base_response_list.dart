class BaseResponseList<T> {
  BaseResponseList({
    required this.statusCode,
    required this.data,
  });

  final int statusCode;
  final DataRow<T>? data;

  factory BaseResponseList.fromJson(
    Map<String, dynamic> json, {
    required Function(dynamic x) func,
  }) {
    return BaseResponseList(
      statusCode: json["statusCode"] ?? 0,
      data: json["data"] == null
          ? null
          : DataRow<T>.fromJson(
              json["data"],
              func: func,
            ),
    );
  }

  Map<String, dynamic> toJson({required Function(dynamic x) func}) => {
        "statusCode": statusCode,
        "data": data?.toJson(func: func),
      };
}

class DataRow<T> {
  DataRow({
    required this.count,
    required this.rows,
  });

  final int count;
  final List<T> rows;

  factory DataRow.fromJson(
    Map<String, dynamic> json, {
    required Function(dynamic x) func,
  }) {
    return DataRow(
      count: json["count"] ?? 0,
      rows: json["rows"] != null
          ? List<T>.from(json["rows"].map((x) => func(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson({required Function(dynamic x) func}) => {
        "count": count,
        "rows": List<dynamic>.from(rows.map((x) => func)),
      };
}
