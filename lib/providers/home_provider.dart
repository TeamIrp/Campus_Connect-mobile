// import 'package:flutter/material.dart';
// import '../models/home_model.dart';
// import '../service/api_services.dart';
// import '../utils/show_toast.dart';
//
// class HomeProvider with ChangeNotifier {
//   int _homeTabIndex = 0;
//   bool _isLoading = false;
//
// // Data fields
//   Home? _homeData;
//   String _tags = '';
//   String _name = '';
//   String _age = '';
//   String _distance = '';
//   String _imagePath = '';
//   int _verification = 0;
//   String _aboutUser = '';
//
// // Getters
//   int get homeTabIndex => _homeTabIndex;
//
//   bool get isLoading => _isLoading;
//
//   Home? get homeData => _homeData;
//
//   String get tags => _tags;
//
//   String get name => _name;
//
//   String get age => _age;
//
//   String get distance => _distance;
//
//   String get imagePath => _imagePath;
//
//   int get verification => _verification;
//
//   String get aboutUser => _aboutUser;
//
// // Setters
//   void setTags(String value) {
//     _tags = value;
//     notifyListeners();
//   }
//
//   void setName(String value) {
//     _name = value;
//     notifyListeners();
//   }
//
//   void setAge(String value) {
//     _age = value;
//     notifyListeners();
//   }
//
//   void setDistance(String value) {
//     _distance = value;
//     notifyListeners();
//   }
//
//   void setImagePath(String value) {
//     _imagePath = value;
//     notifyListeners();
//   }
//
//   void setVerification(int value) {
//     _verification = value;
//     notifyListeners();
//   }
//
//   void setAboutUser(String value) {
//     _aboutUser = value;
//     notifyListeners();
//   }
//
// // API Call: Fetch and assign data
//   Future<void> getHome(
//       BuildContext context, String userId, String token) async {
//     _isLoading = true;
//     notifyListeners();
//     try {
//       final response = await ApiService.getHome(context, userId, token);
//       _homeData = response as Home?;
//       if (homeData?.statusCode == 200 && homeData?.status == true) {
//         ShowToast.showToastSuccess(_homeData!.message.toString());
//
//         if (homeData?.data != null && homeData!.data!.isNotEmpty) {
//           final Datum user = _homeData!.data!.first;
//
//           setTags(user.subscriptionType?.toLowerCase() ?? '');
//           setName(
//             '${user.firstName ?? ''} ${user.lastName ?? ''}'.trim(),
//           );
//           setAge(user.age?.toString() ?? '');
//           setDistance(user.distance?.toStringAsFixed(2) ?? '');
//           setImagePath(
//             (user.profilePicture is List &&
//                     (user.profilePicture as List).isNotEmpty)
//                 ? (user.profilePicture as List).first['picture'] as String
//                 : '',
//           );
//           setVerification(
//             (user.verification != null && user.verification != 0) ? 1 : 0,
//           );
//           setAboutUser(user.aboutcustomer ?? '');
//         }
//       } else if (homeData?.statusCode == 400 && homeData?.status == false) {
//         ShowToast.showToastError(_homeData!.message.toString());
//       } else {
//         ShowToast.showToastError(_homeData?.errorMsg.toString() ?? 'Error');
//       }
//     } catch (e) {
//       ShowToast.showToastError(e.toString());
//     } finally {
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
//   String _city = 'Paris';
//
//   String get city => _city;
//
//   set city(String value) {
//     if (value != _city) {
//       _city = value;
//       notifyListeners();
//     }
//   }
//
//   String _searchQuery = '';
//
//   String get searchQuery => _searchQuery;
//
//   void setSearchQuery(String value) {
//     if (value != _searchQuery) {
//       _searchQuery = value;
//       notifyListeners();
//     }
//   }
// }



import 'package:flutter/material.dart';
import '../models/home_model.dart';
import '../service/api_services.dart';
import '../utils/show_toast.dart';

class HomeProvider with ChangeNotifier {
  int _homeTabIndex = 0;
  bool _isLoading = false;

  Home? _homeData;
  Home? get homeData => _homeData;
  bool get isLoading => _isLoading;
  int get homeTabIndex => _homeTabIndex;

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
        ShowToast.showToastError( _homeData?.errorMsg.toString() ?? 'Error');
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
}

