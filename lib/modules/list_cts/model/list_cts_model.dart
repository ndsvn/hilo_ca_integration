class ListCtsModel {
  final String id;
  final String serial;
  final String issuer;
  final String subject;
  final String certAlias;
  final String status;
  final String issueTime;
  final String expireTime;

  ListCtsModel({
    required this.id,
    required this.serial,
    required this.issuer,
    required this.subject,
    required this.certAlias,
    required this.status,
    required this.issueTime,
    required this.expireTime,
  });

  factory ListCtsModel.fromJson(Map<String, dynamic> json) {
    return ListCtsModel(
      id: json['id'] ?? '',
      serial: json['serial'] ?? '',
      issuer: json['issuer'] ?? '',
      subject: json['subject'] ?? '',
      certAlias: json['certAlias'] ?? '',
      status: json['status'] ?? '',
      issueTime: json['issueTime'] ?? '',
      expireTime: json['expireTime'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'serial': serial,
      'issuer': issuer,
      'subject': subject,
      'certAlias': certAlias,
      'status': status,
      'issueTime': issueTime,
      'expireTime': expireTime,
    };
  }
}
