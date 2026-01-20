class LogErrorModel {
  LogErrorModel({
    required this.userName,
    required this.platform,
    required this.name,
    required this.time,
    required this.version,
    required this.versionApp,
    required this.error,
    required this.statusError,
    required this.path,
    required this.type,
    required this.method,
    required this.request,
    required this.queryParameters,
    required this.header,
    required this.statusMessage,
    required this.messageLocal,
    required this.device,
    required this.currentRoute,
  });

  final String userName;
  final String platform;
  final String name;
  final DateTime time;
  final String? version;
  final String versionApp;
  final String error;
  final String statusError;
  final String path;
  final String type;
  final String method;
  final String request;
  final String queryParameters;
  final String header;
  final String statusMessage;
  final String messageLocal;
  final String? device;
  final String currentRoute;

  factory LogErrorModel.fromJson(Map<String, dynamic> json) {
    return LogErrorModel(
      userName: json["userName"] ?? "",
      platform: json["platform"] ?? "",
      name: json["name"] ?? "",
      time: DateTime.tryParse((json["time"])) ?? DateTime.now(),
      version: json["version"] ?? "",
      versionApp: json["versionApp"] ?? "",
      error: json["error"] ?? "",
      statusError: json["statusError"] ?? "",
      path: json["path"] ?? "",
      type: json["type"] ?? "",
      method: json["method"] ?? "",
      request: json["request"] ?? "",
      queryParameters: json["queryParameters"] ?? "",
      header: json["header"] ?? "",
      statusMessage: json["statusMessage"] ?? "",
      messageLocal: json["messageLocal"] ?? "",
      device: json["device"] ?? "",
      currentRoute: json["currentRoute"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "platform": platform,
        "name": name,
        "time": time.toIso8601String(),
        "version": version,
        "versionApp": versionApp,
        "error": error,
        "statusError": statusError,
        "path": path,
        "type": type,
        "method": method,
        "request": request,
        "queryParameters": queryParameters,
        "header": header,
        "statusMessage": statusMessage,
        "messageLocal": messageLocal,
        "device": device,
        "currentRoute": currentRoute,
      };
}
