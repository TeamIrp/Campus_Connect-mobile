// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:provider/provider.dart';
// import '../../../../providers/my_profile_provider.dart';
// import '../../widgets/profile_appbar.dart';
// import 'my_profile_step_two_screen.dart';
//
// class YourProfileScreen extends StatelessWidget {
//   const YourProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => ProfileProvider(),
//       child: const _YourProfileBody(),
//     );
//   }
// }
//
// class _YourProfileBody extends StatefulWidget {
//   const _YourProfileBody();
//
//   @override
//   State<_YourProfileBody> createState() => _YourProfileBodyState();
// }
//
// class _YourProfileBodyState extends State<_YourProfileBody> {
//   final _formKey = GlobalKey<FormState>();
//
//   Widget field(String label, TextEditingController c) => Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(label,
//               style:
//                   const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
//           const SizedBox(height: 5),
//           TextFormField(
//             controller: c,
//             validator: (val) =>
//                 val == null || val.trim().isEmpty ? 'Required' : null,
//             decoration: InputDecoration(
//               hintText: 'Enter',
//               border:
//                   OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//             ),
//           ),
//           const SizedBox(height: 20),
//         ],
//       );
//
//   Widget dropdown(String label, List<String> opts, String? val,
//       ValueChanged<String?> onChanged) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
//         const SizedBox(height: 5),
//         DropdownButtonFormField<String>(
//           value: val,
//           validator: (value) =>
//               value == null || value.isEmpty ? 'Required' : null,
//           items: opts
//               .map((e) => DropdownMenuItem(value: e, child: Text(e)))
//               .toList(),
//           onChanged: onChanged,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//           ),
//         ),
//         const SizedBox(height: 20),
//       ],
//     );
//   }
//
//   Widget section(String title) => Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         child: Text(title,
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//       );
//
//   @override
//   Widget build(BuildContext context) {
//     final p = Provider.of<ProfileProvider>(context);
//     final pad = MediaQuery.of(context).size.width * 0.05;
//
//     final double lat = double.tryParse(p.latitude) ?? 48.8566;
//     final double lng = double.tryParse(p.longitude) ?? 2.3522;
//     final LatLng userLocation = LatLng(lat, lng);
//
//     return Scaffold(
//       appBar: const ProfileAppBar(title: 'My Profile'),
//       body: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         padding: EdgeInsets.symmetric(horizontal: pad, vertical: 20),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // ─── Profile pic ───────────────────────────
//               Center(
//                 child: Stack(
//                   alignment: Alignment.bottomCenter,
//                   clipBehavior: Clip.none,
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(
//                               color: const Color(0xFFFF9500), width: 3)),
//                       child: CircleAvatar(
//                         radius: 57,
//                         backgroundColor: const Color(0xFF343434),
//                         backgroundImage: p.profileImage != null
//                             ? FileImage(p.profileImage!)
//                             : null,
//                       ),
//                     ),
//                     Positioned(
//                       bottom: -14,
//                       child: GestureDetector(
//                         onTap: p.pickProfileImage,
//                         child: const CircleAvatar(
//                           radius: 16,
//                           backgroundColor: Color(0xFF1D97D4),
//                           child: Icon(Icons.camera_alt,
//                               size: 16, color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//               const SizedBox(height: 40),
//
//               // ─── Upload Photos Section ─────────────────────
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Upload the Photos',
//                     style: TextStyle(
//                       fontFamily: 'Inter',
//                       fontWeight: FontWeight.w600,
//                       fontSize: 18,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     height: 100,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: p.selectedImages.length + 1,
//                       itemBuilder: (_, i) {
//                         if (i == p.selectedImages.length) {
//                           return GestureDetector(
//                             onTap: p.pickMultipleImages,
//                             child: Container(
//                               width: 100,
//                               margin: const EdgeInsets.only(right: 10),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 image: const DecorationImage(
//                                   image:
//                                       AssetImage('assets/images/add-image.png'),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                           );
//                         }
//                         return Container(
//                           width: 100,
//                           margin: const EdgeInsets.only(right: 10),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8),
//                             image: DecorationImage(
//                               image: FileImage(p.selectedImages[i]),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//
//               const SizedBox(height: 20),
//
//               // ─── Form Fields ─────────────────────────────
//               field("First Name", p.firstNameController),
//               field("Last Name", p.lastNameController),
//               field("Username", p.usernameController),
//               field("Email Address", p.emailController),
//               field("Mobile Number", p.mobileController),
//
//               dropdown("Gender", ["Male", "Female", "Other"], p.selectedGender,p.setGender),
//
//               // Date Picker
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text("Date of Birth",
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
//                   const SizedBox(height: 5),
//                   GestureDetector(
//                     onTap: () async {
//                       final d = await showDatePicker(
//                         context: context,
//                         initialDate: p.selectedDate ?? DateTime.now(),
//                         firstDate: DateTime(1900),
//                         lastDate: DateTime(2100),
//                       );
//                       if (d != null) p.setDate(d);
//                     },
//                     child: AbsorbPointer(
//                       child: TextFormField(
//                         controller: TextEditingController(
//                           text: p.selectedDate == null
//                               ? ''
//                               : '${p.selectedDate!.month}-${p.selectedDate!.day}-${p.selectedDate!.year}',
//                         ),
//                         validator: (val) => val == null || val.trim().isEmpty
//                             ? 'Required'
//                             : null,
//                         decoration: InputDecoration(
//                           hintText: "MM-DD-YYYY",
//                           suffixIcon: const Icon(Icons.calendar_month,
//                               color: Colors.grey),
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                 ],
//               ),
//
//               dropdown("Relationship Status", ["Single", "Married", "Other"],p.selectedRelationshipStatus, p.setRelationshipStatus),
//
//               dropdown(
//                   "Type of Relationship Sought",
//                   ["Friendship", "Networking", "Dating", "Other"],
//                   p.selectedRelationshipType,
//                   p.setRelationshipType),
//
//               section("Address Details"),
//               dropdown("City", ["Paris", "London", "Berlin"], p.selectedCity,
//                   p.setCity),
//               dropdown("Region", ["Paris", "London", "Berlin"],
//                   p.selectedRegion, p.setRegion),
//
//               // ─── Map ─────────────────────────────────
//               Container(
//                 width: double.infinity,
//                 height: 120,
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey.shade400),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: FlutterMap(
//                     options: MapOptions(
//                         initialCenter: userLocation, initialZoom: 15),
//                     children: [
//                       TileLayer(
//                         urlTemplate:
//                             "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//                         subdomains: ['a', 'b', 'c'],
//                       ),
//                       MarkerLayer(
//                         markers: [
//                           Marker(
//                             point: userLocation,
//                             width: 40,
//                             height: 40,
//                             child: const Icon(Icons.location_pin,
//                                 color: Colors.red, size: 40),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 20),
//
//               dropdown(
//                 "Community",
//                 ["Community 1", "Community 2", "Community 3"],
//                 p.selectedCommunity,
//                 p.setCommunity,
//               ),
//
//               dropdown(
//                 "Sub-Community",
//                 ["Sub-Community 1", "Sub-Community 2"],
//                 p.selectedSubCommunity,
//                 p.setSubCommunity,
//               ),
//
//               section("Astrological Details"),
//               dropdown(
//                   "Select Sign",
//                   [
//                     "Pisces",
//                     "Aries",
//                     "Taurus",
//                     "Gemini",
//                     "Cancer",
//                     "Leo",
//                     "Virgo",
//                     "Libra",
//                     "Scorpio",
//                     "Sagittarius",
//                     "Capricorn",
//                     "Aquarius"
//                   ],
//                   p.selectedZodiac,
//                   p.setZodiac),
//
//               const SizedBox(height: 10),
//               SizedBox(
//                 width: double.infinity,
//                 height: 52,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF1D97D4),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(7)),
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 15, vertical: 10),
//                   ),
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (_) => const MyProfileStepTwoScreen()));
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                         content: Text('Please fill all the fields'),
//                         backgroundColor: Colors.red,
//                       ));
//                     }
//                   },
//                   child: const Text("Update: Next",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           fontSize: 16,
//                           color: Colors.white)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../providers/my_profile_provider.dart';
import '../../widgets/profile_appbar.dart';
import 'my_profile_step_two_screen.dart';

