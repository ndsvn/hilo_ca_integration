class LoginModelResponse {
  LoginModelResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  final String? accessToken;
  final String? refreshToken;

  factory LoginModelResponse.fromJson(Map<String, dynamic> json) {
    return LoginModelResponse(
      accessToken: json["accessToken"],
      refreshToken: json["refreshToken"],
    );
  }
}

class UserInfo {
  UserInfo({
    required this.address,
    required this.avatar,
    // required this.backgroundSignatures,
    required this.imageSignatures,
    required this.defaultSignature,
    required this.email,
    required this.id,
    required this.memberOf,
    required this.name,
    required this.phone,
    required this.status,
    required this.updatedAt,
    required this.username,
    required this.identityNumber,
  });

  String address;
  String avatar;
  // al BackgroundSignatures? backgroundSignatures;
  String imageSignatures;
  String defaultSignature;
  String email;
  int id;
  List<MemberOf> memberOf;
  String name;
  String phone;
  int status;
  DateTime? updatedAt;
  String username;
  String identityNumber;

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      address: json["address"] ?? "",
      avatar: json["avatar"] ?? "",
      // backgroundSignatures: json["backgroundSignatures"] == null
      //     ? null
      //     : BackgroundSignatures.fromJson(json["backgroundSignatures"]),
      imageSignatures: json["imageSignatures"] ?? "",
      defaultSignature: json["defaultSignature"] ?? "",
      email: json["email"] ?? "",
      id: json["id"] ?? 0,
      memberOf: json["memberOf"] == null
          ? []
          : List<MemberOf>.from(
              json["memberOf"]!.map((x) => MemberOf.fromJson(x))),
      name: json["name"] ?? "",
      phone: json["phone"] ?? "",
      status: json["status"] ?? 0,
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      username: json["username"] ?? "",
      identityNumber: json["identityNumber"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "address": address,
        "avatar": avatar,
        // "backgroundSignatures": backgroundSignatures?.toJson(),
        "imageSignatures": imageSignatures,
        "defaultSignature": defaultSignature,
        "email": email,
        "id": id,
        "memberOf": memberOf.map((x) => x.toJson()).toList(),
        "name": name,
        "phone": phone,
        "status": status,
        "updatedAt": updatedAt?.toIso8601String(),
        "username": username,
      };
}

class MemberOf {
  MemberOf({
    required this.id,
    required this.organizationId,
    required this.userId,
    required this.roleId,
    required this.status,
    required this.createdById,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  final int id;
  final int organizationId;
  final int userId;
  final int roleId;
  final int status;
  final dynamic createdById;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  factory MemberOf.fromJson(Map<String, dynamic> json) {
    return MemberOf(
      id: json["id"] ?? 0,
      organizationId: json["organizationId"] ?? 0,
      userId: json["userId"] ?? 0,
      roleId: json["roleId"] ?? 0,
      status: json["status"] ?? 0,
      createdById: json["createdById"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      deletedAt: json["deletedAt"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "organizationId": organizationId,
        "userId": userId,
        "roleId": roleId,
        "status": status,
        "createdById": createdById,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt,
      };
}
