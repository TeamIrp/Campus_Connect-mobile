import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/auth_provider.dart';

class AcademicProjectTab extends StatefulWidget {
  const AcademicProjectTab({super.key});

  @override
  _AcademicProjectTabState createState() => _AcademicProjectTabState();
}

class _AcademicProjectTabState extends State<AcademicProjectTab> {
  final FocusNode _focusNode = FocusNode();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<AcademicProjectProvider>(
      context,
      listen: false,
    );
    _controller = TextEditingController(text: provider.academicText);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AcademicProjectProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Current Academic Project",
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 360,
            height: 256,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF797979), width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  cursorColor: Colors.black,
                  selectionControls: _blackSelectionControls(),
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  onChanged: (value) => provider.setAcademicText(value),
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height: 1.0,
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    hintText: "I Want To Have A Master In Statistics",
                    hintStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 1.0,
                      color: Color(0xFFC4C0C0),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextSelectionControls _blackSelectionControls() {
    return MaterialTextSelectionControls();
  }
}
