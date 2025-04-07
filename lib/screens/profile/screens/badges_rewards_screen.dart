import 'package:flutter/material.dart';

class BadgesRewardsScreen extends StatelessWidget {
  const BadgesRewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBackButton(context),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Badges & Rewards',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text("Your achievements, badges and rewards."),
        ),
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 10),
      child: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
