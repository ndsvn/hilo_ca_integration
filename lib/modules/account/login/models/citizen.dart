class Citizen {
  final String status;
  final String id;
  final String fullName;
  final String citizenNumber;
  final String dateOfBirth;
  final String gender;
  final String nationality;
  final String nativeLand;
  final String ethnic;
  final String religion;
  final String address;
  final String issuePlate;
  final String issueDate;
  final String expiredDate;
  final String identification;

  Citizen({
    required this.status,
    required this.id,
    required this.fullName,
    required this.citizenNumber,
    required this.dateOfBirth,
    required this.gender,
    required this.nationality,
    required this.nativeLand,
    required this.ethnic,
    required this.religion,
    required this.address,
    required this.issuePlate,
    required this.issueDate,
    required this.expiredDate,
    required this.identification,
  });

  factory Citizen.fromJson(Map<String, dynamic> json) => Citizen(
        status: json['status'] ?? '',
        id: json['id'] ?? '',
        fullName: json['fullName'] ?? '',
        citizenNumber: json['citizenNumber'] ?? '',
        dateOfBirth: json['dateOfBirth'] ?? '',
        gender: json['gender'] ?? '',
        nationality: json['nationality'] ?? '',
        nativeLand: json['nativeLand'] ?? '',
        ethnic: json['ethnic'] ?? '',
        religion: json['religion'] ?? '',
        address: json['address'] ?? '',
        issuePlate: json['issuePlate'] ?? '',
        issueDate: json['issueDate'] ?? '',
        expiredDate: json['expiredDate'] ?? '',
        identification: json['identification'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'id': id,
        'fullName': fullName,
        'citizenNumber': citizenNumber,
        'dateOfBirth': dateOfBirth,
        'gender': gender,
        'nationality': nationality,
        'nativeLand': nativeLand,
        'ethnic': ethnic,
        'religion': religion,
        'address': address,
        'issuePlate': issuePlate,
        'issueDate': issueDate,
        'expiredDate': expiredDate,
        'identification': identification,
      };
}
