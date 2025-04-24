import 'dart:convert';

class Registration {
  final bool? status;
  final int? statusCode;
  final String? message;
  final String? errorMsg;
  final bool? isError;

  Registration({
    this.status,
    this.statusCode,
    this.message,
    this.errorMsg,
    this.isError
  });

  factory Registration.fromRawJson(String str) => Registration.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Registration.fromJson(Map<String, dynamic> json) => Registration(
    status: json["status"],
    statusCode: json["status_Code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "status_Code": statusCode,
    "message": message,
  };
}
