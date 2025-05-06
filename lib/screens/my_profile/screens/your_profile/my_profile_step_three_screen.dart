// import 'package:flutter/material.dart';
// import '../../../../widgets/toast_modals.dart';
// import '../../widgets/profile_appbar.dart';
//
// class MyProfileStepThreeScreen extends StatefulWidget {
//   const MyProfileStepThreeScreen({super.key});
//
//   @override
//   State<MyProfileStepThreeScreen> createState() =>
//       _MyProfileStepThreeScreenState();
// }
//
// class _MyProfileStepThreeScreenState extends State<MyProfileStepThreeScreen> {
//   final TextEditingController occupationController = TextEditingController();
//   final TextEditingController courseController = TextEditingController();
//   final TextEditingController universityController = TextEditingController();
//   final TextEditingController academicProjectController =
//       TextEditingController();
//   final TextEditingController professionalProjectController =
//       TextEditingController();
//   final TextEditingController weightController = TextEditingController();
//
//   List<String> selectedSizes = [];
//   bool onlyMatches = true;
//   bool newInteractions = true;
//   bool likes = true;
//   bool messages = true;
//
//   final List<String> _sizes = ['Small', 'Medium', 'Large'];
//
//   Widget _buildChipSelector(
//     List<String> options,
//     List<String> selectedOptions, {
//     bool multiple = false,
//   }) {
//     return Wrap(
//       spacing: 15,
//       runSpacing: 15,
//       children:
//           options.map((option) {
//             final isSelected = selectedOptions.contains(option);
//             return InkWell(
//               onTap: () {
//                 setState(() {
//                   if (multiple) {
//                     isSelected
//                         ? selectedOptions.remove(option)
//                         : selectedOptions.add(option);
//                   } else {
//                     selectedOptions.clear();
//                     selectedOptions.add(option);
//                   }
//                 });
//               },
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 6,
//                 ),
//                 decoration: BoxDecoration(
//                   color: isSelected ? const Color(0xFF1D97D4) : Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: const [
//                     BoxShadow(color: Color(0x66000000), blurRadius: 4),
//                   ],
//                 ),
//                 child: Text(
//                   option,
//                   style: TextStyle(
//                     color: isSelected ? Colors.white : Colors.black,
//                     fontFamily: 'Inter',
//                     fontSize: 14,
//                   ),
//                 ),
//               ),
//             );
//           }).toList(),
//     );
//   }
//
//   Widget _buildTextField(
//     String hint,
//     TextEditingController controller, {
//     int maxLines = 1,
//     bool isNumber = false,
//   }) {
//     return TextField(
//       controller: controller,
//       maxLines: maxLines,
//       keyboardType: isNumber ? TextInputType.number : TextInputType.text,
//       style: const TextStyle(
//         fontFamily: 'Inter',
//         fontWeight: FontWeight.w400,
//         fontSize: 16,
//         color: Colors.black,
//         height: 1,
//       ),
//       decoration: InputDecoration(
//         hintText: hint,
//         contentPadding: const EdgeInsets.symmetric(
//           horizontal: 16,
//           vertical: 14,
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(width: 1, color: Color(0xFF797979)),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildLabel(
//     String text, {
//     FontWeight fontWeight = FontWeight.w500,
//     double fontSize = 16,
//   }) {
//     return Text(
//       text,
//       style: TextStyle(
//         fontFamily: 'Inter',
//         fontWeight: fontWeight,
//         fontSize: fontSize,
//         color: Colors.black,
//         height: 1,
//       ),
//     );
//   }
//
//   Widget _buildToggle(
//     String label,
//     bool value,
//     void Function(bool?) onChanged,
//   ) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontFamily: 'Inter',
//             fontWeight: FontWeight.w400,
//             fontSize: 16,
//           ),
//         ),
//         Switch(
//           value: value,
//           onChanged: onChanged,
//           activeColor: const Color(0xFFFFFFFF),
//           activeTrackColor: const Color(0xFF14AE5C),
//           inactiveThumbColor: const Color(0xFFFFFFFF),
//           inactiveTrackColor: const Color(0xFF797979),
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const ProfileAppBar(title: 'My Profile'),
//       body: ListView(
//         padding: const EdgeInsets.all(20),
//         physics: const BouncingScrollPhysics(),
//         children: [
//           Center(
//             child: ConstrainedBox(
//               constraints: const BoxConstraints(maxWidth: 400),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _buildLabel(
//                     'Profession and Studies Details',
//                     fontWeight: FontWeight.w600,
//                     fontSize: 18,
//                   ),
//                   const SizedBox(height: 20),
//
//                   _buildLabel('Current or intended occupation'),
//                   const SizedBox(height: 8),
//                   _buildTextField('Software Engineer', occupationController),
//                   const SizedBox(height: 20),
//
//                   _buildLabel('University Course'),
//                   const SizedBox(height: 8),
//                   _buildTextField('Data Science', courseController),
//                   const SizedBox(height: 20),
//
//                   _buildLabel('Level of studies'),
//                   const SizedBox(height: 8),
//                   DropdownButtonFormField<String>(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: const BorderSide(
//                           color: Color(0xFF797979),
//                           width: 1,
//                         ),
//                       ),
//                       contentPadding: const EdgeInsets.symmetric(
//                         horizontal: 16,
//                         vertical: 14,
//                       ),
//                     ),
//                     items:
//                         [
//                               'Bachelor\'s degree 1',
//                               'Bachelor\'s degree 2',
//                               'Bachelor\'s degree 3',
//                             ]
//                             .map(
//                               (e) => DropdownMenuItem(value: e, child: Text(e)),
//                             )
//                             .toList(),
//                     onChanged: (String? value) {},
//                   ),
//
//                   const SizedBox(height: 20),
//                   _buildLabel('University or school attended'),
//                   const SizedBox(height: 8),
//                   _buildTextField('Your University', universityController),
//                   const SizedBox(height: 20),
//
//                   _buildLabel('Academic Project'),
//                   const SizedBox(height: 8),
//                   _buildTextField(
//                     'Your academic project details',
//                     academicProjectController,
//                     maxLines: 5,
//                   ),
//                   const SizedBox(height: 20),
//
//                   _buildLabel('Professional Project'),
//                   const SizedBox(height: 8),
//                   _buildTextField(
//                     'Your professional project details',
//                     professionalProjectController,
//                     maxLines: 5,
//                   ),
//                   const SizedBox(height: 30),
//
//                   _buildLabel(
//                     'Physical criteria',
//                     fontWeight: FontWeight.w600,
//                     fontSize: 18,
//                   ),
//                   const SizedBox(height: 20),
//
//                   _buildLabel('Size'),
//                   const SizedBox(height: 8),
//                   _buildChipSelector(_sizes, selectedSizes),
//                   const SizedBox(height: 20),
//
//                   _buildLabel('Weight/silhouette (Kg)'),
//                   const SizedBox(height: 8),
//                   _buildTextField('e.g. 70', weightController, isNumber: true),
//                   const SizedBox(height: 30),
//
//                   _buildLabel(
//                     'Privacy and security settings',
//                     fontWeight: FontWeight.w600,
//                     fontSize: 18,
//                   ),
//                   const SizedBox(height: 20),
//
//                   _buildLabel('Who can send you messages?'),
//                   const SizedBox(height: 10),
//                   _buildToggle(
//                     'Only Matches',
//                     onlyMatches,
//                     (val) => setState(() => onlyMatches = val ?? false),
//                   ),
//                   const SizedBox(height: 20),
//
//                   _buildLabel('Push notifications'),
//                   const SizedBox(height: 10),
//                   _buildToggle(
//                     'New Interactions',
//                     newInteractions,
//                     (val) => setState(() => newInteractions = val ?? false),
//                   ),
//                   const SizedBox(height: 10),
//                   _buildToggle(
//                     'Likes',
//                     likes,
//                     (val) => setState(() => likes = val ?? false),
//                   ),
//                   const SizedBox(height: 10),
//                   _buildToggle(
//                     'Messages',
//                     messages,
//                     (val) => setState(() => messages = val ?? false),
//                   ),
//                   const SizedBox(height: 30),
//
//                   SizedBox(
//                     width: double.infinity,
//                     height: 52,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         showProfileSuccessToast(context); // show toast
//
//                         // Navigate back 3 screens after 4 seconds
//                         Future.delayed(const Duration(milliseconds: 4000), () {
//                           int count = 0;
//                           Navigator.of(context).popUntil((route) {
//                             return count++ == 3;
//                           });
//                         });
//                       },
//
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF1D97D4),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(7),
//                         ),
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 15,
//                           vertical: 10,
//                         ),
//                       ),
//
//                       child: const Text(
//                         'Update',
//                         style: TextStyle(
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.w600,
//                           fontSize: 16,
//                           color: Colors.white,
//                           height: 1,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//

