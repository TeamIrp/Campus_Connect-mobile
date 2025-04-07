import 'package:flutter/material.dart';
import '../tabs/profile_appbar.dart';

class BuyCreditScreen extends StatelessWidget {
  const BuyCreditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProfileAppBar(title: 'Buy Credit'),
      body: const Center(child: Text('Credit purchase options')),
    );
  }
}
