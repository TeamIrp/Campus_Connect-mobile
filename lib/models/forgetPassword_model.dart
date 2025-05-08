import 'dart:convert';

class ForgotPassword {
  final bool? status;
  final int? statusCode;
  final String? message;
  final Res? res;
  final String? errorMsg;
  final bool? isError;

  ForgotPassword({
    this.status,
    this.statusCode,
    this.message,
    this.res,
    this.errorMsg,
    this.isError,
  });

  factory ForgotPassword.fromRawJson(String str) =>
      ForgotPassword.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ForgotPassword.fromJson(Map<String, dynamic> json) => ForgotPassword(
        status: json["status"],
        statusCode: json["status_code"],
        message: json["message"],
        res: json["res"] == null ? null : Res.fromJson(json["res"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "status_code": statusCode,
        "message": message,
        "res": res?.toJson(),
      };
}

class Res {
  final String? email;

  Res({
    this.email,
  });

  factory Res.fromRawJson(String str) => Res.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Res.fromJson(Map<String, dynamic> json) => Res(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
