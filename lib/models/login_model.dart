// import 'dart:convert';
//
// class Login {
//         final bool? status;
//         final int? statusCode;
//         final String? message;
//         final Data? data;
//         final String? errorMsg;
//         final bool? isError;
//
//   Login(
//       {
//         this.status,
//         this.statusCode,
//         this.message,
//         this.data,
//         this.errorMsg,
//         this.isError
//       });
//
//   factory Login.fromRawJson(String str) => Login.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory Login.fromJson(Map<String, dynamic> json) => Login(
//         status: json["status"],
//         statusCode: json["status_Code"],
//         message: json["message"],
//         data: json["data"] == null ? null : Data.fromJson(json["data"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "status_Code": statusCode,
//         "message": message,
//         "data": data?.toJson(),
//       };
// }
//
// class Data {
//   final int? userId;
//   final dynamic name;
//   final String? email;
//   final String? token;
//
//   Data({
//     this.userId,
//     this.name,
//     this.email,
//     this.token,
//   });
//
//   factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         userId: json["user_id"],
//         name: json["name"],
//         email: json["email"],
//         token: json["token"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "user_id": userId,
//         "name": name,
//         "email": email,
//         "token": token,
//       };
// }







import 'dart:convert';

class Login {
  final bool? status;
  final int? statusCode;
  final String? message;
  final Data? data;
  final String? errorMsg;
  final bool? isError;

  Login({
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
  final UserDetails? userDetails;
  final String? token;

  Data({
    this.userDetails,
    this.token,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userDetails: json["user_details"] == null ? null : UserDetails.fromJson(json["user_details"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user_details": userDetails?.toJson(),
    "token": token,
  };
}

class UserDetails {
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
  final String? selectedCustomerStatus;
  final String? username;
  final dynamic city;
  final dynamic region;
  final dynamic religion;
  final dynamic community;
  final dynamic subcommunity;
  final dynamic astrological;
  final dynamic interests;
  final dynamic height;
  final dynamic anyDisability;
  final dynamic complexion;
  final dynamic bodytype;
  final dynamic diet;
  final dynamic drink;
  final dynamic smoker;
  final dynamic gendersought;
  final dynamic age;
  final dynamic maximumDistance;
  final dynamic personality;
  final dynamic size;
  final dynamic weight;
  final dynamic onlymatch;
  final dynamic newinteraction;
  final dynamic like;
  final dynamic massage;
  final dynamic latitude;
  final dynamic longitude;
  final dynamic verification;
  final dynamic aboutcustomer;
  final dynamic discription;
  final dynamic universitycourse;
  final dynamic registered;
  final String? password;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UserDetails({
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
  });

  factory UserDetails.fromRawJson(String str) => UserDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
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
    longitude: json["Longitude"],
    verification: json["verification"],
    aboutcustomer: json["aboutcustomer"],
    discription: json["discription"],
    universitycourse: json["universitycourse"],
    registered: json["registered"],
    password: json["password"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
    "Longitude": longitude,
    "verification": verification,
    "aboutcustomer": aboutcustomer,
    "discription": discription,
    "universitycourse": universitycourse,
    "registered": registered,
    "password": password,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
