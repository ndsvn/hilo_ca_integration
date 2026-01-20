import 'dart:convert';

class SystemInvoicesResponse {
  final String id;
  final String code;
  final String name;
  final String host;

  const SystemInvoicesResponse({
    required this.id,
    required this.code,
    required this.name,
    required this.host,
  });

  /// Parse từ Map JSON
  factory SystemInvoicesResponse.fromJson(Map<String, dynamic> json) =>
      SystemInvoicesResponse(
        id: json['id'] as String? ?? '',
        code: json['code'] as String? ?? '',
        name: json['name'] as String? ?? '',
        host: json['host'] as String? ?? '',
      );

  /// Convert về Map JSON
  Map<String, dynamic> toJson() => {
        'id': id,
        'code': code,
        'name': name,
        'host': host,
      };

  /// Parse từ chuỗi JSON
  factory SystemInvoicesResponse.fromJsonString(String source) =>
      SystemInvoicesResponse.fromJson(
          jsonDecode(source) as Map<String, dynamic>);

  /// Convert về chuỗi JSON
  String toJsonString() => jsonEncode(toJson());

  /// Sao chép có chỉnh sửa
  SystemInvoicesResponse copyWith({
    String? id,
    String? code,
    String? name,
    String? host,
  }) {
    return SystemInvoicesResponse(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      host: host ?? this.host,
    );
  }

  /// Hỗ trợ parse danh sách
  static List<SystemInvoicesResponse> listFromJson(List<dynamic> list) => list
      .map((e) => SystemInvoicesResponse.fromJson(e as Map<String, dynamic>))
      .toList();

  @override
  String toString() =>
      'HiloService(id: $id, code: $code, name: $name, host: $host)';

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is SystemInvoicesResponse &&
            other.id == id &&
            other.code == code &&
            other.name == name &&
            other.host == host);
  }

  @override
  int get hashCode => Object.hash(id, code, name, host);
}
