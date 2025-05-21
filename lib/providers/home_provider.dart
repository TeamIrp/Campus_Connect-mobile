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