class FirebaseDbConfigModel {
  FirebaseDbConfigModel({
    required this.phoneSupportApp,
    required this.zaloLink,
    required this.fbLink,
    required this.errorNote,
    required this.isShowErrorNote,
    required this.updateNoteImportant,
    required this.isUpdateNoteImportant,
    required this.minAndroidVersion,
    required this.minIosVersion,
  });

  final String phoneSupportApp;
  final String zaloLink;
  final String fbLink;
  final String errorNote;
  final bool isShowErrorNote;
  final String updateNoteImportant;
  final bool isUpdateNoteImportant;
  final String minAndroidVersion;
  final String minIosVersion;

  factory FirebaseDbConfigModel.fromJson(Map<String, dynamic> json) {
    return FirebaseDbConfigModel(
      phoneSupportApp: json["phoneSupportApp"] ?? "",
      zaloLink: json["zaloLink"] ?? "",
      fbLink: json["fbLink"] ?? "",
      errorNote: json["errorNote"] ?? "",
      isShowErrorNote: json["isShowErrorNote"] ?? false,
      updateNoteImportant: json["updateNoteImportant"] ?? "",
      isUpdateNoteImportant: json["isUpdateNoteImportant"] ?? false,
      minAndroidVersion: json["minAndroidVersion"] ?? "",
      minIosVersion: json["minIosVersion"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "phoneSupportApp": phoneSupportApp,
        "zaloLink": zaloLink,
        "fbLink": fbLink,
        "errorNote": errorNote,
        "isShowErrorNote": isShowErrorNote,
        "updateNoteImportant": updateNoteImportant,
        "isUpdateNoteImportant": isUpdateNoteImportant,
        "minAndroidVersion": minAndroidVersion,
        "minIosVersion": minIosVersion,
      };
}
