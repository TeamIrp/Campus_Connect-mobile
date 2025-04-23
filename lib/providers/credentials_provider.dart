import 'package:flutter/material.dart';

class CredentialsProvider extends ChangeNotifier {
  String _password = '';
  String _confirmPassword = '';

  String get password => _password;

  String get confirmPassword => _confirmPassword;

  void updatePassword(String value) {
    _password = value;
    notifyListeners();
  }

  void updateConfirmPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }

  bool get isPasswordMatch =>
      _password.isNotEmpty &&
      _confirmPassword.isNotEmpty &&
      _password == _confirmPassword;
}
