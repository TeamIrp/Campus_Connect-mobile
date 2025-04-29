import 'dart:convert';

class Home {
  final bool? status;
  final int? statusCode;
  final String? message;
  final List<Datum>? data;
  final String? errorMsg;
  final bool? isError;

  Home({
    this.status,
    this.statusCode,
    this.message,
    this.data,
    this.errorMsg,
    this.isError
  });

  factory Home.fromRawJson(String str) => Home.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Home.fromJson(Map<String, dynamic> json) => Home(
    status: json["status"],
    statusCode: json["status_code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "status_code": statusCode,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final int? id;
  final String? profilePicture;
  final dynamic otherImages;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? mobileNumber;
  final String? gender;
  final String? dateofbirth;
  final String? relationship;
  final String? relationshipsought;
  final String? intendedOccuption;
  final String? academicfield;
  final String? levelofstudies;
  final String? universityorschoolattended;
  final String? currentacadmicproject;
  final String? professionalgoals;
  final dynamic selectedCustomerStatus;
  final String? username;
  final String? city;
  final String? region;
  final dynamic religion;
  final String? community;
  final String? subcommunity;
  final String? astrological;
  final String? interests;
  final String? height;
  final String? anyDisability;
  final String? complexion;
  final String? bodytype;
  final String? diet;
  final String? drink;
  final String? smoker;
  final String? gendersought;
  final String? age;
  final String? maximumDistance;
  final String? personality;
  final String? size;
  final String? weight;
  final String? onlymatch;
  final String? newinteraction;
  final String? like;
  final String? massage;
  final String? latitude;
  final String? longitude;
  final String? verification;
  final String? aboutcustomer;
  final String? discription;
  final String? universitycourse;
  final dynamic registered;
  final String? password;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final double? distance;

  Datum({
    this.id,
    this.profilePicture,
    this.otherImages,
    this.firstName,
    this.lastName,
    this.email,
    this.mobileNumber,
    this.gender,
    this.dateofbirth,
    this.relationship,
    this.relationshipsought,
    this.intendedOccuption,
    this.academicfield,
    this.levelofstudies,
    this.universityorschoolattended,
    this.currentacadmicproject,
    this.professionalgoals,
    this.selectedCustomerStatus,
    this.username,
    this.city,
    this.region,
    this.religion,
    this.community,
    this.subcommunity,
    this.astrological,
    this.interests,
    this.height,
    this.anyDisability,
    this.complexion,
    this.bodytype,
    this.diet,
    this.drink,
    this.smoker,
    this.gendersought,
    this.age,
    this.maximumDistance,
    this.personality,
    this.size,
    this.weight,
    this.onlymatch,
    this.newinteraction,
    this.like,
    this.massage,
    this.latitude,
    this.longitude,
    this.verification,
    this.aboutcustomer,
    this.discription,
    this.universitycourse,
    this.registered,
    this.password,
    this.createdAt,
    this.updatedAt,
    this.distance,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    profilePicture: json["profile_picture"],
    otherImages: json["other_images"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    mobileNumber: json["mobile_number"],
    gender: json["gender"],
    dateofbirth: json["dateofbirth"],
    relationship: json["relationship"],
    relationshipsought: json["relationshipsought"],
    intendedOccuption: json["intendedOccuption"],
    academicfield: json["academicfield"],
    levelofstudies: json["levelofstudies"],
    universityorschoolattended: json["universityorschoolattended"],
    currentacadmicproject: json["currentacadmicproject"],
    professionalgoals: json["professionalgoals"],
    selectedCustomerStatus: json["selectedCustomerStatus"],
    username: json["username"],
    city: json["city"],
    region: json["region"],
    religion: json["religion"],
    community: json["community"],
    subcommunity: json["subcommunity"],
    astrological: json["astrological"],
    interests: json["interests"],
    height: json["height"],
    anyDisability: json["anyDisability"],
    complexion: json["complexion"],
    bodytype: json["bodytype"],
    diet: json["diet"],
    drink: json["drink"],
    smoker: json["smoker"],
    gendersought: json["gendersought"],
    age: json["age"],
    maximumDistance: json["maximum_distance"],
    personality: json["personality"],
    size: json["size"],
    weight: json["weight"],
    onlymatch: json["onlymatch"],
    newinteraction: json["newinteraction"],
    like: json["like"],
    massage: json["massage"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    verification: json["verification"],
    aboutcustomer: json["aboutcustomer"],
    discription: json["discription"],
    universitycourse: json["universitycourse"],
    registered: json["registered"],
    password: json["password"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    distance: json["distance"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "profile_picture": profilePicture,
    "other_images": otherImages,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "mobile_number": mobileNumber,
    "gender": gender,
    "dateofbirth": dateofbirth,
    "relationship": relationship,
    "relationshipsought": relationshipsought,
    "intendedOccuption": intendedOccuption,
    "academicfield": academicfield,
    "levelofstudies": levelofstudies,
    "universityorschoolattended": universityorschoolattended,
    "currentacadmicproject": currentacadmicproject,
    "professionalgoals": professionalgoals,
    "selectedCustomerStatus": selectedCustomerStatus,
    "username": username,
    "city": city,
    "region": region,
    "religion": religion,
    "community": community,
    "subcommunity": subcommunity,
    "astrological": astrological,
    "interests": interests,
    "height": height,
    "anyDisability": anyDisability,
    "complexion": complexion,
    "bodytype": bodytype,
    "diet": diet,
    "drink": drink,
    "smoker": smoker,
    "gendersought": gendersought,
    "age": age,
    "maximum_distance": maximumDistance,
    "personality": personality,
    "size": size,
    "weight": weight,
    "onlymatch": onlymatch,
    "newinteraction": newinteraction,
    "like": like,
    "massage": massage,
    "latitude": latitude,
    "longitude": longitude,
    "verification": verification,
    "aboutcustomer": aboutcustomer,
    "discription": discription,
    "universitycourse": universitycourse,
    "registered": registered,
    "password": password,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "distance": distance,
  };
}
