import 'package:flutter/material.dart';
import '../models/forgetPassword_model.dart';

import '../service/api_services.dart';
import '../utils/show_toast.dart';

class ForgotPasswordProvider with ChangeNotifier {
  ForgotPassword? _forgotPassword;
  bool _isLoading = false;

  ForgotPassword? get forgotPassword => _forgotPassword;
  bool get isLoading => _isLoading;

  Future<void> requestForgotPassword(BuildContext context, String email) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await ApiService.getForgotPassword(context, email.trim());
      _forgotPassword = response;

      if (_forgotPassword?.statusCode == 200 && _forgotPassword?.status == true) {
        ShowToast.showToastSuccess(_forgotPassword!.message.toString());
      } else {
        ShowToast.showToastError(_forgotPassword?.errorMsg ?? 'Something went wrong');
      }
    } catch (e) {
      ShowToast.showToastError('An error occurred: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
