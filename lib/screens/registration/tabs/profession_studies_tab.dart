import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/auth_provider.dart';

class ProfessionStudiesTab extends StatefulWidget {
  const ProfessionStudiesTab({super.key});

  @override
  State<ProfessionStudiesTab> createState() => _ProfessionStudiesTabState();
}

class _ProfessionStudiesTabState extends State<ProfessionStudiesTab> {
  final _occupationController = TextEditingController();
  final _academicFieldController = TextEditingController();
  final _universityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ProfessionStudiesProvider>(
      context,
      listen: false,
    );
    provider.loadData().then((_) {
      _occupationController.text = provider.occupation ?? '';
      _academicFieldController.text = provider.academicField ?? '';
      _universityController.text = provider.university ?? '';
    });
  }

  @override
  void dispose() {
    _occupationController.dispose();
    _academicFieldController.dispose();
    _universityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProfessionStudiesProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLabelWithOptional("Current or Intended Occupation"),
                const SizedBox(height: 10),
                _buildTextField(
                  _occupationController,
                  "Enter",
                  provider.updateOccupation,
                ),

                const SizedBox(height: 20),
                _buildLabelWithAsterisk("Academic Field"),
                const SizedBox(height: 10),
                _buildTextField(
                  _academicFieldController,
                  "Enter",
                  provider.updateAcademicField,
                ),

                const SizedBox(height: 20),
                _buildLabelWithAsterisk("Level of Studies"),
                const SizedBox(height: 10),
                _buildDropdownField(provider),

                const SizedBox(height: 20),
                _buildLabelWithAsterisk("University or School Attended"),
                const SizedBox(height: 10),
                _buildTextField(
                  _universityController,
                  "Enter",
                  provider.updateUniversity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabelWithOptional(String label) => Row(
    children: [
      Text(label, style: _labelStyle()),
      const SizedBox(width: 5),
      Text("(Optional)", style: _optionalStyle()),
    ],
  );

  Widget _buildLabelWithAsterisk(String label) => Row(
    children: [
      Text(label, style: _labelStyle()),
      const SizedBox(width: 5),
      const Text("*", style: TextStyle(color: Color(0xFFD31F34))),
    ],
  );

  Widget _buildTextField(
    TextEditingController controller,
    String hintText,
    Function(String) onChanged,
  ) {
    return SizedBox(
      width: 360,
      height: 52,
      child: TextField(
        controller: controller,
        cursorColor: Colors.black,
        decoration: _inputDecoration(hintText),
        style: const TextStyle(color: Colors.black),
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildDropdownField(ProfessionStudiesProvider provider) {
    List<String> levels = ["Undergraduate", "Graduate", "Doctorate"];
    String? selected =
        levels.contains(provider.levelOfStudies)
            ? provider.levelOfStudies
            : null;

    return SizedBox(
      width: 360,
      height: 52,
      child: DropdownButtonFormField<String>(
        value: selected,
        onChanged: provider.updateLevelOfStudies,
        items:
            levels
                .map(
                  (level) => DropdownMenuItem(value: level, child: Text(level)),
                )
                .toList(),
        decoration: _inputDecoration("Select"),
        icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF797979)),
      ),
    );
  }

  TextStyle _labelStyle() => const TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  TextStyle _optionalStyle() => const TextStyle(
    fontFamily: 'Inter',
    fontStyle: FontStyle.italic,
    fontSize: 12,
  );

  InputDecoration _inputDecoration(String hint) => InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(color: Color(0xFF797979)),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Color(0xFF797979)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.black),
    ),
  );
}
