import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/professional_project_provider.dart';

class ProfessionalProjectTab extends StatefulWidget {
  const ProfessionalProjectTab({super.key});

  @override
  _ProfessionalProjectTabState createState() => _ProfessionalProjectTabState();
}

class _ProfessionalProjectTabState extends State<ProfessionalProjectTab> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ProfessionalProjectProvider>(
      context,
      listen: false,
    );
    _controller = TextEditingController(text: provider.projectText);
    _controller.addListener(() {
      provider.updateText(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Professional Goals or Projects",
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
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height: 1.0,
                    color: Colors.black,
                  ),
                  decoration: const InputDecoration(
                    hintText:
                        "I Want To Have A Master In Statistics Because I'd Like To Become A Banker",
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
}
