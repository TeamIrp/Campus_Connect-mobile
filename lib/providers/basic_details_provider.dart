import 'dart:io';
import 'package:flutter/material.dart';

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

  // ✅ Add this getter to validate all required fields
  bool get isValid {
    return
        firstName.trim().isNotEmpty &&
        lastName.trim().isNotEmpty &&
        username.trim().isNotEmpty &&
        email.trim().isNotEmpty &&
        mobile.trim().isNotEmpty &&
        gender != null &&
        dateOfBirth != null &&
        relationshipStatus != null &&
        relationshipType != null;
  }
}
