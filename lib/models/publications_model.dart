import 'dart:convert';

PublicationsList publicationsListFromJson(String str) => PublicationsList.fromJson(json.decode(str));

String publicationsListToJson(PublicationsList data) => json.encode(data.toJson());

class PublicationsList {
  final bool? status;
  final int? statusCode;
  final String? message;
  final List<PublicationDatum>? data;
  final String? errorMsg;
  final bool? isError;

  PublicationsList({
    this.status,
    this.statusCode,
    this.message,
    this.data,
    this.errorMsg,
    this.isError,
  });

  factory PublicationsList.fromJson(Map<String, dynamic> json) => PublicationsList(
    status: json["status"],
    statusCode: json["status_Code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<PublicationDatum>.from(json["data"]!.map((x) => PublicationDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "status_Code": statusCode,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class PublicationDatum {
  final int? id;
  final String? publicationimage;
  final String? publicationTitle;
  final DateTime? publicationDate;
  final String? publicationCategory;
  final String? publicationDescription;
  final String? locationName;
  final String? latitude;
  final String? longitude;
  final int? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PublicationDatum({
    this.id,
    this.publicationimage,
    this.publicationTitle,
    this.publicationDate,
    this.publicationCategory,
    this.publicationDescription,
    this.locationName,
    this.latitude,
    this.longitude,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory PublicationDatum.fromJson(Map<String, dynamic> json) => PublicationDatum(
    id: json["id"],
    publicationimage: json["publicationimage"],
    publicationTitle: json["publication_title"],
    publicationDate: json["publication_date"] == null ? null : DateTime.parse(json["publication_date"]),
    publicationCategory: json["publication_category"],
    publicationDescription: json["publication_description"],
    locationName: json["location_name"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    isActive: json["isActive"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "publicationimage": publicationimage,
    "publication_title": publicationTitle,
    "publication_date": "${publicationDate!.year.toString().padLeft(4, '0')}-${publicationDate!.month.toString().padLeft(2, '0')}-${publicationDate!.day.toString().padLeft(2, '0')}",
    "publication_category": publicationCategory,
    "publication_description": publicationDescription,
    "location_name": locationName,
    "latitude": latitude,
    "longitude": longitude,
    "isActive": isActive,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
