import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfessionStudiesProvider extends ChangeNotifier {
  String? _occupation;
  String? _academicField;
  String? _levelOfStudies;
  String? _university;
  String? _imagePath;

  String? get occupation => _occupation;

  String? get academicField => _academicField;

  String? get levelOfStudies => _levelOfStudies;

  String? get university => _university;

  String? get imagePath => _imagePath;

  bool get isValid {
    return (_academicField?.isNotEmpty ?? false) &&
        (_levelOfStudies?.isNotEmpty ?? false) &&
        (_university?.isNotEmpty ?? false);
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    _occupation = prefs.getString('occupation');
    _academicField = prefs.getString('academicField');
    _levelOfStudies = prefs.getString('selectedLevel');
    _university = prefs.getString('university');
    _imagePath = prefs.getString('imagePath');
    notifyListeners();
  }

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('occupation', _occupation ?? '');
    await prefs.setString('academicField', _academicField ?? '');
    await prefs.setString('selectedLevel', _levelOfStudies ?? '');
    await prefs.setString('university', _university ?? '');
    if (_imagePath != null) {
      await prefs.setString('imagePath', _imagePath!);
    }
  }

  void updateOccupation(String value) {
    _occupation = value;
    saveData();
    notifyListeners();
  }

  void updateAcademicField(String value) {
    _academicField = value;
    saveData();
    notifyListeners();
  }

  void updateLevelOfStudies(String? value) {
    _levelOfStudies = value;
    saveData();
    notifyListeners();
  }

  void updateUniversity(String value) {
    _university = value;
    saveData();
    notifyListeners();
  }

  void updateImagePath(String path) {
    _imagePath = path;
    saveData();
    notifyListeners();
  }
}
