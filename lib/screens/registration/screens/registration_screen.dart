// import 'dart:io';
//
// import 'package:campus_connect/providers/auth_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../authentication/screens/login_screen.dart';
// import '../tabs/academic_project_tab.dart';
// import '../tabs/basic_details_tab.dart';
// import '../tabs/profession_studies_tab.dart';
// import '../tabs/professional_project_tab.dart';
// import '../tabs/set_credentials_tab.dart';
// import '../widgets/next_button.dart';
// import '../widgets/tab_indicator.dart';
// import '../widgets/toast_modal.dart';
//
// class RegistrationScreen extends StatefulWidget {
//   const RegistrationScreen({super.key});
//
//   @override
//   _RegistrationScreenState createState() => _RegistrationScreenState();
// }
//
// class _RegistrationScreenState extends State<RegistrationScreen> {
//   int _currentIndex = 0;
//
//   final List<Widget> _tabs = [
//     const BasicDetailsTab(),
//     const ProfessionStudiesTab(),
//     const AcademicProjectTab(),
//     const ProfessionalProjectTab(),
//     const SetCredentialsTab(),
//   ];
//
//   final List<String> _tabTitles = [
//     "Basic Details",
//     "Profession and Studies Details",
//     "Academic Project",
//     "Professional Project",
//     "Set Credentials",
//   ];
//
//   void _nextTab() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final basicProvider = Provider.of<BasicDetailsProvider>(
//         context,
//         listen: false,
//       );
//       final professionStudiesProvider = Provider.of<ProfessionStudiesProvider>(
//         context,
//         listen: false,
//       );
//       final academicProvider = Provider.of<AcademicProjectProvider>(
//         context,
//         listen: false,
//       );
//       final projectProvider = Provider.of<ProfessionalProjectProvider>(
//         context,
//         listen: false,
//       );
//       final credentialsProvider = Provider.of<CredentialsProvider>(
//         context,
//         listen: false,
//       );
//
//       if (_currentIndex == 0 && !basicProvider.isValid) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text(
//               'Please complete all required fields in Basic Details.',
//             ),
//             backgroundColor: Colors.red,
//           ),
//         );
//         return;
//       }
//
//       if (_currentIndex == 1 && !professionStudiesProvider.isValid) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text(
//               'Please complete all required fields in Education Details.',
//             ),
//             backgroundColor: Colors.red,
//           ),
//         );
//         return;
//       }
//
//       if (_currentIndex == 2 && !academicProvider.isValid) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Please enter your current academic project.'),
//             backgroundColor: Colors.red,
//           ),
//         );
//         return;
//       }
//
//       if (_currentIndex == 3 && !projectProvider.isValid) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Please enter your professional goal or project.'),
//             backgroundColor: Colors.red,
//           ),
//         );
//         return;
//       }
//
//       if (_currentIndex == 4 && !credentialsProvider.isPasswordMatch) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Passwords do not match or are empty.'),
//             backgroundColor: Colors.red,
//           ),
//         );
//         return;
//       }
//
//       if (_currentIndex < _tabs.length - 1) {
//         setState(() {
//           _currentIndex++;
//         });
//       } else {
//
//         print("===== Registration Data =====");
//
//
//         print("First Name: ${basicProvider.firstName}");
//         print("Last Name: ${basicProvider.lastName}");
//         print("Username: ${basicProvider.username}");
//         print("Email Address: ${basicProvider.email}");
//         print("Mobile No: ${basicProvider.mobile}");
//         print("Gender: ${basicProvider.gender}");
//         print("DOB: ${basicProvider.dateOfBirth}");
//         print("Relationship Status: ${basicProvider.relationshipStatus}");
//         print("Type of Relationship: ${basicProvider.relationshipType}");
//         print("Current Intended Occupation: ${professionStudiesProvider.occupation}");
//         print("Level of Studies: ${professionStudiesProvider.levelOfStudies}");
//         print("University/School: ${professionStudiesProvider.university}");
//         print("Academic Field: ${professionStudiesProvider.academicField}");
//         print("Academic Project: ${academicProvider.academicText}");
//         print("Professional Goal/Project: ${projectProvider.projectText}");
//         print("Password: ${credentialsProvider.password}");
//         print("Confirm Password: ${credentialsProvider.confirmPassword}");
//
//
//         print("==============================");
//
//         showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (context) => const ToastModal(),
//         );
//
//         Future.delayed(const Duration(milliseconds: 4000), () {
//           if (mounted) {
//             Navigator.of(context).pop();
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => const LoginScreen()),
//             );
//           }
//         });
//       }
//     });
//   }
//
//   void _previousTab() {
//     if (_currentIndex > 0) {
//       setState(() {
//         _currentIndex--;
//       });
//     } else {
//       Navigator.pop(context);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF1D97D4),
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
//           onPressed: _previousTab,
//         ),
//         title: Text(
//           _tabTitles[_currentIndex],
//           style: const TextStyle(
//             fontFamily: 'Inter',
//             fontWeight: FontWeight.w700,
//             fontSize: 18,
//             color: Colors.white,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 20),
//           TabIndicator(currentIndex: _currentIndex, totalTabs: _tabs.length),
//           Expanded(child: _tabs[_currentIndex]),
//           NextButton(
//             onPressed: _nextTab,
//             text: _currentIndex == _tabs.length - 1 ? 'Submit' : 'Next',
//           ),
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
//
//   Future<void> getRegister(
//     BuildContext context,
//     String firstname,
//     String lastname,
//     String username,
//     String emailAddress,
//     String mobileNo,
//     String password,
//     String gender,
//     String dob,
//     String relationshipStatus,
//     String typeOfRelationship,
//     String currentIntendedOccupation,
//     String academicField,
//     String professionalGoalsProjects,
//     String passwordConfirmation,
//     String levelOfStudies,
//     String universitySchool,
//     File image,
//   ) async {
//     final registerProvider = Provider.of<AuthProvider>(context, listen: false);
//     await registerProvider.getRegistration(
//         context,
//         firstname,
//         lastname,
//         username,
//         emailAddress,
//         mobileNo,
//         password,
//         gender,
//         dob,
//         relationshipStatus,
//         typeOfRelationship,
//         currentIntendedOccupation,
//         academicField,
//         professionalGoalsProjects,
//         passwordConfirmation,
//         levelOfStudies,
//         universitySchool,
//         image);
//     if (registerProvider.registration?.statusCode == 200 &&
//         registerProvider.registration?.status == true) {}
//   }
// }

