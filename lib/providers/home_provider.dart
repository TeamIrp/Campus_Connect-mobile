import 'package:flutter/material.dart';

import '../models/home_model.dart';
import '../service/api_services.dart';
import '../utils/show_toast.dart';

class HomeProvider with ChangeNotifier {
  int _homeTabIndex = 0;
  int get homeTabIndex => _homeTabIndex;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Home? _homeData;
  Home? get homeData => _homeData;

  Future<void> getHome(
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
    String deviceToken,
  ) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await ApiService.getHome(
        context,
        id,
        profilePicture,
        otherImages,
        firstName,
        lastName,
        mobileNumber,
        gender,
        dateofbirth,
        relationship,
        relationshipsought,
        intendedOccuption,
        academicfield,
        levelofstudies,
        universityorschoolattended,
        currentacadmicproject,
        professionalgoals,
        selectedCustomerStatus,
        username,
        city,
        region,
        religion,
        community,
        subcommunity,
        astrological,
        interests,
        height,
        anyDisability,
        complexion,
        bodytype,
        diet,
        drink,
        smoker,
        gendersought,
        age,
        maximumDistance,
        personality,
        size,
        weight,
        onlymatch,
        newinteraction,
        like,
        massage,
        latitude,
        longitude,
        verification,
        aboutcustomer,
        discription,
        universitycourse,
        registered,
        createdAt,
        updatedAt,
        distance,
        deviceToken,
      );

      _homeData = response;

      if (response.statusCode == 200 && response.status == true) {
        ShowToast.showToastSuccess(response.message ?? "Home data fetched.");
      } else if (response.statusCode == 400 && response.status == false) {
        ShowToast.showToastError(response.message ?? "Home request failed.");
      } else {
        ShowToast.showToastError(response.errorMsg ?? "Unknown home error.");
      }
    } catch (e) {
      ShowToast.showToastError("Exception: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void setHomeTabIndex(int idx) {
    if (idx != _homeTabIndex) {
      _homeTabIndex = idx;
      notifyListeners();
    }
  }

  // city name for the header
  String _city = 'Paris';
  String get city => _city;

  set city(String v) {
    if (v != _city) {
      _city = v;
      notifyListeners();
    }
  }

  // search query
  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  void setSearchQuery(String v) {
    if (v != _searchQuery) {
      _searchQuery = v;
      notifyListeners();
    }
  }

  final List<Map<String, dynamic>> users = [
    {
      'tag': 'premium',
      'name': 'Elise Öztürk',
      'age': '28',
      'distance': '1.5 km'
    },
    {'tag': 'gold', 'name': 'James Smith', 'age': '32', 'distance': '2.8 km'},
    {'tag': 'premium', 'name': 'Anna Lee', 'age': '26', 'distance': '0.8 km'},
    {'tag': 'gold', 'name': 'Robert Brown', 'age': '35', 'distance': '3.0 km'},
    {
      'tag': 'premium',
      'name': 'Linda Johnson',
      'age': '29',
      'distance': '1.9 km'
    },
    {'tag': 'gold', 'name': 'David Wilson', 'age': '31', 'distance': '2.5 km'},
  ];

  final List<String> imagePaths = [
    'assets/images/sample_image1.png',
    'assets/images/sample_image2.png',
    'assets/images/sample_image3.png',
    'assets/images/like.png',
    'assets/images/like_by_me1.png',
    'assets/images/like_by_me2.png',
  ];
}
