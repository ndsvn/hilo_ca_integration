class CusInfo {
  CusInfo({
    required this.id,
    required this.code,
    required this.name,
    required this.parentName,
    required this.address,
    required this.bankName,
    required this.bankNumber,
    required this.email,
    required this.fax,
    required this.phone,
    required this.representPerson,
    required this.taxCode,
    required this.accountName,
    required this.domain,
    required this.approved,
    required this.isUsed,
    required this.portalLink,
    required this.contactEmail,
    required this.host,
    required this.port,
    required this.smtpUser,
    required this.smtpPassword,
    required this.emailFrom,
    required this.fromName,
    required this.smtpEncryption,
    required this.smtpAuthentication,
    required this.contactPerson,
    required this.contactPhone,
    required this.city,
    required this.taxAuthorityCode,
    required this.taxAuthorityName,
    required this.delegateType,
    required this.delegateTaxCode,
    required this.delegateName,
    required this.delegateFromDate,
    required this.delegateToDate,
    required this.delegatePurpose,
    required this.delegatePayMethod,
    required this.username,
  });

  final int id;
  String code;
  final String name;
  final dynamic parentName;
  final String address;
  final dynamic bankName;
  final dynamic bankNumber;
  final String email;
  final dynamic fax;
  final String phone;
  final String representPerson;
  final String taxCode;
  final String accountName;
  final String domain;
  final bool approved;
  final bool isUsed;
  final String portalLink;
  final dynamic contactEmail;
  final dynamic host;
  final dynamic port;
  final String smtpUser;
  final dynamic smtpPassword;
  final dynamic emailFrom;
  final dynamic fromName;
  final int smtpEncryption;
  final bool smtpAuthentication;
  final String contactPerson;
  final String contactPhone;
  final String city;
  final String taxAuthorityCode;
  final String taxAuthorityName;
  final int delegateType;
  final dynamic delegateTaxCode;
  final dynamic delegateName;
  final DateTime? delegateFromDate;
  final DateTime? delegateToDate;
  final dynamic delegatePurpose;
  final dynamic delegatePayMethod;
  final String username;

  factory CusInfo.fromJson(Map<String, dynamic> json) {
    return CusInfo(
      id: json["id"] ?? 0,
      code: json["Code"] ?? "",
      name: json["Name"] ?? "",
      parentName: json["ParentName"],
      address: json["Address"] ?? "",
      bankName: json["BankName"],
      bankNumber: json["BankNumber"],
      email: json["Email"] ?? "",
      fax: json["Fax"],
      phone: json["Phone"] ?? "",
      representPerson: json["RepresentPerson"] ?? "",
      taxCode: json["TaxCode"] ?? "",
      accountName: json["AccountName"] ?? "",
      domain: json["Domain"] ?? "",
      approved: json["Approved"] ?? false,
      isUsed: json["IsUsed"] ?? false,
      portalLink: json["PortalLink"] ?? "",
      contactEmail: json["ContactEmail"],
      host: json["Host"],
      port: json["Port"],
      smtpUser: json["SMTP_User"] ?? "",
      smtpPassword: json["SMTP_Password"],
      emailFrom: json["EmailFrom"],
      fromName: json["FromName"],
      smtpEncryption: json["SMTP_Encryption"] ?? 0,
      smtpAuthentication: json["SMTP_Authentication"] ?? false,
      contactPerson: json["ContactPerson"] ?? "",
      contactPhone: json["ContactPhone"] ?? "",
      city: json["City"] ?? "",
      taxAuthorityCode: json["TaxAuthorityCode"] ?? "",
      taxAuthorityName: json["TaxAuthorityName"] ?? "",
      delegateType: json["DelegateType"] ?? 0,
      delegateTaxCode: json["DelegateTaxCode"],
      delegateName: json["DelegateName"],
      delegateFromDate: DateTime.tryParse(json["DelegateFromDate"] ?? ""),
      delegateToDate: DateTime.tryParse(json["DelegateToDate"] ?? ""),
      delegatePurpose: json["DelegatePurpose"],
      delegatePayMethod: json["DelegatePayMethod"],
      username: json["username"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "Code": code,
        "Name": name,
        "ParentName": parentName,
        "Address": address,
        "BankName": bankName,
        "BankNumber": bankNumber,
        "Email": email,
        "Fax": fax,
        "Phone": phone,
        "RepresentPerson": representPerson,
        "TaxCode": taxCode,
        "AccountName": accountName,
        "Domain": domain,
        "Approved": approved,
        "IsUsed": isUsed,
        "PortalLink": portalLink,
        "ContactEmail": contactEmail,
        "Host": host,
        "Port": port,
        "SMTP_User": smtpUser,
        "SMTP_Password": smtpPassword,
        "EmailFrom": emailFrom,
        "FromName": fromName,
        "SMTP_Encryption": smtpEncryption,
        "SMTP_Authentication": smtpAuthentication,
        "ContactPerson": contactPerson,
        "ContactPhone": contactPhone,
        "City": city,
        "TaxAuthorityCode": taxAuthorityCode,
        "TaxAuthorityName": taxAuthorityName,
        "DelegateType": delegateType,
        "DelegateTaxCode": delegateTaxCode,
        "DelegateName": delegateName,
        "DelegateFromDate": delegateFromDate?.toIso8601String(),
        "DelegateToDate": delegateToDate?.toIso8601String(),
        "DelegatePurpose": delegatePurpose,
        "DelegatePayMethod": delegatePayMethod,
        "username": username,
      };
}
