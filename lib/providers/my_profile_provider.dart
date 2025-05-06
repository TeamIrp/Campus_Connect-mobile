import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/update_profile_model.dart';
import '../service/api_services.dart';
import '../utils/show_toast.dart';
import '../widgets/toast_modals.dart';

class ProfileProvider with ChangeNotifier {
  // ─── Step 1 controllers & state ─────────
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  File? profileImage;
  final List<File> selectedImages = [];
  List<String> imagePaths = [];

  DateTime? selectedDate;
  String? selectedGender;
  String? selectedRelationshipStatus;
  String? selectedRelationshipType;
  String? selectedReligion;
  String? selectedCommunity;
  String? selectedSubCommunity;
  String? selectedZodiac;
  String? selectedCity;
  String? selectedRegion;

  String _latitude = '0.0';
  String _longitude = '0.0';

  String get latitude => _latitude;

  String get longitude => _longitude;

  void setLatitude(String value) {
    _latitude = value;
    notifyListeners();
  }

  void setLongitude(String value) {
    _longitude = value;
    notifyListeners();
  }

  final List<String> relationshipStatusOptions = [
    "Single",
    "Married",
    "Divorced"
  ];
  final List<String> relationshipTypeOptions = [
    "Adventure",
    "Serious relationship",
    "Friendship",
    "Casual encounters"
  ];
  final List<String> personalityOptions = [
    "Introvert",
    "Extrovert",
    "Adventurous",
    "Calm"
  ];
  final List<String> sizes = ['Short', 'Average', 'Tall'];
  final List<String> selectedSizes = [];
  final List<String> levelOfStudyOptions = [
    'Bachelor\'s degree 1',
    'Bachelor\'s degree 2',
    'Bachelor\'s degree 3'
  ];
  final List<String> communityOptions = [
    "Community 1",
    "Community 2",
    "Community 3"
  ];
  final List<String> subCommunityOptions = [
    "Sub-Community 1",
    "Sub-Community 2",
    "Sub-Community 3",
    "Sub-Community 4"
  ];

  //  ─── Step 2 fields ─────
  final List<String> interestsOptions = [
    "Cricket",
    "Music",
    "Book",
    "Swimming",
    "Photography",
    "Football"
  ];
  final TextEditingController heightController = TextEditingController();
  final List<String> complexionOptions = ["Fair", "Wheatish", "Dark"];
  final List<String> bodyTypeOptions = ["Fit", "Average", "Muscular", "Heavy"];
  final List<String> dietOptions = [
    "Vegetarian",
    "Non-Vegetarian",
    "Occasionally"
  ];
  final List<String> drinkOptions = [
    "Alcoholic",
    "Non-Alcoholic",
    "Occasionally"
  ];
  final List<String> smokeOptions = ["Smoker", "Non-Smoker", "Occasionally"];
  final List<String> genderSoughtOptions = ["Male", "Female"];

  RangeValues distanceRange = const RangeValues(5, 15);
  RangeValues ageRange = const RangeValues(20, 30);

  List<String> selectedInterests = [];
  String? stepTwoRelationshipStatus;
  String? selectedComplexion;
  String? selectedBodyType;
  String? selectedDiet;
  String? selectedDrink;
  String? selectedSmoke;
  String? genderSought;
  List<String> selectedRelationshipTypes = [];
  List<String> selectedPersonalities = [];
  String? disability;
  String? selectedStudyLevel;

  // ─── Step 3 fields ─────
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController courseController = TextEditingController();
  final TextEditingController universityController = TextEditingController();
  final TextEditingController academicProjectController =
      TextEditingController();
  final TextEditingController professionalProjectController =
      TextEditingController();
  final TextEditingController weightController = TextEditingController();

  String? selectedLevelOfStudy;
  bool onlyMatches = false;
  bool newInteractions = false;
  bool likes = false;
  bool messages = false;

  final List<String> sizeOptions = ['Small', 'Medium', 'Large'];

  ProfileProvider() {
    _loadSavedData();
    _loadSavedImages();
    _attachStep1Listeners();
    _attachHeightListener();
    _attachStep3Listeners();
  }

