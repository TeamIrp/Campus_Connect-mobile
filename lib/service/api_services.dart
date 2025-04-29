import 'dart:io';

import 'package:campus_connect/models/home_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/login_model.dart';
import '../models/registration_model.dart';
import 'contant_url.dart';
import 'dio_service.dart';

class ApiService {
  ApiService._internal();

  static final _apiService = ApiService._internal();

  factory ApiService() => _apiService;

  static Future<Registration> getRegister(
    BuildContext context,
    String firstname,
    String lastname,
    String username,
    String emailAddress,
    String mobileNo,
    String password,
    String gender,
    String dob,
    String relationshipStatus,
    String typeOfRelationship,
    String currentIntendedOccupation,
    String academicField,
    String professionalGoalsProjects,
    String passwordConfirmation,
    String levelOfStudies,
    String universitySchool,
    File image,
    String latitude,
    String longitude,
  ) async {
    late Registration registration;
    Dio dio = Dio();
    FormData data = FormData.fromMap({
      "firstname": firstname,
      "lastname": lastname,
      "username": username,
      "email": emailAddress,
      "mobile_number": mobileNo,
      "password": password,
      "gender": gender,
      "date_of_birth": dob,
      "relationship_status": relationshipStatus,
      "type_of_relationship": typeOfRelationship,
      "current_intended_occupation": currentIntendedOccupation,
      "academic_field": academicField,
      "professional_goals_projects": professionalGoalsProjects,
      "password_confirmation": passwordConfirmation,
      "level_of_studies": levelOfStudies,
      "university_school": universitySchool,
      "img": await MultipartFile.fromFile(image.path),
      "latitude": latitude,
      "longitude": longitude,
    });

    try {
      final response = await DioService().dio.post(
            ConstantUrl.register,
            data: data,
            options: Options(
              headers: {},
            ),
          );

      if (response.statusCode == 200) {
        registration = Registration.fromJson(response.data);
        return registration;
      } else {
        return Registration(
          errorMsg: 'Api failed with status code : ${response.statusCode}',
          isError: true,
        );
      }
    } on DioException catch (e) {
      String errorMessage;
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          errorMessage = "Connection timeout";
          break;
        case DioExceptionType.sendTimeout:
          errorMessage = "Something went wrong";
          break;
        case DioExceptionType.receiveTimeout:
          errorMessage = "Something went wrong";
          break;
        case DioExceptionType.badCertificate:
          errorMessage = "Something went wrong";
          break;
        case DioExceptionType.badResponse:
          errorMessage = "Too many requests retrying...";
          await _retryRequestWithDelay(dio, e.requestOptions, retryAfter: 5);
          break;
        case DioExceptionType.cancel:
          errorMessage = "Something went wrong";
          break;
        case DioExceptionType.connectionError:
          errorMessage = "No internet connection";
          break;
        case DioExceptionType.unknown:
          errorMessage = "No internet connection";
          break;
        default:
          errorMessage = "Something went wrong";
          break;
      }
      return Registration(errorMsg: errorMessage, isError: true);
    } catch (e) {
      return Registration(errorMsg: 'An error occurred $e', isError: true);
    }
  }

  static Future<Login> getLogin(
      BuildContext context, String email, String password) async {
    late Login login;
    Dio dio = Dio();

    try {
      final response = await DioService().dio.post(
            ConstantUrl.login,
            data: {
              "email": email,
              "password": password,
              // "device_token": deviceToken,
            },
            options: Options(
              headers: {
                // 'Authorization': 'Bearer $token',
                // 'Content-Type': 'application/json',
              },
            ),
          );

      if (response.statusCode == 200) {
        login = Login.fromJson(response.data);
        if (login.statusCode == 201 && login.status == false) {
          return Login(
            errorMsg: login.message,
            isError: true,
          );
        }
        return login;
      } else {
        return Login(
          errorMsg: 'API failed with status code: ${response.statusCode}',
          isError: true,
        );
      }
    } on DioException catch (e) {
      String errorMessage;
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          errorMessage = 'Connection timed out.';
          break;
        case DioExceptionType.sendTimeout:
          errorMessage = 'Request sending timed out.';
          break;
        case DioExceptionType.receiveTimeout:
          errorMessage = 'Response timed out.';
          break;
        case DioExceptionType.badCertificate:
          errorMessage = 'Bad certificate from server.';
          break;
        case DioExceptionType.badResponse:
          errorMessage = 'Received invalid response.';
          await _retryRequestWithDelay(dio, e.requestOptions, retryAfter: 5);
          break;
        case DioExceptionType.cancel:
          errorMessage = 'Request was cancelled.';
          break;
        case DioExceptionType.connectionError:
          errorMessage = 'No internet connection.';
          break;
        case DioExceptionType.unknown:
          errorMessage = 'Unknown error occurred.';
          break;
        default:
          errorMessage = 'Something went wrong.';
          break;
      }
      return Login(
        errorMsg: errorMessage,
        isError: true,
      );
    } catch (e) {
      return Login(
        errorMsg: 'An unexpected error occurred: $e',
        isError: true,
      );
    }
  }


  static Future<Home> getHome(
      BuildContext context,
      int id,
      String profilePicture,
      dynamic otherImages,
      String firstName,
      String lastName,
      String mobileNumber,
      String gender,
      String dateofbirth,
      String relationship,
      String relationshipsought,
      String intendedOccuption,
      String academicfield,
      String levelofstudies,
      String universityorschoolattended,
      String currentacadmicproject,
      String professionalgoals,
      dynamic selectedCustomerStatus,
      String username,
      String city,
      String region,
      dynamic religion,
      String community,
      String subcommunity,
      String astrological,
      String interests,
      String height,
      String anyDisability,
      String complexion,
      String bodytype,
      String diet,
      String drink,
      String smoker,
      String gendersought,
      String age,
      String maximumDistance,
      String personality,
      String size,
      String weight,
      String onlymatch,
      String newinteraction,
      String like,
      String massage,
      String latitude,
      String longitude,
      String verification,
      String aboutcustomer,
      String discription,
      String universitycourse,
      dynamic registered,
      DateTime createdAt,
      DateTime updatedAt,
      double distance,
      String deviceToken) async {
    late Home home;
    Dio dio = Dio();

    try {
      final response = await DioService().dio.post(
            ConstantUrl.home,
            data: {
              "id": id,
              "profile_picture": profilePicture,
              "other_images": otherImages,
              "first_name": firstName,
              "last_name": lastName,
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
              "created_at": createdAt?.toIso8601String(),
              "updated_at": updatedAt?.toIso8601String(),
              "distance": distance,
              "device_token": deviceToken,
            },
            options: Options(
              headers: {
                // 'Authorization': 'Bearer $token',
                // 'Content-Type': 'application/json',
              },
            ),
          );

      if (response.statusCode == 200) {
        home = Home.fromJson(response.data);
        if (home.statusCode == 201 && home.status == false) {
          return Home(
            errorMsg: home.message,
            isError: true,
          );
        }
        return home;
      } else {
        return Home(
          errorMsg: 'API failed with status code: ${response.statusCode}',
          isError: true,
        );
      }
    } on DioException catch (e) {
      String errorMessage;
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          errorMessage = 'Connection timed out.';
          break;
        case DioExceptionType.sendTimeout:
          errorMessage = 'Request sending timed out.';
          break;
        case DioExceptionType.receiveTimeout:
          errorMessage = 'Response timed out.';
          break;
        case DioExceptionType.badCertificate:
          errorMessage = 'Bad certificate from server.';
          break;
        case DioExceptionType.badResponse:
          errorMessage = 'Received invalid response.';
          await _retryRequestWithDelay(dio, e.requestOptions, retryAfter: 5);
          break;
        case DioExceptionType.cancel:
          errorMessage = 'Request was cancelled.';
          break;
        case DioExceptionType.connectionError:
          errorMessage = 'No internet connection.';
          break;
        case DioExceptionType.unknown:
          errorMessage = 'Unknown error occurred.';
          break;
        default:
          errorMessage = 'Something went wrong.';
          break;
      }
      return Home(
        errorMsg: errorMessage,
        isError: true,
      );
    } catch (e) {
      return Home(
        errorMsg: 'An unexpected error occurred: $e',
        isError: true,
      );
    }
  }



  static Future<void> _retryRequestWithDelay(
    Dio dio,
    RequestOptions requestOptions, {
    int retryAfter = 5,
  }) async {
    await Future.delayed(Duration(seconds: retryAfter)); // Delay before retry
    try {
      Response retryResponse = await dio.request(
        requestOptions.path,
        options: Options(
          method: requestOptions.method,
          headers: requestOptions.headers,
        ),
      );
      // Handle successful retry
      print(retryResponse.data);
    } catch (retryError) {
      // Handle retry failure
      print("Retry failed: $retryError");
    }
  }
}
