import 'dart:convert';

class MyProfile {
  final bool? status;
  final int? statusCode;
  final String? message;
  final String? errorMsg;
  final bool? isError;

  MyProfile({
    this.status,
    this.statusCode,
    this.message,
    this.errorMsg,
    this.isError
  });

  factory MyProfile.fromRawJson(String str) => MyProfile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyProfile.fromJson(Map<String, dynamic> json) => MyProfile(
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