// ------------------------------------------------------------------------------------------

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../providers/my_profile_provider.dart';
import '../../widgets/profile_appbar.dart';

class MyProfileStepThreeScreen extends StatefulWidget {
  const MyProfileStepThreeScreen({super.key});

  @override
  State<MyProfileStepThreeScreen> createState() =>
      _MyProfileStepThreeScreenState();
}

class _MyProfileStepThreeScreenState extends State<MyProfileStepThreeScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _userId;
  String? _token;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadPrefs();
    });
  }

  Future<void> _loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userId = prefs.getString('userId');
      _token = prefs.getString('token');
    });
  }

  Widget _buildChipSelector(BuildContext context) {
    final provider = context.watch<ProfileProvider>();
    return Wrap(
      spacing: 15,
      runSpacing: 15,
      children: provider.sizes.map((option) {
        final isSelected = provider.selectedSizes.contains(option);
        return InkWell(
          onTap: () => context.read<ProfileProvider>().toggleSize(option),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF1D97D4) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Color(0x66000000), blurRadius: 4)
              ],
            ),
            child: Text(
              option,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontFamily: 'Inter',
                fontSize: 14,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTextField(
    String hint,
    TextEditingController controller, {
    int maxLines = 1,
    bool isNumber = false,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      style: const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Colors.black,
        height: 1,
      ),
      decoration: InputDecoration(
        hintText: hint,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Required';
        }
        return null;
      },
    );
  }

  Widget _buildLabel(String text,
      {FontWeight fontWeight = FontWeight.w500, double fontSize = 16}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Inter',
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: Colors.black,
        height: 1,
      ),
    );
  }

  Widget _buildToggle(String label, bool value, void Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        Switch(
          value: value,
          onChanged: (val) => onChanged(val),
          activeColor: const Color(0xFFFFFFFF),
          activeTrackColor: const Color(0xFF14AE5C),
          inactiveThumbColor: const Color(0xFFFFFFFF),
          inactiveTrackColor: const Color(0xFF797979),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProfileProvider>();

    return Scaffold(
      appBar: const ProfileAppBar(title: 'My Profile'),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          physics: const BouncingScrollPhysics(),
          children: [
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel('Profession and Studies Details',fontWeight: FontWeight.w600, fontSize: 18),
                    const SizedBox(height: 20),
                    _buildLabel('Current or intended occupation'),
                    const SizedBox(height: 8),
                    _buildTextField('Software Engineer', provider.occupationController),
                    const SizedBox(height: 20),
                    _buildLabel('University Course'),
                    const SizedBox(height: 8),
                    _buildTextField('Data Science', provider.courseController),
                    const SizedBox(height: 20),
                    // dropdown("Level of studies", ["Associates", "Undergraduate", "postgraduate"], provider.selectedLevelOfStudy,provider.setLevelOfStudy),
                    const SizedBox(height: 20),
                    _buildLabel('University or school attended'),
                    const SizedBox(height: 8),
                    _buildTextField('Your University', provider.universityController),
                    const SizedBox(height: 20),
                    _buildLabel('Academic Project'),
                    const SizedBox(height: 8),
                    _buildTextField('Your academic project details', provider.academicProjectController, maxLines: 5),
                    const SizedBox(height: 20),
                    _buildLabel('Professional Project'),
                    const SizedBox(height: 8),
                    _buildTextField('Your professional project details',
                        provider.professionalProjectController,
                        maxLines: 5),
                    const SizedBox(height: 30),
                    _buildLabel('Physical criteria',
                        fontWeight: FontWeight.w600, fontSize: 18),
                    const SizedBox(height: 20),
                    _buildLabel('Size'),
                    const SizedBox(height: 8),
                    _buildChipSelector(context),
                    if (provider.selectedSizes.isEmpty)
                      const Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          'Please select at least one size',
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ),
                    const SizedBox(height: 20),
                    _buildLabel('Weight/silhouette (Kg)'),
                    const SizedBox(height: 8),
                    _buildTextField('e.g. 70', provider.weightController,
                        isNumber: true),
                    const SizedBox(height: 30),
                    _buildLabel('Privacy and security settings',
                        fontWeight: FontWeight.w600, fontSize: 18),
                    const SizedBox(height: 20),
                    _buildLabel('Who can send you messages?'),
                    const SizedBox(height: 10),
                    _buildToggle('Only Matches', provider.onlyMatches,
                        provider.setOnlyMatches),
                    const SizedBox(height: 20),
                    _buildLabel('Push notifications'),
                    const SizedBox(height: 10),
                    _buildToggle('New Interactions', provider.newInteractions,
                        provider.setNewInteractions),
                    const SizedBox(height: 10),
                    _buildToggle('Likes', provider.likes, provider.setLikes),
                    const SizedBox(height: 10),
                    _buildToggle(
                        'Messages', provider.messages, provider.setMessages),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (!_formKey.currentState!.validate() ||
                              provider.selectedSizes.isEmpty ||
                              _userId == null ||
                              _token == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Please fill all fields and ensure you are logged in'),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }

                          await updateProfile(
                            context,
                            _userId!,
                            provider.profileImage ?? File(''),
                            provider.selectedImages.isNotEmpty? provider.selectedImages.first: File(''),
                            provider.firstNameController.text.trim(),
                            provider.lastNameController.text.trim(),
                            provider.usernameController.text.trim(),
                            provider.emailController.text.trim(),
                            provider.mobileController.text.trim(),
                            provider.selectedGender ?? '',
                            provider.selectedDate?.toIso8601String() ?? '',
                            provider.selectedRelationshipStatus ?? '',
                            provider.selectedRelationshipType ?? '',
                            provider.occupationController.text.trim(),
                            provider.courseController.text.trim(),
                            provider.academicProjectController.text.trim(),
                            provider.selectedLevelOfStudy ?? '',
                            provider.universityController.text.trim(),
                            provider.latitude?.toString() ?? '',
                            provider.longitude?.toString() ?? '',
                            provider.selectedCity ?? '',
                            provider.selectedRegion ?? '',
                            provider.selectedReligion ?? '',
                            provider.selectedCommunity ?? '',
                            provider.selectedSubCommunity ?? '',
                            provider.selectedZodiac ?? '',
                            provider.selectedInterests.join(','),
                            provider.heightController.text.trim(),
                            provider.disability ?? '',
                            provider.selectedComplexion ?? '',
                            provider.selectedBodyType ?? '',
                            provider.selectedDiet ?? '',
                            provider.selectedDrink ?? '',
                            provider.selectedSmoke ?? '',
                            provider.genderSought ?? '',
                            provider.ageRange.start.round().toString(),
                            provider.distanceRange.start.round().toString(),
                            provider.selectedPersonalities.join(','),
                            provider.selectedSizes.join(','),
                            provider.weightController.text.trim(),
                            provider.onlyMatches.toString(),
                            provider.newInteractions.toString(),
                            provider.likes.toString(),
                            provider.messages.toString(),
                            provider.courseController.text.trim(),
                            provider.selectedRelationshipType ?? '',
                            provider.professionalProjectController.text.trim(),
                            _token!,
                          );

                          // pop back after a short delay
                          Future.delayed(const Duration(milliseconds: 400), () {
                            int count = 0;
                            Navigator.of(context).popUntil((route) {
                              return count++ == 3;
                            });
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1D97D4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                        ),
                        child: const Text(
                          'Update',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dropdown(String label, List<String> opts, String? val,
      ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(height: 5),
        DropdownButtonFormField<String>(
          value: val,
          validator: (value) =>
          value == null || value.isEmpty ? 'Required' : null,
          items: opts
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Future<void> updateProfile(
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
    final profileProvider =
        Provider.of<ProfileProvider>(context, listen: false);
    await profileProvider.submitProfile(
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
  }
}
