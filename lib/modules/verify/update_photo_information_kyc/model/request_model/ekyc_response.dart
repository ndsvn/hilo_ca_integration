class EkycResponse {
  EkycResponse({
    required this.data,
    required this.errorCode,
    required this.errorMessage,
    required this.transactionId,
  });

  final List<Datum> data;
  final String? errorCode;
  final String? errorMessage;
  final String? transactionId;

  factory EkycResponse.fromJson(Map<String, dynamic> json) {
    return EkycResponse(
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      errorCode: json["errorCode"],
      errorMessage: json["errorMessage"],
      transactionId: json["transactionId"],
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data.map((x) => x.toJson()).toList(),
        "errorCode": errorCode,
        "errorMessage": errorMessage,
        "transactionId": transactionId,
      };
}

class Datum {
  Datum({
    required this.info,
    required this.invalidCode,
    required this.invalidMessage,
    required this.type,
    required this.valid,
  });

  final Info? info;
  final String? invalidCode;
  final String? invalidMessage;
  final String? type;
  final String? valid;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      info: json["info"] == null ? null : Info.fromJson(json["info"]),
      invalidCode: json["invalidCode"],
      invalidMessage: json["invalidMessage"],
      type: json["type"],
      valid: json["valid"],
    );
  }

  Map<String, dynamic> toJson() => {
        "info": info?.toJson(),
        "invalidCode": invalidCode,
        "invalidMessage": invalidMessage,
        "type": type,
        "valid": valid,
      };
}

class Info {
  Info({
    required this.checksumFinal,
    required this.checksumFinalValidate,
    required this.country,
    required this.dob,
    required this.dobChecksum,
    required this.dobChecksumValidate,
    required this.documentNumber,
    required this.documentNumberChecksum,
    required this.documentNumberChecksumValidate,
    required this.dueDate,
    required this.dueDateChecksum,
    required this.dueDateChecksumValidate,
    required this.gender,
    required this.givenName,
    required this.identificationSign,
    required this.identificationSignBox,
    required this.identificationSignConfidence,
    required this.image,
    required this.issueDate,
    required this.issueDateBox,
    required this.issueDateConfidence,
    required this.issuedAt,
    required this.issuedAtBox,
    required this.issuedAtConfidence,
    required this.mrzConfidence,
    required this.nationality,
    required this.personNumber,
    required this.surName,
    required this.address,
    required this.addressBox,
    required this.addressConfidence,
    required this.addressDistrict,
    required this.addressDistrictCode,
    required this.addressTown,
    required this.addressTownCode,
    required this.addressWard,
    required this.addressWardCode,
    required this.dobBox,
    required this.dobConfidence,
    required this.dueDateBox,
    required this.dueDateConfidence,
    required this.genderBox,
    required this.genderConfidence,
    required this.hometown,
    required this.hometownBox,
    required this.hometownConfidence,
    required this.hometownDistrict,
    required this.hometownDistrictCode,
    required this.hometownTown,
    required this.hometownTownCode,
    required this.hometownWard,
    required this.hometownWardCode,
    required this.id,
    required this.idBox,
    required this.idConfidence,
    required this.name,
    required this.nameBox,
    required this.nameConfidence,
    required this.nationalityBox,
    required this.nationalityConfidence,
  });

