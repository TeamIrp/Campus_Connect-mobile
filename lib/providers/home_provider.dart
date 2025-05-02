// import 'package:flutter/material.dart';
// import '../models/home_model.dart';
// import '../service/api_services.dart';
// import '../utils/show_toast.dart';
//
// class HomeProvider with ChangeNotifier {
//   int _homeTabIndex = 0;
//   int get homeTabIndex => _homeTabIndex;
//
//   bool _isLoading = false;
//   bool get isLoading => _isLoading;
//
//   Home? _homeData;
//   Home? get homeData => _homeData;
//
//
//   Future<void> getHome(BuildContext context, String userId, String token) async{
//     _isLoading = true;
//     notifyListeners();
//     try{
//       _homeData = await ApiService.getHome(context, userId, token);
//       if (_homeData?.statusCode == 200 && _homeData?.status == true){
//         ShowToast.showToastSuccess(_homeData!.message.toString());
//         notifyListeners();
//       }else if(_homeData?.statusCode == 400 && _homeData?.status == false){
//         ShowToast.showToastError(_homeData!.message.toString());
//         notifyListeners();
//       }else{
//         ShowToast.showToastError(_homeData!.errorMsg.toString());
//       }
//     }catch(e){
//       ShowToast.showToastError(e.toString());
//     }finally{
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
//
//   void setHomeTabIndex(int idx) {
//     if (idx != _homeTabIndex) {
//       _homeTabIndex = idx;
//       notifyListeners();
//     }
//   }
//
//   // city name for the header
//   String _city = 'Paris';
//   String get city => _city;
//
//   set city(String v) {
//     if (v != _city) {
//       _city = v;
//       notifyListeners();
//     }
//   }
//
//   String _searchQuery = '';
//   String get searchQuery => _searchQuery;
//
//   void setSearchQuery(String v) {
//     if (v != _searchQuery) {
//       _searchQuery = v;
//       notifyListeners();
//     }
//   }
//
//   final List<Map<String, dynamic>> users = [
//     {
//       'tag': 'premium',
//       'name': 'Elise Öztürk',
//       'age': '28',
//       'distance': '1.5 km'
//     },
//     {'tag': 'gold', 'name': 'James Smith', 'age': '32', 'distance': '2.8 km'},
//     {'tag': 'premium', 'name': 'Anna Lee', 'age': '26', 'distance': '0.8 km'},
//     {'tag': 'gold', 'name': 'Robert Brown', 'age': '35', 'distance': '3.0 km'},
//     {
//       'tag': 'premium',
//       'name': 'Linda Johnson',
//       'age': '29',
//       'distance': '1.9 km'
//     },
//     {'tag': 'gold', 'name': 'David Wilson', 'age': '31', 'distance': '2.5 km'},
//   ];
//
//   final List<String> imagePaths = [
//     'assets/images/sample_image1.png',
//     'assets/images/sample_image2.png',
//     'assets/images/sample_image3.png',
//     'assets/images/like.png',
//     'assets/images/like_by_me1.png',
//     'assets/images/like_by_me2.png',
//   ];
// }
//




// -------------------------------------------------------------------------------------------------------------------------------




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

  String _tags = '';
  String _name = '';
  String _age = '';
  String _distance = '';
  String _imagePath = '';
  int _verification = 0;
  String _aboutUser = '';

  String get tags => _tags;
  String get name => _name;
  String get age => _age;
  String get distance => _distance;
  String get imagePath => _imagePath;
  int get verification => _verification;
  String get aboutUser => _aboutUser;

  void setTags(String value) {
    _tags = value;
    notifyListeners();
  }

  void setName(String value) {
    _name = value;
    notifyListeners();
  }

  void setAge(String value) {
    _age = value;
    notifyListeners();
  }

  void setDistance(String value) {
    _distance = value;
    notifyListeners();
  }

  void setImagePath(String value) {
    _imagePath = value;
    notifyListeners();
  }

  void setVerification(int value) {
    _verification = value;
    notifyListeners();
  }

  void setAboutUser(String value) {
    _aboutUser = value;
    notifyListeners();
  }

  Future<void> getHome(BuildContext context, String userId, String token) async {
    _isLoading = true;
    notifyListeners();
    try {
      _homeData = await ApiService.getHome(context, userId, token);
      if (_homeData?.statusCode == 200 && _homeData?.status == true) {
        ShowToast.showToastSuccess(_homeData!.message.toString());
      } else if (_homeData?.statusCode == 400 && _homeData?.status == false) {
        ShowToast.showToastError(_homeData!.message.toString());
      } else {
        ShowToast.showToastError(_homeData!.errorMsg.toString());
      }
    } catch (e) {
      ShowToast.showToastError(e.toString());
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

  String _city = 'Paris';
  String get city => _city;

  set city(String v) {
    if (v != _city) {
      _city = v;
      notifyListeners();
    }
  }

  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  void setSearchQuery(String v) {
    if (v != _searchQuery) {
      _searchQuery = v;
      notifyListeners();
    }
  }
}