  // Future<void> _loadSavedData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   firstNameController.text = prefs.getString('first_name') ?? '';
  //   lastNameController.text = prefs.getString('last_name') ?? '';
  //   usernameController.text = prefs.getString('username') ?? '';
  //   emailController.text = prefs.getString('email') ?? '';
  //   mobileController.text = prefs.getString('mobile') ?? '';
  //   selectedGender = prefs.getString('gender');
  //   selectedRelationshipStatus = prefs.getString('relationship_status');
  //   selectedRelationshipType = prefs.getString('relationship_type');
  //   selectedCity = prefs.getString('city');
  //   selectedRegion = prefs.getString('region');
  //   selectedCommunity = prefs.getString('Community');
  //   selectedSubCommunity = prefs.getString('Sub-Community');
  //   selectedZodiac = prefs.getString('zodiac');
  //   final dob = prefs.getString('date_of_birth');
  //   if (dob != null) selectedDate = DateTime.parse(dob);
  //   final img = prefs.getString('profile_image');
  //   if (img != null && File(img).existsSync()) profileImage = File(img);
  //
  //   occupationController.text = prefs.getString('occupation') ?? '';
  //   courseController.text = prefs.getString('course') ?? '';
  //   universityController.text = prefs.getString('university') ?? '';
  //   academicProjectController.text = prefs.getString('academic_project') ?? '';
  //   professionalProjectController.text = prefs.getString('professional_project') ?? '';
  //   weightController.text = prefs.getString('weight') ?? '';
  //   selectedLevelOfStudy = prefs.getString('level_of_study');
  //   onlyMatches = prefs.getBool('only_matches') ?? true;
  //   newInteractions = prefs.getBool('new_interactions') ?? true;
  //   likes = prefs.getBool('likes') ?? true;
  //   messages = prefs.getBool('messages') ?? true;
  //
  //   notifyListeners();
  // }

  Future<void> _loadSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    firstNameController.text = prefs.getString('first_name') ?? '';
    lastNameController.text = prefs.getString('last_name') ?? '';
    usernameController.text = prefs.getString('username') ?? '';
    emailController.text = prefs.getString('email') ?? '';
    mobileController.text = prefs.getString('mobile') ?? '';
    selectedGender = prefs.getString('gender');
    selectedRelationshipStatus = prefs.getString('relationship_status');
    selectedRelationshipType = prefs.getString('relationship_type');
    selectedCity = prefs.getString('city');
    selectedRegion = prefs.getString('region');
    selectedCommunity = prefs.getString('Community');
    selectedSubCommunity = prefs.getString('Sub-Community');
    selectedZodiac = prefs.getString('zodiac');

    final dob = prefs.getString('date_of_birth');
    if (dob != null) selectedDate = DateTime.parse(dob);

    final img = prefs.getString('profile_image');
    if (img != null && File(img).existsSync()) profileImage = File(img);

    occupationController.text = prefs.getString('occupation') ?? '';
    courseController.text = prefs.getString('course') ?? '';
    universityController.text = prefs.getString('university') ?? '';
    academicProjectController.text = prefs.getString('academic_project') ?? '';
    professionalProjectController.text =
        prefs.getString('professional_project') ?? '';
    weightController.text = prefs.getString('weight') ?? '';
    heightController.text = prefs.getString('height') ?? '';

    selectedLevelOfStudy = prefs.getString('level_of_study');
    selectedComplexion = prefs.getString('complexion');
    selectedBodyType = prefs.getString('body_type');
    selectedDiet = prefs.getString('diet');
    selectedDrink = prefs.getString('drink');
    selectedSmoke = prefs.getString('smoke');
    genderSought = prefs.getString('gender_sought');

    final ageStart = prefs.getDouble('age_start') ?? 20;
    final ageEnd = prefs.getDouble('age_end') ?? 30;
    ageRange = RangeValues(ageStart, ageEnd);

    final distStart = prefs.getDouble('distance_start') ?? 5;
    final distEnd = prefs.getDouble('distance_end') ?? 15;
    distanceRange = RangeValues(distStart, distEnd);

    final savedInterests = prefs.getString('interests');
    if (savedInterests != null && savedInterests.isNotEmpty) {
      selectedInterests = savedInterests.split(',');
    }

    onlyMatches = prefs.getBool('only_matches') ?? true;
    newInteractions = prefs.getBool('new_interactions') ?? true;
    likes = prefs.getBool('likes') ?? true;
    messages = prefs.getBool('messages') ?? true;

