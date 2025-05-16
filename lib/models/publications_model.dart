import 'dart:convert';

class PublicationsList {
  final bool? status;
  final int? statusCode;
  final String? message;
  final List<PublicationsDatum>? data;
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

  factory PublicationsList.fromRawJson(String str) =>
      PublicationsList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PublicationsList.fromJson(Map<String, dynamic> json) =>
      PublicationsList(
        status: json["status"],
        statusCode: json["status_Code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<PublicationsDatum>.from(
                json["data"]!.map((x) => PublicationsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "status_Code": statusCode,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class PublicationsDatum {
  final int? id;
  final String? publicationTitle;
  final DateTime? publicationDate;
  final PublicationCategory? publicationCategory;
  final String? publicationDescription;
  final String? locationName;
  final String? latitude;
  final String? longitude;
  final int? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Publicationimage? publicationimage;

  PublicationsDatum({
    this.id,
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
    this.publicationimage,
  });

  factory PublicationsDatum.fromRawJson(String str) =>
      PublicationsDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PublicationsDatum.fromJson(Map<String, dynamic> json) =>
      PublicationsDatum(
        id: json["id"],
        publicationTitle: json["publication_title"],
        publicationDate: json["publication_date"] == null
            ? null
            : DateTime.parse(json["publication_date"]),
        publicationCategory:
            publicationCategoryValues.map[json["publication_category"]]!,
        publicationDescription: json["publication_description"],
        locationName: json["location_name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        isActive: json["isActive"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        publicationimage: publicationimageValues.map[json["publicationimage"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "publication_title": publicationTitle,
        "publication_date":
            "${publicationDate!.year.toString().padLeft(4, '0')}-${publicationDate!.month.toString().padLeft(2, '0')}-${publicationDate!.day.toString().padLeft(2, '0')}",
        "publication_category":
            publicationCategoryValues.reverse[publicationCategory],
        "publication_description": publicationDescription,
        "location_name": locationName,
        "latitude": latitude,
        "longitude": longitude,
        "isActive": isActive,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "publicationimage": publicationimageValues.reverse[publicationimage],
      };
}

enum PublicationCategory { EVENTS, NEWS }

final publicationCategoryValues = EnumValues(
    {"Events": PublicationCategory.EVENTS, "News": PublicationCategory.NEWS});

enum Publicationimage { UPLOADS_USERS_USER_681_B5_DBC1_A18_F_JPG }

final publicationimageValues = EnumValues({"uploads/users/user_681b5dbc1a18f.jpg" : Publicationimage.UPLOADS_USERS_USER_681_B5_DBC1_A18_F_JPG
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
