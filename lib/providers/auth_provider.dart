import 'dart:io';

import 'package:campus_connect/models/registration_model.dart';
import 'package:campus_connect/service/api_services.dart';
import 'package:campus_connect/utils/show_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';

import '../models/login_model.dart';

class AuthProvider extends ChangeNotifier {
  Registration? _registration;
  Login? _loginResponse;

  bool _isLoading = false;

  Registration? get registration => _registration;

  Login? get loginResponse => _loginResponse;

  bool get isLoading => _isLoading;

  Future<void> getRegistration(
    BuildContext context,
    String firstname,
    String lastname,
    String username,
    String emailAddress,
    String mobileNo,
    String password,
    String gender,
    String dob,
    String relationshipStatus,
    String typeOfRelationship,
    String currentIntendedOccupation,
    String academicField,
    String professionalGoalsProjects,
    String passwordConfirmation,
    String levelOfStudies,
    String universitySchool,
    File image,
    String latitude,
    String longitude,
  ) async {
    _isLoading = true;
    notifyListeners();
    try {
      _registration = await ApiService.getRegister(
        context,
        firstname,
        lastname,
        username,
        emailAddress,
        mobileNo,
        password,
        gender,
        dob,
        relationshipStatus,
        typeOfRelationship,
        currentIntendedOccupation,
        academicField,
        professionalGoalsProjects,
        passwordConfirmation,
        levelOfStudies,
        universitySchool,
        image,
        latitude,
        longitude,
      );
      if (_registration?.statusCode == 200 && _registration?.status == true) {
        ShowToast.showToastSuccess(_registration!.message.toString());
        notifyListeners();
      } else if (_registration?.statusCode == 400 &&
          _registration?.status == false) {
        ShowToast.showToastError(_registration!.message.toString());
        notifyListeners();
      } else {
        ShowToast.showToastError(_registration!.errorMsg.toString());
      }
    } catch (e) {
      ShowToast.showToastError(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getlogin(
    BuildContext context,
    String email,
    String password,
  ) async {
    _isLoading = true;
    notifyListeners();
    try {
      _loginResponse = await ApiService.getLogin(context, email, password);
      if (_loginResponse?.statusCode == 200 && _loginResponse?.status == true) {
        ShowToast.showToastSuccess(_loginResponse!.message.toString());
        notifyListeners();
      } else if (_loginResponse?.statusCode == 400 &&
          _loginResponse?.status == false) {
        ShowToast.showToastError(_loginResponse!.message.toString());
        notifyListeners();
      } else {
        ShowToast.showToastError(_loginResponse!.errorMsg.toString());
      }
    } catch (e) {
      ShowToast.showToastError(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

class BasicDetailsProvider with ChangeNotifier {
  File? profileImage;
  String firstName = '';
  String lastName = '';
  String username = '';
  String email = '';
  String mobile = '';
  String? gender;
  DateTime? dateOfBirth;
  String? relationshipStatus;
  String? relationshipType;
  String? latitude = '';
  String? longitude = '';

  void setImage(File image) {
    profileImage = image;
    notifyListeners();
  }

  void setFirstName(String value) {
    firstName = value;
    notifyListeners();
  }

  void setLastName(String value) {
    lastName = value;
    notifyListeners();
  }

  void setUsername(String value) {
    username = value;
    notifyListeners();
  }

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void setMobile(String value) {
    mobile = value;
    notifyListeners();
  }

  void setGender(String? value) {
    gender = value;
    notifyListeners();
  }

  void setDateOfBirth(DateTime value) {
    dateOfBirth = value;
    notifyListeners();
  }

  void setRelationshipStatus(String? value) {
    relationshipStatus = value;
    notifyListeners();
  }

  void setRelationshipType(String? value) {
    relationshipType = value;
    notifyListeners();
  }

  void setLocation(String lat, String lng) {
    latitude = lat;
    longitude = lng;
    notifyListeners();
  }

  bool get isValid {
    return firstName.trim().isNotEmpty &&
        lastName.trim().isNotEmpty &&
        username.trim().isNotEmpty &&
        email.trim().isNotEmpty &&
        mobile.trim().isNotEmpty &&
        gender != null &&
        dateOfBirth != null &&
        relationshipStatus != null &&
        relationshipType != null &&
        latitude != null &&
        longitude != null;
  }
}

class ProfessionStudiesProvider extends ChangeNotifier {
  String? _occupation;
  String? _academicField;
  String? _levelOfStudies;
  String? _university;

  String? get occupation => _occupation;

  String? get academicField => _academicField;

  String? get levelOfStudies => _levelOfStudies;

  String? get university => _university;

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
    notifyListeners();
  }

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('occupation', _occupation ?? '');
    await prefs.setString('academicField', _academicField ?? '');
    await prefs.setString('selectedLevel', _levelOfStudies ?? '');
    await prefs.setString('university', _university ?? '');
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
}

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

class AcademicProjectProvider with ChangeNotifier {
  String _academicText = '';

  String get academicText => _academicText;

  void setAcademicText(String text) {
    _academicText = text;
    notifyListeners();
  }

  bool get isValid => _academicText.trim().isNotEmpty;
}

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

class LoginProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscureText = true;

  void toggleObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  String get email => emailController.text.trim();

  String get password => passwordController.text.trim();

  bool isEmailValid() => email.toLowerCase().endsWith('@gmail.com');

  bool isPasswordValid() => password.length >= 8;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
