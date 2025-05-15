// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../../../providers/my_profile_provider.dart';
// import '../../widgets/profile_appbar.dart';
// import 'my_profile_step_three_screen.dart';
//
// class MyProfileStepTwoScreen extends StatelessWidget {
//   const MyProfileStepTwoScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final p = Provider.of<ProfileProvider>(context);
//     return Scaffold(
//       appBar: const ProfileAppBar(title: 'My Profile'),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           const SizedBox(height: 10),
//           _sectionTitle('Personal Information'),
//           const SizedBox(height: 10),
//           _label('Interests'),
//           const SizedBox(height: 10),
//           _chipSelector(
//             p.interestsOptions,
//             p.selectedInterests,
//             onTap: p.toggleInterest,
//             multiple: true,
//           ),
//           const SizedBox(height: 10),
//           _label('Relationship Status'),
//           const SizedBox(height: 10),
//           _dropdownSelector(
//             p.relationshipStatusOptions,
//             p.stepTwoRelationshipStatus,
//             p.setStepTwoRelationshipStatus,
//           ),
//           const SizedBox(height: 10),
//           _label('Height (in cm)'),
//           const SizedBox(height: 10),
//           TextField(
//             controller: p.heightController,
//             keyboardType: TextInputType.number,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: const BorderSide(color: Color(0xFF797979)),
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),
//           _label('Any Disability'),
//           Row(
//             children: ['Yes', 'No'].map((opt) {
//               return Row(
//                 children: [
//                   Radio<String>(
//                     value: opt,
//                     groupValue: p.disability,
//                     onChanged: p.setDisability,
//                     activeColor:
//                         Color(0xFF1D97D4), // Set custom selected color here
//                   ),
//                   Text(opt),
//                   const SizedBox(width: 10),
//                 ],
//               );
//             }).toList(),
//           ),
//           const SizedBox(height: 10),
//           _label('Complexion'),
//           const SizedBox(height: 10),
//           _dropdownSelector(
//               p.complexionOptions, p.selectedComplexion, p.setComplexion),
//           const SizedBox(height: 10),
//           _label('Body Type'),
//           _dropdownSelector(
//               p.bodyTypeOptions, p.selectedBodyType, p.setBodyType),
//           const SizedBox(height: 25),
//           _sectionTitle('Life Styles'),
//           const SizedBox(height: 10),
//           _lifestyleChips('Diet', p.dietOptions, p.selectedDiet, p.setDiet),
//           const SizedBox(height: 10),
//           _lifestyleChips('Drink', p.drinkOptions, p.selectedDrink, p.setDrink),
//           const SizedBox(height: 10),
//           _lifestyleChips(
//               'Smoker', p.smokeOptions, p.selectedSmoke, p.setSmoke),
//           const SizedBox(height: 25),
//           _sectionTitle('Meeting Preference'),
//           const SizedBox(height: 10),
//           _lifestyleChips('Gender sought', p.genderSoughtOptions,
//               p.genderSought, p.setGenderSought),
//           const SizedBox(height: 10),
//           _label('Age sought'),
//           _rangeSlider(
//             p.ageRange,
//             min: 18,
//             max: 60,
//             onChanged: p.setAgeRange,
//             unit: 'yrs',
//           ),
//           const SizedBox(height: 10),
//           _label('Maximum Distance'),
//           _rangeSlider(
//             p.distanceRange,
//             min: 0,
//             max: 25,
//             onChanged: p.setDistanceRange,
//             unit: 'km',
//           ),
//           const SizedBox(height: 10),
//           _label('Type of relationship sought'),
//           _chipSelector(
//             p.relationshipTypeOptions,
//             p.selectedRelationshipTypes,
//             onTap: p.toggleRelationshipType,
//             multiple: true,
//           ),
//           const SizedBox(height: 10),
//           _label('What personality type do you think you have?'),
//           _chipSelector(
//             p.personalityOptions,
//             p.selectedPersonalities,
//             onTap: p.togglePersonality,
//             multiple: true,
//           ),
//           const SizedBox(height: 20),
//           SizedBox(
//             width: double.infinity,
//             height: 52,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF1D97D4),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(7)),
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (_) => const MyProfileStepThreeScreen()),
//                 );
//               },
//               child: const Text(
//                 "Update: Next",
//                 style: TextStyle(
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w600,
//                     fontSize: 16,
//                     color: Colors.white),
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
//
//   Widget _sectionTitle(String t) => Text(
//         t,
//         style: const TextStyle(
//             fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 18),
//       );
//
//   Widget _label(String t) => Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8),
//         child: Text(t,
//             style: const TextStyle(
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.w500,
//                 fontSize: 16)),
//       );
//
//   Widget _dropdownSelector(
//     List<String> opts,
//     String? val,
//     ValueChanged<String?> onChanged,
//   ) =>
//       Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         decoration: BoxDecoration(
//             border: Border.all(color: const Color(0xFF797979)),
//             borderRadius: BorderRadius.circular(10)),
//         child: DropdownButton<String>(
//           value: val,
//           isExpanded: true,
//           underline: const SizedBox(),
//           onChanged: onChanged,
//           items: opts
//               .map((o) => DropdownMenuItem(value: o, child: Text(o)))
//               .toList(),
//         ),
//       );
//
//   Widget _chipSelector(
//     List<String> opts,
//     List<String> sel, {
//     required void Function(String) onTap,
//     bool multiple = false,
//   }) =>
//       Wrap(
//         spacing: 10,
//         runSpacing: 10,
//         children: opts.map((o) {
//           final seld = sel.contains(o);
//           return InkWell(
//             onTap: () => onTap(o),
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//               decoration: BoxDecoration(
//                 color: seld ? const Color(0xFF1D97D4) : Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: const [
//                   BoxShadow(color: Colors.black26, blurRadius: 4)
//                 ],
//               ),
//               child: Text(
//                 o,
//                 style: TextStyle(
//                     color: seld ? Colors.white : Colors.black,
//                     fontFamily: 'Inter',
//                     fontSize: 14),
//               ),
//             ),
//           );
//         }).toList(),
//       );
//
//   Widget _lifestyleChips(
//     String label,
//     List<String> opts,
//     String? sel,
//     ValueChanged<String> onChanged,
//   ) =>
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _label(label),
//           Wrap(
//             spacing: 10,
//             runSpacing: 10,
//             children: opts.map((o) {
//               final isSel = o == sel;
//               return GestureDetector(
//                 onTap: () => onChanged(o),
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: isSel ? const Color(0xFF1D97D4) : Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                     boxShadow: const [
//                       BoxShadow(color: Colors.black26, blurRadius: 4)
//                     ],
//                   ),
//                   child: Text(
//                     o,
//                     style: TextStyle(
//                         color: isSel ? Colors.white : Colors.black,
//                         fontFamily: 'Inter',
//                         fontSize: 14),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//         ],
//       );
//
//   Widget _rangeSlider(
//     RangeValues vals, {
//     required double min,
//     required double max,
//     required ValueChanged<RangeValues> onChanged,
//     required String unit,
//   }) =>
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SliderTheme(
//             data: SliderThemeData(
//               activeTrackColor: Color(0xFF1D97D4),
//               inactiveTrackColor: Color(0xFF1D97D4).withOpacity(0.3),
//               thumbColor: Color(0xFF1D97D4),
//               overlayColor: Color(0xFF1D97D4).withOpacity(0.2),
//               rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
//               rangeThumbShape: const RoundRangeSliderThumbShape(),
//               trackHeight: 4.0,
//             ),
//             child: RangeSlider(
//               values: vals,
//               min: min,
//               max: max,
//               labels: RangeLabels(
//                 '${vals.start.round()}$unit',
//                 '${vals.end.round()}$unit',
//               ),
//               onChanged: onChanged,
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('${vals.start.round()}$unit'),
//               Text('${vals.end.round()}$unit'),
//             ],
//           ),
//         ],
//       );
// }

//
// -------------------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../../../providers/my_profile_provider.dart';
import '../../widgets/profile_appbar.dart';
import 'my_profile_step_three_screen.dart';

class MyProfileStepTwoScreen extends StatelessWidget {
  const MyProfileStepTwoScreen({Key? key}) : super(key: key);

  bool _isValid(ProfileProvider p) {
    return p.selectedInterests.isNotEmpty &&
        p.stepTwoRelationshipStatus != null &&
        p.heightController.text.trim().isNotEmpty &&
        p.disability != null &&
        p.selectedComplexion != null &&
        p.selectedBodyType != null &&
        p.selectedDiet != null &&
        p.selectedDrink != null &&
        p.selectedSmoke != null &&
        p.genderSought != null &&
        p.selectedRelationshipTypes.isNotEmpty &&
        p.selectedPersonalities.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<ProfileProvider>(context);

    return Scaffold(
      appBar: const ProfileAppBar(title: 'My Profile'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 10),
          _sectionTitle('Personal Information'),
          const SizedBox(height: 10),
          _label('Interests'),
          const SizedBox(height: 10),
          _chipSelector(
            p.interestsOptions,
            p.selectedInterests,
            onTap: p.toggleInterest,
            multiple: true,
          ),
          const SizedBox(height: 10),
          _label('Relationship Status'),
          const SizedBox(height: 10),
          _dropdownSelector(
            p.relationshipStatusOptions,
            p.stepTwoRelationshipStatus,
            p.setStepTwoRelationshipStatus,
          ),
          const SizedBox(height: 10),
          _label('Height (in cm)'),
          const SizedBox(height: 10),
          TextField(
            controller: p.heightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFF797979)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          _label('Any Disability'),
          Row(
            children: ['Yes', 'No'].map((opt) {
              return Row(
                children: [
                  Radio<String>(
                    value: opt,
                    groupValue: p.disability,
                    onChanged: p.setDisability,
                    activeColor: const Color(0xFF1D97D4),
                  ),
                  Text(opt),
                  const SizedBox(width: 10),
                ],
              );
            }).toList(),
          ),
          const SizedBox(height: 10),
          _label('Complexion'),
          const SizedBox(height: 10),
          _dropdownSelector(
              p.complexionOptions, p.selectedComplexion, p.setComplexion),
          const SizedBox(height: 10),
          _label('Body Type'),
          _dropdownSelector(
              p.bodyTypeOptions, p.selectedBodyType, p.setBodyType),
          const SizedBox(height: 25),
          _sectionTitle('Life Styles'),
          const SizedBox(height: 10),
          _lifestyleChips('Diet', p.dietOptions, p.selectedDiet, p.setDiet),
          const SizedBox(height: 10),
          _lifestyleChips('Drink', p.drinkOptions, p.selectedDrink, p.setDrink),
          const SizedBox(height: 10),
          _lifestyleChips(
              'Smoker', p.smokeOptions, p.selectedSmoke, p.setSmoke),
          const SizedBox(height: 25),
          _sectionTitle('Meeting Preference'),
          const SizedBox(height: 10),
          _lifestyleChips('Gender sought', p.genderSoughtOptions,
              p.genderSought, p.setGenderSought),
          const SizedBox(height: 10),
          _label('Age sought'),
          _rangeSlider(
            p.ageRange,
            min: 18,
            max: 60,
            onChanged: p.setAgeRange,
            unit: 'yrs',
          ),
          const SizedBox(height: 10),
          _label('Maximum Distance'),
          _rangeSlider(
            p.distanceRange,
            min: 0,
            max: 25,
            onChanged: p.setDistanceRange,
            unit: 'km',
          ),
          const SizedBox(height: 10),
          _label('Type of relationship sought'),
          _chipSelector(
            p.relationshipTypeOptions,
            p.selectedRelationshipTypes,
            onTap: p.toggleRelationshipType,
            multiple: true,
          ),
          const SizedBox(height: 10),
          _label('What personality type do you think you have?'),
          _chipSelector(
            p.personalityOptions,
            p.selectedPersonalities,
            onTap: p.togglePersonality,
            multiple: true,
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1D97D4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
              ),
              onPressed: () {
                if (_isValid(p)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const MyProfileStepThreeScreen()),
                  );
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
              child: const Text(
                "Update: Next",
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _sectionTitle(String t) => Text(
        t,
        style: const TextStyle(
            fontFamily: 'Inter', fontWeight: FontWeight.w600, fontSize: 18),
      );

  Widget _label(String t) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(t,
            style: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 16)),
      );

  Widget _dropdownSelector(
    List<String> opts,
    String? val,
    ValueChanged<String?> onChanged,
  ) =>
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF797979)),
            borderRadius: BorderRadius.circular(10)),
        child: DropdownButton<String>(
          value: val,
          isExpanded: true,
          underline: const SizedBox(),
          onChanged: onChanged,
          items: opts
              .map((o) => DropdownMenuItem(value: o, child: Text(o)))
              .toList(),
        ),
      );

  Widget _chipSelector(
    List<String> opts,
    List<String> sel, {
    required void Function(String) onTap,
    bool multiple = false,
  }) =>
      Wrap(
        spacing: 10,
        runSpacing: 10,
        children: opts.map((o) {
          final seld = sel.contains(o);
          return InkWell(
            onTap: () => onTap(o),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: seld ? const Color(0xFF1D97D4) : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 4)
                ],
              ),
              child: Text(
                o,
                style: TextStyle(
                    color: seld ? Colors.white : Colors.black,
                    fontFamily: 'Inter',
                    fontSize: 14),
              ),
            ),
          );
        }).toList(),
      );

  Widget _lifestyleChips(
    String label,
    List<String> opts,
    String? sel,
    ValueChanged<String> onChanged,
  ) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label(label),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: opts.map((o) {
              final isSel = o == sel;
              return GestureDetector(
                onTap: () => onChanged(o),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isSel ? const Color(0xFF1D97D4) : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(color: Colors.black26, blurRadius: 4)
                    ],
                  ),
                  child: Text(
                    o,
                    style: TextStyle(
                        color: isSel ? Colors.white : Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 14),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      );

  Widget _rangeSlider(
    RangeValues vals, {
    required double min,
    required double max,
    required ValueChanged<RangeValues> onChanged,
    required String unit,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SliderTheme(
            data: SliderThemeData(
              activeTrackColor: const Color(0xFF1D97D4),
              inactiveTrackColor: const Color(0xFF1D97D4).withOpacity(0.3),
              thumbColor: const Color(0xFF1D97D4),
              overlayColor: const Color(0xFF1D97D4).withOpacity(0.2),
              rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
              rangeThumbShape: const RoundRangeSliderThumbShape(),
              trackHeight: 4.0,
            ),
            child: RangeSlider(
              values: vals,
              min: min,
              max: max,
              labels: RangeLabels(
                '${vals.start.round()}$unit',
                '${vals.end.round()}$unit',
              ),
              onChanged: onChanged,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${vals.start.round()}$unit'),
              Text('${vals.end.round()}$unit'),
            ],
          ),
        ],
      );
}
