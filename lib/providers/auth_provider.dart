import 'dart:io';

import 'package:campus_connect/models/registration_model.dart';
import 'package:campus_connect/service/api_services.dart';
import 'package:campus_connect/utils/show_toast.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier{
  Registration? _registration;

  bool _isLoading = false;

  Registration? get registration => _registration;

  bool get isLoading => _isLoading;


  Future<void> getRegistration(BuildContext context,
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
      File image,)async{
    _isLoading = true;
    notifyListeners();
    try{
      _registration = await ApiService.getRegister(context, firstname, lastname, username, emailAddress, mobileNo, password, gender, dob, relationshipStatus, typeOfRelationship,
          currentIntendedOccupation, academicField, professionalGoalsProjects, passwordConfirmation, levelOfStudies, universitySchool, image);
      if (_registration?.statusCode == 200 && _registration?.status == true){
        ShowToast.showToastSuccess(_registration!.message.toString());
        notifyListeners();
      }else if(_registration?.statusCode == 400 && _registration?.status == false){
        ShowToast.showToastError(_registration!.message.toString());
        notifyListeners();
      }else{
        ShowToast.showToastError(_registration!.errorMsg.toString());
      }

    }catch(e){
      ShowToast.showToastError(e.toString());
    }finally{
      _isLoading = false;
      notifyListeners();
    }
  }
}