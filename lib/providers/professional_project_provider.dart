import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfessionalProjectProvider with ChangeNotifier {
  String _projectText = '';

  String get projectText => _projectText;

  ProfessionalProjectProvider() {
    _loadSavedText();
  }

  void updateText(String text) {
    _projectText = text;
    notifyListeners();
    _saveText(text);
  }

  Future<void> _loadSavedText() async {
    final prefs = await SharedPreferences.getInstance();
    _projectText = prefs.getString('professional_project_text') ?? '';
    notifyListeners();
  }

  Future<void> _saveText(String text) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('professional_project_text', text);
  }

  bool get isValid => _projectText.trim().isNotEmpty;
}
