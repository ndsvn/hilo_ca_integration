class VerifySDKResponse {
  final String signature;
  final String responseId;
  final int exitcode;
  final bool result;
  final String message;
  final int time;

  VerifySDKResponse({
    required this.signature,
    required this.responseId,
    required this.exitcode,
    required this.result,
    required this.message,
    required this.time,
  });

  factory VerifySDKResponse.fromJson(Map<String, dynamic> json) {
    return VerifySDKResponse(
      signature: json['signature'],
      responseId: json['responseId'],
      exitcode: json['exitcode'],
      result: json['result'],
      message: json['message'],
      time: json['time'],
    );
  }
}
