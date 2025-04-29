// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import '../../../providers/auth_provider.dart';
//
// class BasicDetailsTab extends StatefulWidget {
//   const BasicDetailsTab({super.key});
//
//   @override
//   State<BasicDetailsTab> createState() => _BasicDetailsTabState();
// }
//
// class _BasicDetailsTabState extends State<BasicDetailsTab> {
//   final ImagePicker _picker = ImagePicker();
//
//   Future<void> _pickImage(BuildContext context) async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       Provider.of<BasicDetailsProvider>(
//         context,
//         listen: false,
//       ).setImage(File(pickedFile.path));
//     }
//   }
//
//   Future<void> _selectDate(BuildContext context) async {
//     final provider = Provider.of<BasicDetailsProvider>(context, listen: false);
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: provider.dateOfBirth ?? DateTime(2000),
//       firstDate: DateTime(1900),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null) provider.setDateOfBirth(picked);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<BasicDetailsProvider>(context);
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildProfilePicture(provider),
//           const SizedBox(height: 40),
//           _buildInputRow(
//             context,
//             "First Name",
//             provider.firstName,
//             provider.setFirstName,
//             "Last Name",
//             provider.lastName,
//             provider.setLastName,
//           ),
//           _buildInputField("Username", provider.username, provider.setUsername),
//           _buildInputField("Email Address", provider.email, provider.setEmail),
//           _buildInputField(
//             "Mobile Number",
//             provider.mobile,
//             provider.setMobile,
//           ),
//           _buildDropdownField(
//             "Gender",
//             ["Male", "Female", "Other"],
//             provider.gender,
//             provider.setGender,
//           ),
//           _buildDatePicker(provider),
//           _buildDropdownField(
//             "Relationship Status",
//             ["Single", "Married", "Other"],
//             provider.relationshipStatus,
//             provider.setRelationshipStatus,
//           ),
//           _buildDropdownField(
//             "Type of Relationship Sought",
//             ["Friendship", "Networking", "Dating", "Other"],
//             provider.relationshipType,
//             provider.setRelationshipType,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProfilePicture(BasicDetailsProvider provider) {
//     return Center(
//       child: Stack(
//         alignment: Alignment.bottomCenter,
//         clipBehavior: Clip.none,
//         children: [
//           CircleAvatar(
//             radius: 57,
//             backgroundColor: const Color(0xFF343434),
//             backgroundImage:
//                 provider.profileImage != null
//                     ? FileImage(provider.profileImage!)
//                     : null,
//           ),
//           Positioned(
//             bottom: -14,
//             child: GestureDetector(
//               onTap: () => _pickImage(context),
//               child: const CircleAvatar(
//                 radius: 16,
//                 backgroundColor: Color(0xFF797979),
//                 child: Icon(Icons.camera_alt, size: 16, color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildInputRow(
//     BuildContext context,
//     String label1,
//     String value1,
//     Function(String) onChanged1,
//     String label2,
//     String value2,
//     Function(String) onChanged2,
//   ) {
//     return Row(
//       children: [
//         Expanded(child: _buildInputField(label1, value1, onChanged1)),
//         const SizedBox(width: 10),
//         Expanded(child: _buildInputField(label2, value2, onChanged2)),
//       ],
//     );
//   }
//
//   Widget _buildInputField(
//     String label,
//     String value,
//     Function(String) onChanged,
//   ) {
//     final controller = TextEditingController(text: value);
//     controller.selection = TextSelection.collapsed(
//       offset: controller.text.length,
//     );
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             color: Colors.black,
//           ),
//         ),
//         const SizedBox(height: 5),
//         TextField(
//           controller: controller,
//           onChanged: onChanged,
//           decoration: InputDecoration(
//             hintText: "Enter",
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//           ),
//         ),
//         const SizedBox(height: 20),
//       ],
//     );
//   }
//
//   Widget _buildDropdownField(
//     String label,
//     List<String> options,
//     String? selectedValue,
//     ValueChanged<String?> onChanged,
//   ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             color: Colors.black,
//           ),
//         ),
//         const SizedBox(height: 5),
//         DropdownButtonFormField<String>(
//           value: selectedValue,
//           onChanged: onChanged,
//           items:
//               options
//                   .map((e) => DropdownMenuItem(value: e, child: Text(e)))
//                   .toList(),
//           decoration: InputDecoration(
//             hintText: 'Select',
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//           ),
//         ),
//         const SizedBox(height: 20),
//       ],
//     );
//   }
//
//   Widget _buildDatePicker(BasicDetailsProvider provider) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           "Date of Birth",
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             color: Colors.black,
//           ),
//         ),
//         const SizedBox(height: 5),
//         TextField(
//           readOnly: true,
//           controller: TextEditingController(
//             text:
//                 provider.dateOfBirth != null
//                     ? "${provider.dateOfBirth!.month}-${provider.dateOfBirth!.day}-${provider.dateOfBirth!.year}"
//                     : "",
//           ),
//           onTap: () => _selectDate(context),
//           decoration: InputDecoration(
//             hintText: "MM-DD-YYYY",
//             suffixIcon: const Icon(Icons.calendar_month, color: Colors.grey),
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//           ),
//         ),
//         const SizedBox(height: 20),
//       ],
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../providers/auth_provider.dart';

