import '../../../modules/modules_src.dart';

class SignCtsResponse {
  final String status;
  final String createdAt;
  final String createdBy;
  final String updatedAt;
  final String updatedBy;
  final String id;
  final String serial;
  final String issuer;
  final String subject;
  final String certAlias;
  final String issueTime;
  final String expireTime;

  SignCtsResponse({
    required this.status,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
    required this.id,
    required this.serial,
    required this.issuer,
    required this.subject,
    required this.certAlias,
    required this.issueTime,
    required this.expireTime,
  });

  factory SignCtsResponse.fromJson(Map<String, dynamic> json) {
    return SignCtsResponse(
      status: json['status'] ?? '',
      createdAt: json['createdAt'] ?? '',
      createdBy: json['createdBy'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      updatedBy: json['updatedBy'] ?? '',
      id: json['id'] ?? '',
      serial: json['serial'] ?? '',
      issuer: json['issuer'] ?? '',
      subject: json['subject'] ?? '',
      certAlias: json['certAlias'] ?? '',
      issueTime: json['issueTime'] ?? '',
      expireTime: json['expireTime'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'createdAt': createdAt,
      'createdBy': createdBy,
      'updatedAt': updatedAt,
      'updatedBy': updatedBy,
      'id': id,
      'serial': serial,
      'issuer': issuer,
      'subject': subject,
      'certAlias': certAlias,
      'issueTime': issueTime,
      'expireTime': expireTime,
    };
  }

  static SignCtsResponse fromListCtsModel(ListCtsModelView listCtsModelView) {
    return SignCtsResponse(
      status: listCtsModelView.listCtsModel.status,
      createdAt: '',
      createdBy: '',
      updatedAt: '',
      updatedBy: '',
      id: listCtsModelView.listCtsModel.id,
      serial: listCtsModelView.listCtsModel.serial,
      issuer: listCtsModelView.listCtsModel.issuer,
      subject: listCtsModelView.listCtsModel.subject,
      certAlias: listCtsModelView.listCtsModel.certAlias,
      issueTime: listCtsModelView.listCtsModel.issueTime,
      expireTime: listCtsModelView.listCtsModel.expireTime,
    );
  }
}

class DistinguishedName {
  final String? uid;
  final String? cn;
  final String? o;
  final String? l;
  final String? st;
  final String? c;

  DistinguishedName({
    this.uid,
    this.cn,
    this.o,
    this.l,
    this.st,
    this.c,
  });

  factory DistinguishedName.fromDnString(String dn) {
    final Map<String, String> map = {};
    final parts = dn.split(',');

    for (final part in parts) {
      final keyValue = part.split('=');
      if (keyValue.length == 2) {
        map[keyValue[0].trim()] = keyValue[1].trim();
      }
    }

    return DistinguishedName(
      uid: map['UID'],
      cn: map['CN'],
      o: map['O'],
      l: map['L'],
      st: map['ST'],
      c: map['C'],
    );
  }

  @override
  String toString() {
    return 'UID: $uid, CN: $cn';
  }
}

class IssuerName {
  final String? cn;
  final String? o;
  final String? c;

  IssuerName({
    this.cn,
    this.o,
    this.c,
  });

  factory IssuerName.fromDnString(String dn) {
    final Map<String, String> map = {};
    final parts = dn.split(',');

    for (final part in parts) {
      final keyValue = part.split('=');
      if (keyValue.length == 2) {
        map[keyValue[0].trim().toUpperCase()] = keyValue[1].trim();
      }
    }

    return IssuerName(
      cn: map['CN'],
      o: map['O'],
      c: map['C'],
    );
  }

  @override
  String toString() {
    return 'CN: $cn, O: $o, C: $c';
  }
}
