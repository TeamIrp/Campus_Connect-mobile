import 'dart:convert';

class Login {
        final bool? status;
        final int? statusCode;
        final String? message;
        final Data? data;
        final String? errorMsg;
        final bool? isError;

  Login(
      {
        this.status,
        this.statusCode,
        this.message,
        this.data,
        this.errorMsg,
        this.isError
      });

  factory Login.fromRawJson(String str) => Login.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json["status"],
        statusCode: json["status_Code"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "status_Code": statusCode,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final int? userId;
  final dynamic name;
  final String? email;
  final String? token;

  Data({
    this.userId,
    this.name,
    this.email,
    this.token,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "email": email,
        "token": token,
      };
}
