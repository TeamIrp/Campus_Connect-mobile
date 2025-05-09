import 'dart:convert';

class Subscription {
  final bool? status;
  final int? statusCode;
  final String? message;
  final Data? data;
  final String? errorMsg;
  final bool? isError;

  Subscription({
    this.status,
    this.statusCode,
    this.message,
    this.data,
    this.errorMsg,
    this.isError,
  });

  factory Subscription.fromRawJson(String str) => Subscription.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
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
  final List<Basic>? premium;
  final List<Basic>? basic;
  final List<Basic>? golden;

  Data({
    this.premium,
    this.basic,
    this.golden,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        premium: json["Premium"] == null
            ? []
            : List<Basic>.from(json["Premium"]!.map((x) => Basic.fromJson(x))),
        basic: json["Basic"] == null
            ? []
            : List<Basic>.from(json["Basic"]!.map((x) => Basic.fromJson(x))),
        golden: json["Golden"] == null
            ? []
            : List<Basic>.from(json["Golden"]!.map((x) => Basic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Premium": premium == null
            ? []
            : List<dynamic>.from(premium!.map((x) => x.toJson())),
        "Basic": basic == null
            ? []
            : List<dynamic>.from(basic!.map((x) => x.toJson())),
        "Golden": golden == null
            ? []
            : List<dynamic>.from(golden!.map((x) => x.toJson())),
      };
}

class Basic {
  final int? id;
  final String? subscriptionName;
  final String? subscriptionType;
  final String? price;
  final String? duration;
  final String? feature;
  final String? description;
  final int? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Basic({
    this.id,
    this.subscriptionName,
    this.subscriptionType,
    this.price,
    this.duration,
    this.feature,
    this.description,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory Basic.fromRawJson(String str) => Basic.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Basic.fromJson(Map<String, dynamic> json) => Basic(
        id: json["id"],
        subscriptionName: json["subscription_name"],
        subscriptionType: json["subscription_type"],
        price: json["price"],
        duration: json["duration"],
        feature: json["feature"],
        description: json["description"],
        isActive: json["isActive"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subscription_name": subscriptionName,
        "subscription_type": subscriptionType,
        "price": price,
        "duration": duration,
        "feature": feature,
        "description": description,
        "isActive": isActive,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
