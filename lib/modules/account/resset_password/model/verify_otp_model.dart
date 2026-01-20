class VerifyOtpModel {
  VerifyOtpModel({
    required this.resetToken,
  });

  final String? resetToken;

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json){
    return VerifyOtpModel(
      resetToken: json["resetToken"],
    );
  }

  Map<String, dynamic> toJson() => {
    "resetToken": resetToken,
  };

}