class BasicDetailsTab extends StatefulWidget {
  const BasicDetailsTab({super.key});

  @override
  State<BasicDetailsTab> createState() => _BasicDetailsTabState();
}

class _BasicDetailsTabState extends State<BasicDetailsTab> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(BuildContext context) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Provider.of<BasicDetailsProvider>(context, listen: false)
          .setImage(File(pickedFile.path));
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final provider = Provider.of<BasicDetailsProvider>(context, listen: false);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: provider.dateOfBirth ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) provider.setDateOfBirth(picked);
  }

  Future<void> _getUserLocation(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location services are disabled.')),
      );
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permission denied.')),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Location permission permanently denied.')),
      );
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final provider = Provider.of<BasicDetailsProvider>(context, listen: false);
    provider.setLocation(
        position.latitude.toString(), position.longitude.toString());

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('latitude', position.latitude.toString());
    await prefs.setString('longitude', position.longitude.toString());

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Location saved successfully.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BasicDetailsProvider>(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfilePicture(provider),
          const SizedBox(height: 40),
          _buildInputRow(
            context,
            "First Name",
            provider.firstName,
            provider.setFirstName,
            "Last Name",
            provider.lastName,
            provider.setLastName,
          ),
          _buildInputField("Username", provider.username, provider.setUsername),
          _buildInputField("Email Address", provider.email, provider.setEmail),
          _buildInputField(
              "Mobile Number", provider.mobile, provider.setMobile),
          _buildDropdownField(
            "Gender",
            ["Male", "Female", "Other"],
            provider.gender,
            provider.setGender,
          ),
          _buildDatePicker(provider),
          _buildDropdownField(
            "Relationship Status",
            ["Single", "Married", "Other"],
            provider.relationshipStatus,
            provider.setRelationshipStatus,
          ),
          _buildDropdownField(
            "Type of Relationship Sought",
            ["Friendship", "Networking", "Dating", "Other"],
            provider.relationshipType,
            provider.setRelationshipType,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () => _getUserLocation(context),
              icon: const Icon(Icons.location_on),
              label: const Text('Access Location'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfilePicture(BasicDetailsProvider provider) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            radius: 57,
            backgroundColor: const Color(0xFF343434),
            backgroundImage: provider.profileImage != null
                ? FileImage(provider.profileImage!)
                : null,
          ),
          Positioned(
            bottom: -14,
            child: GestureDetector(
              onTap: () => _pickImage(context),
              child: const CircleAvatar(
                radius: 16,
                backgroundColor: Color(0xFF797979),
                child: Icon(Icons.camera_alt, size: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputRow(
    BuildContext context,
    String label1,
    String value1,
    Function(String) onChanged1,
    String label2,
    String value2,
    Function(String) onChanged2,
  ) {
    return Row(
      children: [
        Expanded(child: _buildInputField(label1, value1, onChanged1)),
        const SizedBox(width: 10),
        Expanded(child: _buildInputField(label2, value2, onChanged2)),
      ],
    );
  }

  Widget _buildInputField(
    String label,
    String value,
    Function(String) onChanged,
  ) {
    final controller = TextEditingController(text: value);
    controller.selection = TextSelection.collapsed(
      offset: controller.text.length,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: "Enter",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildDropdownField(
    String label,
    List<String> options,
    String? selectedValue,
    ValueChanged<String?> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        const SizedBox(height: 5),
        DropdownButtonFormField<String>(
          value: selectedValue,
          onChanged: onChanged,
          items: options
              .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              .toList(),
          decoration: InputDecoration(
            hintText: 'Select',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildDatePicker(BasicDetailsProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Date of Birth",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        const SizedBox(height: 5),
        TextField(
          readOnly: true,
          controller: TextEditingController(
            text: provider.dateOfBirth != null
                ? "${provider.dateOfBirth!.month}-${provider.dateOfBirth!.day}-${provider.dateOfBirth!.year}"
                : "",
          ),
          onTap: () => _selectDate(context),
          decoration: InputDecoration(
            hintText: "MM-DD-YYYY",
            suffixIcon: const Icon(Icons.calendar_month, color: Colors.grey),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
