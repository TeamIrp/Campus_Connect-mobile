import 'package:flutter/material.dart';

import '../tabs/profile_appbar.dart';

class MyProfileStepTwoScreen extends StatelessWidget {
  const MyProfileStepTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBar(title: 'My Profile'),
      body: const Center(
        child: Text(
          'Welcome to Step 2 of Your Profile',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
