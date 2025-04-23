import 'package:flutter/material.dart';

class AcademicProjectProvider with ChangeNotifier {
  String _projectText = '';

  String get projectText => _projectText;

  void setProjectText(String text) {
    _projectText = text;
    notifyListeners();
  }

  bool get isValid => _projectText.trim().isNotEmpty;
}