    notifyListeners();
  }

  Future<void> _savePref(String key, String val) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, val);
  }

  Future<void> _saveBoolPref(String key, bool val) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, val);
  }

  void _attachStep1Listeners() {
    firstNameController
        .addListener(() => _savePref('first_name', firstNameController.text));
    lastNameController
        .addListener(() => _savePref('last_name', lastNameController.text));
    usernameController
        .addListener(() => _savePref('username', usernameController.text));
    emailController.addListener(() => _savePref('email', emailController.text));
    mobileController
        .addListener(() => _savePref('mobile', mobileController.text));
  }

  void _attachStep3Listeners() {
    occupationController
        .addListener(() => _savePref('occupation', occupationController.text));
    courseController
        .addListener(() => _savePref('course', courseController.text));
    universityController
        .addListener(() => _savePref('university', universityController.text));
    academicProjectController.addListener(
        () => _savePref('academic_project', academicProjectController.text));
    professionalProjectController.addListener(() =>
        _savePref('professional_project', professionalProjectController.text));
    weightController
        .addListener(() => _savePref('weight', weightController.text));
  }

  void _attachHeightListener() {
    heightController.addListener(() {
      notifyListeners();
    });
  }

  Future<void> _loadSavedImages() async {
    final prefs = await SharedPreferences.getInstance();
    imagePaths = prefs.getStringList('selected_image_paths') ?? [];
    selectedImages
      ..clear()
      ..addAll(imagePaths.map((p) => File(p)).where((f) => f.existsSync()));
    notifyListeners();
  }

  Future<void> pickProfileImage() async {
    final XFile? f = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (f != null) {
      profileImage = File(f.path);
      await _savePref('profile_image', f.path);
      notifyListeners();
    }
  }

  Future<void> pickMultipleImages() async {
    final imgs = await ImagePicker().pickMultiImage();
    if (imgs != null && imgs.isNotEmpty) {
      selectedImages.addAll(imgs.map((x) => File(x.path)));
      imagePaths.addAll(imgs.map((x) => x.path));
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('selected_image_paths', imagePaths);
      notifyListeners();
    }
  }

  void setLevelOfStudy(String? val) {
    selectedLevelOfStudy = val;
    if (val != null) _savePref('level_of_study', val);
    notifyListeners();
  }

  void toggleSize(String size) {
    if (selectedSizes.contains(size)) {
      selectedSizes.remove(size);
    } else {
      selectedSizes.add(size);
    }
    notifyListeners();
  }

  void setOnlyMatches(bool value) {
    onlyMatches = value;
    _saveBoolPref('only_matches', value);
    notifyListeners();
  }

  void setNewInteractions(bool value) {
    newInteractions = value;
    _saveBoolPref('new_interactions', value);
    notifyListeners();
  }

  void setLikes(bool value) {
    likes = value;
    _saveBoolPref('likes', value);
    notifyListeners();
  }

  void setMessages(bool value) {
    messages = value;
    _saveBoolPref('messages', value);
    notifyListeners();
  }

  void toggleInterest(String i) {
    selectedInterests.contains(i)
        ? selectedInterests.remove(i)
        : selectedInterests.add(i);
    notifyListeners();
  }

  void setStepTwoRelationshipStatus(String? v) {
    stepTwoRelationshipStatus = v;
    notifyListeners();
  }

  void setComplexion(String? v) {
    selectedComplexion = v;
    if (v != null) _savePref('complexion', v);
    notifyListeners();
  }

  void setBodyType(String? v) {
    selectedBodyType = v;
    if (v != null) _savePref('body_type', v);
    notifyListeners();
  }

  void setDiet(String? v) {
    selectedDiet = v;
    if (v != null) _savePref('diet', v);
    notifyListeners();
  }

  void setDrink(String? v) {
    selectedDrink = v;
    if (v != null) _savePref('drink', v);
    notifyListeners();
  }

  void setSmoke(String? v) {
    selectedSmoke = v;
    if (v != null) _savePref('smoke', v);
    notifyListeners();
  }

  void setGenderSought(String? v) {
    genderSought = v;
    if (v != null) _savePref('gender_sought', v);
    notifyListeners();
  }

  void toggleRelationshipType(String v) {
    selectedRelationshipTypes.contains(v)
        ? selectedRelationshipTypes.remove(v)
        : selectedRelationshipTypes.add(v);
    notifyListeners();
  }

  void togglePersonality(String v) {
    selectedPersonalities.contains(v)
        ? selectedPersonalities.remove(v)
        : selectedPersonalities.add(v);
    notifyListeners();
  }

  void setAgeRange(RangeValues r) {
    ageRange = r;
    notifyListeners();
  }

  void setDistanceRange(RangeValues r) {
    distanceRange = r;
    notifyListeners();
  }

  void setDisability(String? v) {
    disability = v;
    if (v != null) _savePref('disability', v);
    notifyListeners();
  }

  void setGender(String? gender) {
    selectedGender = gender;
    if (gender != null) _savePref('gender', gender);
    notifyListeners();
  }

  void setDate(DateTime date) {
    selectedDate = date;
    _savePref('date_of_birth', date.toIso8601String());
    notifyListeners();
  }

  void setRelationshipStatus(String? status) {
    selectedRelationshipStatus = status;
    if (status != null) _savePref('relationship_status', status);
    notifyListeners();
  }

  void setRelationshipType(String? type) {
    selectedRelationshipType = type;
    if (type != null) _savePref('relationship_type', type);
    notifyListeners();
  }

  void setCity(String? city) {
    selectedCity = city;
    if (city != null) _savePref('city', city);
    notifyListeners();
  }

  void setRegion(String? region) {
    selectedRegion = region;
    if (region != null) _savePref('region', region);
    notifyListeners();
  }

  void setCommunity(String? value) {
    selectedCommunity = value;
    if (value != null) _savePref('Community', value);
    notifyListeners();
  }

  void setSubCommunity(String? value) {
    selectedSubCommunity = value;
    if (value != null) _savePref('Sub-Community', value);
    notifyListeners();
  }

  void setZodiac(String? zodiac) {
    selectedZodiac = zodiac;
    if (zodiac != null) _savePref('zodiac', zodiac);
    notifyListeners();
  }

  bool _isLoading = false;
  MyProfile? _updatedProfile;

  Future<void> submitProfile(
      BuildContext context,
      String userId,
      File userImage,
      File otherImages,
      String firstname,
      String lastname,
      String userName,
      String emailAddress,
      String mobileNo,
      String gender,
      String dob,
      String relationshipStatus,
      String typeOfRelationship,
      String currentAcademic,
      String academicField,
      String professionalGoalsProjects,
      String levelOfStudies,
      String universitySchool,
      String latitude,
      String longitude,
      String city,
      String region,
      String religion,
      String community,
      String subCommunity,
      String astrological,
      String interests,
      String height,
      String anyDisability,
      String complexion,
      String bodytype,
      String diet,
      String drink,
      String smoker,
      String genderSought,
      String age,
      String maximumDistance,
      String personality,
      String size,
      String weight,
      String onlyMatch,
      String newInteraction,
      String like,
      String message,
      String universityCourse,
      String intendedOccuption,
      String professionalGoals,
      String token) async {
    _isLoading = true;
    notifyListeners();
    try {
      _updatedProfile = await ApiService.updateProfile(
        context,
        userId,
        userImage,
        otherImages,
        firstname,
        lastname,
        userName,
        emailAddress,
        mobileNo,
        gender,
        dob,
        relationshipStatus,
        typeOfRelationship,
        currentAcademic,
        academicField,
        professionalGoalsProjects,
        levelOfStudies,
        universitySchool,
        latitude,
        longitude,
        city,
        region,
        religion,
        community,
        subCommunity,
        astrological,
        interests,
        height,
        anyDisability,
        complexion,
        bodytype,
        diet,
        drink,
        smoker,
        genderSought,
        age,
        maximumDistance,
        personality,
        size,
        weight,
        onlyMatch,
        newInteraction,
        like,
        message,
        universityCourse,
        intendedOccuption,
        professionalGoals,
        token,
      );

      if (_updatedProfile?.statusCode == 200 &&
          _updatedProfile?.status == true) {
        showProfileSuccessToast(context);
      } else if (_updatedProfile?.statusCode == 400 &&
          _updatedProfile?.status == false) {
        ShowToast.showToastError(_updatedProfile!.message.toString());
      } else {
        ShowToast.showToastError(_updatedProfile!.errorMsg.toString());
      }
    } catch (e) {
      ShowToast.showToastError(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  bool get isStepOneValid {
    return profileImage != null &&
        selectedImages.isNotEmpty &&
        firstNameController.text.trim().isNotEmpty &&
        lastNameController.text.trim().isNotEmpty &&
        usernameController.text.trim().isNotEmpty &&
        emailController.text.trim().isNotEmpty &&
        mobileController.text.trim().isNotEmpty &&
        selectedGender != null &&
        selectedDate != null &&
        selectedRelationshipStatus != null &&
        selectedRelationshipType != null &&
        selectedCity != null &&
        selectedRegion != null &&
        selectedCommunity != null &&
        selectedSubCommunity != null &&
        selectedZodiac != null &&
        _latitude.trim().isNotEmpty &&
        _longitude.trim().isNotEmpty;
  }

  bool get isStepTwoValid {
    return selectedInterests.isNotEmpty &&
        stepTwoRelationshipStatus != null &&
        heightController.text.trim().isNotEmpty &&
        selectedComplexion != null &&
        selectedBodyType != null &&
        selectedDiet != null &&
        selectedDrink != null &&
        selectedSmoke != null &&
        ageRange.start > 0 &&
        ageRange.end > ageRange.start &&
        distanceRange.start >= 0 &&
        distanceRange.end > distanceRange.start &&
        genderSought != null &&
        selectedSizes.isNotEmpty &&
        selectedRelationshipTypes.isNotEmpty &&
        selectedPersonalities.isNotEmpty;
  }

  bool get isStepThreeValid {
    return occupationController.text.trim().isNotEmpty &&
        courseController.text.trim().isNotEmpty &&
        universityController.text.trim().isNotEmpty &&
        academicProjectController.text.trim().isNotEmpty &&
        professionalProjectController.text.trim().isNotEmpty &&
        weightController.text.trim().isNotEmpty &&
        selectedLevelOfStudy != null &&
        onlyMatches &&
        newInteractions &&
        likes &&
        messages;
  }

  bool get isProfileComplete {
    return isStepOneValid && isStepTwoValid && isStepThreeValid;
  }
}
