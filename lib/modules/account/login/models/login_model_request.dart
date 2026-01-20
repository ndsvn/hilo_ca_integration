class LoginModelRequest {
  LoginModelRequest({
    required this.username,
    required this.password,
    required this.tenantId,
    required this.taxCode,
  });

  final String? taxCode;
  final String? tenantId;
  final String? username;
  final String? password;

  factory LoginModelRequest.fromJson(Map<String, dynamic> json) {
    return LoginModelRequest(
      username: json["username"],
      password: json["password"],
      taxCode: json["taxCode"],
      tenantId: json["tenantId"],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "taxCode": taxCode,
        "tenantId": tenantId,
      };
}
