class FileInfo {
  final int size;
  final String filename;

  FileInfo({
    required this.size,
    required this.filename,
  });

  factory FileInfo.fromJson(Map<String, dynamic> json) => FileInfo(
        size: json['size'],
        filename: json['filename'],
      );

  Map<String, dynamic> toJson() => {
        'size': size,
        'filename': filename,
      };

  FileInfo copyWith({
    int? size,
    String? filename,
  }) {
    return FileInfo(
      size: size ?? this.size,
      filename: filename ?? this.filename,
    );
  }
}

class InfoData {
  final String department;
  final String businessEmail;
  final String businessNumber;
  // final String businessRegistration;
  final String businessRegistrationDate;
  final String businessHouseholdName;
  final String businessPhone;
  final String businessAddress;
  final String businessEntity;
  final String ownerDob;
  final String ownerAddress;
  final String ownerIssueDate;
  final String ownerCitizenNumber;
  final String ownerFullName;

  InfoData({
    required this.department,
    required this.businessEmail,
    required this.businessNumber,
    // required this.businessRegistration,
    required this.businessRegistrationDate,
    required this.businessHouseholdName,
    required this.businessPhone,
    required this.businessAddress,
    required this.businessEntity,
    required this.ownerDob,
    required this.ownerAddress,
    required this.ownerIssueDate,
    required this.ownerCitizenNumber,
    required this.ownerFullName,
  });

  factory InfoData.fromJson(Map<String, dynamic> json) => InfoData(
        department: json['department'],
        businessEmail: json['businessEmail'],
        businessNumber: json['businessNumber'],
        // businessRegistration: json['businessRegistration'],
        businessRegistrationDate: json['businessRegistrationDate'],
        businessHouseholdName: json['businessHouseholdName'],
        businessPhone: json['businessPhone'],
        businessAddress: json['businessAddress'],
        businessEntity: json['businessEntity'],
        ownerDob: json['ownerDob'],
        ownerAddress: json['ownerAddress'],
        ownerIssueDate: json['ownerIssueDate'],
        ownerCitizenNumber: json['ownerCitizenNumber'],
        ownerFullName: json['ownerFullName'],
      );

  Map<String, dynamic> toJson() => {
        'department': department,
        'businessEmail': businessEmail,
        'businessNumber': businessNumber,
        // 'businessRegistration': businessRegistration,
        'businessRegistrationDate': businessRegistrationDate,
        'businessHouseholdName': businessHouseholdName,
        'businessPhone': businessPhone,
        'businessAddress': businessAddress,
        'businessEntity': businessEntity,
        'ownerDob': ownerDob,
        'ownerAddress': ownerAddress,
        'ownerIssueDate': ownerIssueDate,
        'ownerCitizenNumber': ownerCitizenNumber,
        'ownerFullName': ownerFullName,
      };

  InfoData copyWith({
    String? department,
    String? businessEmail,
    String? businessNumber,
    String? businessRegistration,
    String? businessRegistrationDate,
    String? businessHouseholdName,
    String? businessPhone,
    String? businessAddress,
    String? businessEntity,
    String? ownerDob,
    String? ownerAddress,
    String? ownerIssueDate,
    String? ownerCitizenNumber,
    String? ownerFullName,
  }) {
    return InfoData(
      department: department ?? this.department,
      businessEmail: businessEmail ?? this.businessEmail,
      businessNumber: businessNumber ?? this.businessNumber,
      // businessRegistration: businessRegistration ?? this.businessRegistration,
      businessRegistrationDate:
          businessRegistrationDate ?? this.businessRegistrationDate,
      businessHouseholdName:
          businessHouseholdName ?? this.businessHouseholdName,
      businessPhone: businessPhone ?? this.businessPhone,
      businessAddress: businessAddress ?? this.businessAddress,
      businessEntity: businessEntity ?? this.businessEntity,
      ownerDob: ownerDob ?? this.ownerDob,
      ownerAddress: ownerAddress ?? this.ownerAddress,
      ownerIssueDate: ownerIssueDate ?? this.ownerIssueDate,
      ownerCitizenNumber: ownerCitizenNumber ?? this.ownerCitizenNumber,
      ownerFullName: ownerFullName ?? this.ownerFullName,
    );
  }
}

class FileInfoData {
  final FileInfo fileInfo;
  final InfoData? info;

  FileInfoData({
    required this.fileInfo,
    required this.info,
  });

  factory FileInfoData.fromJson(Map<String, dynamic> json) => FileInfoData(
        fileInfo: FileInfo.fromJson(json['fileInfo']),
        info: json['info'] != null ? InfoData.fromJson(json['info']) : null,
      );

  Map<String, dynamic> toJson() => {
        'fileInfo': fileInfo.toJson(),
        'info': info?.toJson(),
      };

  FileInfoData copyWith({
    FileInfo? fileInfo,
    InfoData? info,
  }) {
    return FileInfoData(
      fileInfo: fileInfo ?? this.fileInfo,
      info: info ?? this.info,
    );
  }
}
