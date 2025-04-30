// import 'package:flutter/material.dart';
// import '../../widgets/profile_appbar.dart';
// import 'my_profile_step_three_screen.dart';
//
// class MyProfileStepTwoScreen extends StatefulWidget {
//   const MyProfileStepTwoScreen({super.key});
//
//   @override
//   State<MyProfileStepTwoScreen> createState() => _MyProfileStepTwoScreenState();
// }
//
// class _MyProfileStepTwoScreenState extends State<MyProfileStepTwoScreen> {
//   final List<String> _interests = [
//     "Cricket",
//     "Music",
//     "Book",
//     "Swimming",
//     "Photography",
//     "Football",
//   ];
//
//   final List<String> _relationshipStatusOptions = [
//     "Single",
//     "Married",
//     "Divorced",
//   ];
//   final List<String> _complexionOptions = ["Fair", "Wheatish", "Dark"];
//   final List<String> _bodyTypeOptions = ["Fit", "Average", "Muscular", "Heavy"];
//   final List<String> _dietOptions = [
//     "Vegetarian",
//     "Non-Vegetarian",
//     "Occasionally",
//   ];
//   final List<String> _drinkOptions = [
//     "Alcoholic",
//     "Non-Alcoholic",
//     "Occasionally",
//   ];
//   final List<String> _smokeOptions = ["Smoker", "Non-Smoker", "Occasionally"];
//   final List<String> _relationshipTypeOptions = [
//     "Adventure",
//     "Serious relationship",
//     "Friendship",
//     "Casual encounters",
//   ];
//   final List<String> _personalityOptions = [
//     "Introvert",
//     "Extrovert",
//     "Adventurous",
//     "Calm",
//   ];
//   final List<String> _genderSoughtOptions = ["Male", "Female"];
//
//   List<String> _selectedInterests = [];
//   String? _selectedRelationshipStatus;
//   String? _selectedComplexion;
//   String? _selectedBodyType;
//   String? _selectedDiet;
//   String? _selectedDrink;
//   String? _selectedSmoke;
//   String? _selectedGender;
//   List<String> _selectedRelationshipTypes = [];
//   List<String> _selectedPersonalities = [];
//   RangeValues _distanceRange = const RangeValues(5, 15);
//   RangeValues _ageRange = const RangeValues(20, 30);
//   String? _disability;
//   final TextEditingController _heightController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const ProfileAppBar(title: 'My Profile'),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 10),
//             _buildSectionTitle('Personal Information'),
//             const SizedBox(height: 10),
//             _buildLabel('Interests'),
//             const SizedBox(height: 10),
//             _buildChipSelector(_interests, _selectedInterests, multiple: true),
//             const SizedBox(height: 10),
//             _buildLabel('Relationship Status'),
//             const SizedBox(height: 10),
//             _buildDropdownSelector(
//               _relationshipStatusOptions,
//               _selectedRelationshipStatus,
//                   (val) => setState(() => _selectedRelationshipStatus = val),
//             ),
//             const SizedBox(height: 10),
//             _buildLabel('Height (in cm)'),
//             const SizedBox(height: 10),
//             _buildHeightInput(),
//             const SizedBox(height: 10),
//             _buildLabel('Any Disability'),
//             _buildRadioRow(
//               ['Yes', 'No'],
//               _disability,
//                   (value) => setState(() => _disability = value!),
//             ),
//             _buildLabel('Complexion'),
//             const SizedBox(height: 10),
//             _buildDropdownSelector(
//               _complexionOptions,
//               _selectedComplexion,
//                   (val) => setState(() => _selectedComplexion = val),
//             ),
//             const SizedBox(height: 10),
//             _buildLabel('Body Type'),
//             _buildDropdownSelector(
//               _bodyTypeOptions,
//               _selectedBodyType,
//                   (val) => setState(() => _selectedBodyType = val),
//             ),
//             const SizedBox(height: 10),
//             _buildSectionTitle('Life Styles'),
//             const SizedBox(height: 10),
//             _buildLifestyleSection(
//               'Diet',
//               _dietOptions,
//               _selectedDiet,
//                   (val) => setState(() => _selectedDiet = val),
//             ),
//             const SizedBox(height: 10),
//             _buildLifestyleSection(
//               'Drink',
//               _drinkOptions,
//               _selectedDrink,
//                   (val) => setState(() => _selectedDrink = val),
//             ),
//             const SizedBox(height: 10),
//             _buildLifestyleSection(
//               'Smoker',
//               _smokeOptions,
//               _selectedSmoke,
//                   (val) => setState(() => _selectedSmoke = val),
//             ),
//             const SizedBox(height: 25),
//             _buildSectionTitle('Meeting Preference'),
//             const SizedBox(height: 10),
//             _buildLifestyleSection(
//               'Gender sought',
//               _genderSoughtOptions,
//               _selectedGender,
//                   (val) => setState(() => _selectedGender = val),
//             ),
//             const SizedBox(height: 10),
//             _buildLabel('Age sought'),
//             _buildSimpleRangeSlider(
//               _ageRange,
//               18,
//               60,
//                   (val) => setState(() => _ageRange = val),
//               'yrs',
//             ),
//             const SizedBox(height: 10),
//             _buildLabel('Maximum Distance'),
//             _buildSimpleRangeSlider(
//               _distanceRange,
//               0,
//               25,
//                   (val) => setState(() => _distanceRange = val),
//               'km',
//             ),
//             const SizedBox(height: 10),
//             _buildLabel('Type of relationship sought'),
//             const SizedBox(height: 10),
//             _buildChipSelector(
//               _relationshipTypeOptions,
//               _selectedRelationshipTypes,
//               multiple: true,
//             ),
//             const SizedBox(height: 10),
//             _buildLabel('What personality type do you think you have?'),
//             const SizedBox(height: 10),
//             _buildChipSelector(
//               _personalityOptions,
//               _selectedPersonalities,
//               multiple: true,
//             ),
//             const SizedBox(height: 20),
//             _buildNextButton(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSimpleRangeSlider(
//       RangeValues values,
//       double min,
//       double max,
//       ValueChanged<RangeValues> onChanged,
//       String unit,
//       ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         RangeSlider(
//           values: values,
//           min: min,
//           max: max,
//           divisions: null,
//           labels: RangeLabels(
//             '${values.start.round()}$unit',
//             '${values.end.round()}$unit',
//           ),
//           activeColor: const Color(0xFF1D97D4),
//           onChanged: onChanged,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               '${values.start.round()}$unit',
//               style: const TextStyle(
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.w700,
//                 fontSize: 14,
//                 height: 1.0,
//                 letterSpacing: 0.0,
//                 color: Colors.black,
//               ),
//             ),
//             Text(
//               '${values.end.round()}$unit',
//               style: const TextStyle(
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.w700,
//                 fontSize: 14,
//                 height: 1.0,
//                 letterSpacing: 0.0,
//                 color: Colors.black,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildSectionTitle(String text) => Padding(
//     padding: const EdgeInsets.only(top: 0, bottom: 0),
//     child: Text(
//       text,
//       style: const TextStyle(
//         fontFamily: 'Inter',
//         fontWeight: FontWeight.w600,
//         fontSize: 18,
//         color: Colors.black,
//       ),
//     ),
//   );
//
//   Widget _buildLabel(String text) => Padding(
//     padding: const EdgeInsets.only(top: 10, bottom: 10),
//     child: Text(
//       text,
//       style: const TextStyle(
//         fontFamily: 'Inter',
//         fontWeight: FontWeight.w500,
//         fontSize: 16,
//       ),
//     ),
//   );
//
//   Widget _buildHeightInput() {
//     return TextField(
//       controller: _heightController,
//       keyboardType: TextInputType.number,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: const BorderSide(color: Color(0xFF797979)),
//         ),
//       ),
//       style: const TextStyle(
//         fontFamily: 'Inter',
//         fontSize: 16,
//         color: Colors.black,
//       ),
//     );
//   }
//
//   Widget _buildRadioRow(
//       List<String> options,
//       String? selected,
//       ValueChanged<String?> onChanged,
//       ) {
//     return Wrap(
//       children: options.map((option) {
//         return Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Radio<String>(
//               value: option,
//               groupValue: selected,
//               onChanged: onChanged,
//               activeColor: Colors.black,
//             ),
//             Text(
//               option,
//               style: const TextStyle(
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.w500,
//                 fontSize: 16,
//               ),
//             ),
//             const SizedBox(width: 10),
//           ],
//         );
//       }).toList(),
//     );
//   }
//
//   Widget _buildChipSelector(
//       List<String> options,
//       List<String> selectedOptions, {
//         bool multiple = false,
//       }) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         return Wrap(
//           spacing: 15,
//           runSpacing: 15,
//           children: options.map((option) {
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
//                 padding:
//                 const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
//         );
//       },
//     );
//   }
//
//   Widget _buildDropdownSelector(
//       List<String> options,
//       String? selectedValue,
//       ValueChanged<String?> onChanged,
//       ) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       decoration: BoxDecoration(
//         border: Border.all(color: const Color(0xFF797979)),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       width: double.infinity,
//       height: 52,
//       child: DropdownButton<String>(
//         value: selectedValue,
//         isExpanded: true,
//         icon: const Icon(
//           Icons.arrow_drop_down,
//           size: 16,
//           color: Color(0xFF797979),
//         ),
//         underline: const SizedBox(),
//         style: const TextStyle(
//           fontFamily: 'Inter',
//           fontSize: 16,
//           color: Colors.black,
//         ),
//         onChanged: onChanged,
//         items: options
//             .map((option) =>
//             DropdownMenuItem(value: option, child: Text(option)))
//             .toList(),
//       ),
//     );
//   }
//
//   Widget _buildLifestyleSection(
//       String title,
//       List<String> options,
//       String? selectedOption,
//       ValueChanged<String> onChanged,
//       ) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildLabel(title),
//         Wrap(
//           spacing: 10,
//           runSpacing: 10,
//           children: options.map((option) {
//             final isSelected = option == selectedOption;
//             return GestureDetector(
//               onTap: () => onChanged(option),
//               child: Container(
//                 padding:
//                 const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: isSelected ? const Color(0xFF1D97D4) : Colors.white,
//                   boxShadow: const [
//                     BoxShadow(color: Colors.black26, blurRadius: 4),
//                   ],
//                 ),
//                 child: Text(
//                   option,
//                   style: TextStyle(
//                     fontFamily: 'Inter',
//                     fontSize: 14,
//                     color: isSelected ? Colors.white : Colors.black,
//                   ),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildNextButton() {
//     return SizedBox(
//       width: double.infinity,
//       height: 52,
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color(0xFF1D97D4),
//           shape:
//           RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
//         ),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => const MyProfileStepThreeScreen()),
//           );
//         },
//         child: const Text(
//           "Update: Next",
//           style: TextStyle(
//             fontFamily: 'Inter',
//             fontWeight: FontWeight.w600,
//             fontSize: 16,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../providers/my_profile_provider.dart';
import '../../widgets/profile_appbar.dart';
import 'my_profile_step_three_screen.dart';

class MyProfileStepTwoScreen extends StatelessWidget {
  const MyProfileStepTwoScreen({Key? key}) : super(key: key);

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
                    activeColor:
                        Color(0xFF1D97D4), // Set custom selected color here
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const MyProfileStepThreeScreen()),
                );
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
              activeTrackColor: Color(0xFF1D97D4),
              inactiveTrackColor: Color(0xFF1D97D4).withOpacity(0.3),
              thumbColor: Color(0xFF1D97D4),
              overlayColor: Color(0xFF1D97D4).withOpacity(0.2),
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