  final String? checksumFinal;
  final String? checksumFinalValidate;
  final String? country;
  final String? dob;
  final String? dobChecksum;
  final String? dobChecksumValidate;
  final String? documentNumber;
  final String? documentNumberChecksum;
  final String? documentNumberChecksumValidate;
  final String? dueDate;
  final String? dueDateChecksum;
  final String? dueDateChecksumValidate;
  final String? gender;
  final String? givenName;
  final String? identificationSign;
  final List<int> identificationSignBox;
  final double? identificationSignConfidence;
  final String? image;
  final String? issueDate;
  final List<int> issueDateBox;
  final double? issueDateConfidence;
  final String? issuedAt;
  final List<int> issuedAtBox;
  final double? issuedAtConfidence;
  final double? mrzConfidence;
  final String? nationality;
  final String? personNumber;
  final String? surName;
  final String? address;
  final List<int> addressBox;
  final double? addressConfidence;
  final String? addressDistrict;
  final String? addressDistrictCode;
  final String? addressTown;
  final String? addressTownCode;
  final String? addressWard;
  final String? addressWardCode;
  final List<int> dobBox;
  final double? dobConfidence;
  final List<int> dueDateBox;
  final double? dueDateConfidence;
  final List<int> genderBox;
  final double? genderConfidence;
  final String? hometown;
  final List<int> hometownBox;
  final double? hometownConfidence;
  final String? hometownDistrict;
  final String? hometownDistrictCode;
  final String? hometownTown;
  final String? hometownTownCode;
  final String? hometownWard;
  final String? hometownWardCode;
  final String? id;
  final List<int> idBox;
  final double? idConfidence;
  final String? name;
  final List<int> nameBox;
  final double? nameConfidence;
  final List<int> nationalityBox;
  final double? nationalityConfidence;

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      checksumFinal: json["checksum_final"],
      checksumFinalValidate: json["checksum_final_validate"],
      country: json["country"],
      dob: json["dob"],
      dobChecksum: json["dob_checksum"],
      dobChecksumValidate: json["dob_checksum_validate"],
      documentNumber: json["document_number"],
      documentNumberChecksum: json["document_number_checksum"],
      documentNumberChecksumValidate: json["document_number_checksum_validate"],
      dueDate: json["due_date"],
      dueDateChecksum: json["due_date_checksum"],
      dueDateChecksumValidate: json["due_date_checksum_validate"],
      gender: json["gender"],
      givenName: json["given_name"],
      identificationSign: json["identification_sign"],
      identificationSignBox: json["identification_sign_box"] == null
          ? []
          : List<int>.from(json["identification_sign_box"]!.map((x) => x)),
      identificationSignConfidence: json["identification_sign_confidence"],
      image: json["image"],
      issueDate: json["issue_date"],
      issueDateBox: json["issue_date_box"] == null
          ? []
          : List<int>.from(json["issue_date_box"]!.map((x) => x)),
      issueDateConfidence: json["issue_date_confidence"],
      issuedAt: json["issued_at"],
      issuedAtBox: json["issued_at_box"] == null
          ? []
          : List<int>.from(json["issued_at_box"]!.map((x) => x)),
      issuedAtConfidence: json["issued_at_confidence"],
      mrzConfidence: json["mrz_confidence"],
      nationality: json["nationality"],
      personNumber: json["person_number"],
      surName: json["sur_name"],
      address: json["address"],
      addressBox: json["address_box"] == null
          ? []
          : List<int>.from(json["address_box"]!.map((x) => x)),
      addressConfidence: json["address_confidence"],
      addressDistrict: json["address_district"],
      addressDistrictCode: json["address_district_code"],
      addressTown: json["address_town"],
      addressTownCode: json["address_town_code"],
      addressWard: json["address_ward"],
      addressWardCode: json["address_ward_code"],
      dobBox: json["dob_box"] == null
          ? []
          : List<int>.from(json["dob_box"]!.map((x) => x)),
      dobConfidence: json["dob_confidence"],
      dueDateBox: json["due_date_box"] == null
          ? []
          : List<int>.from(json["due_date_box"]!.map((x) => x)),
      dueDateConfidence: json["due_date_confidence"],
      genderBox: json["gender_box"] == null
          ? []
          : List<int>.from(json["gender_box"]!.map((x) => x)),
      genderConfidence: json["gender_confidence"],
      hometown: json["hometown"],
      hometownBox: json["hometown_box"] == null
          ? []
          : List<int>.from(json["hometown_box"]!.map((x) => x)),
      hometownConfidence: json["hometown_confidence"],
      hometownDistrict: json["hometown_district"],
      hometownDistrictCode: json["hometown_district_code"],
      hometownTown: json["hometown_town"],
      hometownTownCode: json["hometown_town_code"],
      hometownWard: json["hometown_ward"],
      hometownWardCode: json["hometown_ward_code"],
      id: json["id"],
      idBox: json["id_box"] == null
          ? []
          : List<int>.from(json["id_box"]!.map((x) => x)),
      idConfidence: json["id_confidence"],
      name: json["name"],
      nameBox: json["name_box"] == null
          ? []
          : List<int>.from(json["name_box"]!.map((x) => x)),
      nameConfidence: json["name_confidence"],
      nationalityBox: json["nationality_box"] == null
          ? []
          : List<int>.from(json["nationality_box"]!.map((x) => x)),
      nationalityConfidence: json["nationality_confidence"],
    );
  }

  Map<String, dynamic> toJson() => {
        "checksum_final": checksumFinal,
        "checksum_final_validate": checksumFinalValidate,
        "country": country,
        "dob": dob,
        "dob_checksum": dobChecksum,
        "dob_checksum_validate": dobChecksumValidate,
        "document_number": documentNumber,
        "document_number_checksum": documentNumberChecksum,
        "document_number_checksum_validate": documentNumberChecksumValidate,
        "due_date": dueDate,
        "due_date_checksum": dueDateChecksum,
        "due_date_checksum_validate": dueDateChecksumValidate,
        "gender": gender,
        "given_name": givenName,
        "identification_sign": identificationSign,
        "identification_sign_box": identificationSignBox.map((x) => x).toList(),
        "identification_sign_confidence": identificationSignConfidence,
        "image": image,
        "issue_date": issueDate,
        "issue_date_box": issueDateBox.map((x) => x).toList(),
        "issue_date_confidence": issueDateConfidence,
        "issued_at": issuedAt,
        "issued_at_box": issuedAtBox.map((x) => x).toList(),
        "issued_at_confidence": issuedAtConfidence,
        "mrz_confidence": mrzConfidence,
        "nationality": nationality,
        "person_number": personNumber,
        "sur_name": surName,
        "address": address,
        "address_box": addressBox.map((x) => x).toList(),
        "address_confidence": addressConfidence,
        "address_district": addressDistrict,
        "address_district_code": addressDistrictCode,
        "address_town": addressTown,
        "address_town_code": addressTownCode,
        "address_ward": addressWard,
        "address_ward_code": addressWardCode,
        "dob_box": dobBox.map((x) => x).toList(),
        "dob_confidence": dobConfidence,
        "due_date_box": dueDateBox.map((x) => x).toList(),
        "due_date_confidence": dueDateConfidence,
        "gender_box": genderBox.map((x) => x).toList(),
        "gender_confidence": genderConfidence,
        "hometown": hometown,
        "hometown_box": hometownBox.map((x) => x).toList(),
        "hometown_confidence": hometownConfidence,
        "hometown_district": hometownDistrict,
        "hometown_district_code": hometownDistrictCode,
        "hometown_town": hometownTown,
        "hometown_town_code": hometownTownCode,
        "hometown_ward": hometownWard,
        "hometown_ward_code": hometownWardCode,
        "id": id,
        "id_box": idBox.map((x) => x).toList(),
        "id_confidence": idConfidence,
        "name": name,
        "name_box": nameBox.map((x) => x).toList(),
        "name_confidence": nameConfidence,
        "nationality_box": nationalityBox.map((x) => x).toList(),
        "nationality_confidence": nationalityConfidence,
      };
}