import 'dart:io';

import 'package:campus_connect/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../authentication/screens/login_screen.dart';
import '../tabs/academic_project_tab.dart';
import '../tabs/basic_details_tab.dart';
import '../tabs/profession_studies_tab.dart';
import '../tabs/professional_project_tab.dart';
import '../tabs/set_credentials_tab.dart';
import '../widgets/next_button.dart';
import '../widgets/tab_indicator.dart';
import '../widgets/toast_modal.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  RegistrationScreenState createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const BasicDetailsTab(),
    const ProfessionStudiesTab(),
    const AcademicProjectTab(),
    const ProfessionalProjectTab(),
    const SetCredentialsTab(),
  ];

  final List<String> _tabTitles = [
    "Basic Details",
    "Profession and Studies Details",
    "Academic Project",
    "Professional Project",
    "Set Credentials",
  ];

  void _nextTab() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final basicProvider =
          Provider.of<BasicDetailsProvider>(context, listen: false);
      final professionStudiesProvider =
          Provider.of<ProfessionStudiesProvider>(context, listen: false);
      final academicProvider =
          Provider.of<AcademicProjectProvider>(context, listen: false);
      final projectProvider =
          Provider.of<ProfessionalProjectProvider>(context, listen: false);
      final credentialsProvider =
          Provider.of<CredentialsProvider>(context, listen: false);

      if (_currentIndex == 0 && !basicProvider.isValid) {
        _showError('Please complete all required fields in Basic Details.');
        return;
      }

      if (_currentIndex == 1 && !professionStudiesProvider.isValid) {
        _showError('Please complete all required fields in Education Details.');
        return;
      }

      if (_currentIndex == 2 && !academicProvider.isValid) {
        _showError('Please enter your current academic project.');
        return;
      }

      if (_currentIndex == 3 && !projectProvider.isValid) {
        _showError('Please enter your professional goal or project.');
        return;
      }

      if (_currentIndex == 4 && !credentialsProvider.isPasswordMatch) {
        _showError('Passwords do not match or are empty.');
        return;
      }

      if (_currentIndex < _tabs.length - 1) {
        setState(() {
          _currentIndex++;
        });
      } else {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const ToastModal(),
        );

        print({'Latitude : ${basicProvider.latitude}'});
        print({'Longitude : ${basicProvider.longitude}'});

        await getRegister(
          context,
          basicProvider.firstName,
          basicProvider.lastName,
          basicProvider.username,
          basicProvider.email,
          basicProvider.mobile,
          credentialsProvider.password,
          basicProvider.gender ?? '',
          basicProvider.dateOfBirth?.toIso8601String() ?? '',
          basicProvider.relationshipStatus ?? '',
          basicProvider.relationshipType ?? '',
          professionStudiesProvider.occupation ?? '',
          professionStudiesProvider.academicField ?? '',
          projectProvider.projectText,
          credentialsProvider.confirmPassword,
          professionStudiesProvider.levelOfStudies ?? '',
          professionStudiesProvider.university ?? '',
          basicProvider.profileImage ?? File(''),
          basicProvider.latitude?.toString() ?? '0',
          basicProvider.longitude?.toString() ?? '0',
        );

        Future.delayed(const Duration(seconds: 4), () {
          if (mounted) {
            Navigator.of(context).pop();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          }
        });
      }
    });
  }

  void _previousTab() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    } else {
      Navigator.pop(context);
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D97D4),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
          onPressed: _previousTab,
        ),
        title: Text(
          _tabTitles[_currentIndex],
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          TabIndicator(currentIndex: _currentIndex, totalTabs: _tabs.length),
          Expanded(child: _tabs[_currentIndex]),
          NextButton(
            onPressed: _nextTab,
            text: _currentIndex == _tabs.length - 1 ? 'Submit' : 'Next',
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Future<void> getRegister(
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
    final registerProvider = Provider.of<AuthProvider>(context, listen: false);
    await registerProvider.getRegistration(
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
  }
}
