import 'package:campus_connect/models/subscription_model.dart';
import 'package:flutter/material.dart';
import '../service/api_services.dart';
import '../utils/show_toast.dart';

class HomeProvider with ChangeNotifier {
  bool _isLoading = false;

  Subscription? _subscription;
  Subscription? get subscription => _subscription;
  bool get isLoading => _isLoading;

  Future<void> getSubscription(BuildContext context,String token) async {
    _isLoading = true;
    notifyListeners();

    try {
      _subscription = await ApiService.getSubscription(context, token);

      if (_subscription?.statusCode == 200 && _subscription?.status == true) {
        ShowToast.showToastSuccess(_subscription!.message.toString());
      } else if (_subscription?.statusCode == 400 && _subscription?.status == false) {
        ShowToast.showToastError(_subscription!.message.toString());
      } else {
        ShowToast.showToastError( _subscription?.errorMsg.toString() ?? 'Error');
      }
    } catch (e) {
      ShowToast.showToastError(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}