class YourProfileScreen extends StatelessWidget {
  const YourProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileProvider(),
      child: const _YourProfileBody(),
    );
  }
}

class _YourProfileBody extends StatefulWidget {
  const _YourProfileBody();

  @override
  State<_YourProfileBody> createState() => _YourProfileBodyState();
}

class _YourProfileBodyState extends State<_YourProfileBody> {
  final _formKey = GlobalKey<FormState>();

  Widget field(String label, TextEditingController controller,
      {String? Function(String?)? validator}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          keyboardType: label.toLowerCase().contains("mobile")
              ? TextInputType.phone
              : null,
          validator: validator ??
              (val) => val == null || val.trim().isEmpty ? 'Required' : null,
          decoration: InputDecoration(
            hintText: 'Enter',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 20),
      ],
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

  Widget section(String title) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      );

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<ProfileProvider>(context);
    final pad = MediaQuery.of(context).size.width * 0.05;

    final double lat = double.tryParse(p.latitude) ?? 48.8566;
    final double lng = double.tryParse(p.longitude) ?? 2.3522;
    final LatLng userLocation = LatLng(lat, lng);

    return Scaffold(
      appBar: const ProfileAppBar(title: 'My Profile'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: pad, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Profile pic ───────────────────────────
            Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color(0xFFFF9500), width: 3)),
                    child: CircleAvatar(
                      radius: 57,
                      backgroundColor: const Color(0xFF343434),
                      backgroundImage: p.profileImage != null
                          ? FileImage(p.profileImage!)
                          : null,
                    ),
                  ),
                  Positioned(
                    bottom: -14,
                    child: GestureDetector(
                      onTap: p.pickProfileImage,
                      child: const CircleAvatar(
                        radius: 16,
                        backgroundColor: Color(0xFF1D97D4),
                        child: Icon(Icons.camera_alt,
                            size: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // ─── Upload Photos ──────────────────────────
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Upload the Photos',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: p.selectedImages.length + 1,
                    itemBuilder: (_, i) {
                      if (i == p.selectedImages.length) {
                        return GestureDetector(
                          onTap: p.pickMultipleImages,
                          child: Container(
                            width: 100,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/add-image.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }
                      return Container(
                        width: 100,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: FileImage(p.selectedImages[i]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ─── Form Fields ─────────────────────────────
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  field("First Name", p.firstNameController),
                  field("Last Name", p.lastNameController),
                  field("Username", p.usernameController),
                  field("Email Address", p.emailController),
                  field("Mobile Number", p.mobileController, validator: (val) {
                    if (val == null || val.trim().isEmpty) {
                      return 'Required';
                    } else if (!RegExp(r'^\d{10}$').hasMatch(val.trim())) {
                      return 'Mobile number must be exactly 10 digits';
                    }
                    return null;
                  }),

                  dropdown("Gender", ["Male", "Female", "Other"],
                      p.selectedGender, p.setGender),

                  // Date Picker
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Date of Birth",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 5),
                      GestureDetector(
                        onTap: () async {
                          final d = await showDatePicker(
                            context: context,
                            initialDate: p.selectedDate ?? DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          if (d != null) p.setDate(d);
                        },
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: TextEditingController(
                              text: p.selectedDate == null
                                  ? ''
                                  : '${p.selectedDate!.month}-${p.selectedDate!.day}-${p.selectedDate!.year}',
                            ),
                            validator: (val) =>
                                val == null || val.trim().isEmpty
                                    ? 'Required'
                                    : null,
                            decoration: InputDecoration(
                              hintText: "MM-DD-YYYY",
                              suffixIcon: const Icon(Icons.calendar_month,
                                  color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),

                  dropdown(
                      "Relationship Status",
                      ["Single", "Married", "Other"],
                      p.selectedRelationshipStatus,
                      p.setRelationshipStatus),

                  dropdown(
                      "Type of Relationship Sought",
                      ["Friendship", "Networking", "Dating", "Other"],
                      p.selectedRelationshipType,
                      p.setRelationshipType),

                  section("Address Details"),
                  dropdown("City", ["Paris", "London", "Berlin"],
                      p.selectedCity, p.setCity),
                  dropdown("Region", ["Paris", "London", "Berlin"],
                      p.selectedRegion, p.setRegion),

                  const SizedBox(height: 10),
                  // ─── Map ───────────────────────────────
                  Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FlutterMap(
                        options: MapOptions(
                            initialCenter: userLocation, initialZoom: 15),
                        children: [
                          TileLayer(
                            urlTemplate:
                                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: ['a', 'b', 'c'],
                          ),
                          MarkerLayer(
                            markers: [
                              Marker(
                                point: userLocation,
                                width: 40,
                                height: 40,
                                child: const Icon(Icons.location_pin,
                                    color: Colors.red, size: 40),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  dropdown(
                    "Community",
                    ["Community 1", "Community 2", "Community 3"],
                    p.selectedCommunity,
                    p.setCommunity,
                  ),

                  dropdown(
                    "Sub-Community",
                    ["Sub-Community 1", "Sub-Community 2"],
                    p.selectedSubCommunity,
                    p.setSubCommunity,
                  ),

                  section("Astrological Details"),
                  dropdown(
                      "Select Sign",
                      [
                        "Pisces",
                        "Aries",
                        "Taurus",
                        "Gemini",
                        "Cancer",
                        "Leo",
                        "Virgo",
                        "Libra",
                        "Scorpio",
                        "Sagittarius",
                        "Capricorn",
                        "Aquarius"
                      ],
                      p.selectedZodiac,
                      p.setZodiac),

                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1D97D4),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      const MyProfileStepTwoScreen()));
                        } else {
                          Fluttertoast.showToast(
                            msg: "Please fill all the fields",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                          );
                        }
                      },
                      child: const Text("Update: Next",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
