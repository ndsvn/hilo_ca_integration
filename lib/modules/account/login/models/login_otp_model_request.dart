class LoginOtpModelRequest {
  String otpId;
  String otp;

  LoginOtpModelRequest({
    required this.otp,
    required this.otpId,
  });

  Map<String, dynamic> toJson() => {
        "otpId": otpId,
        "otp": otp,
      };
}
