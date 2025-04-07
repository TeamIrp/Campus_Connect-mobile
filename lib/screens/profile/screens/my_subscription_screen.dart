import 'package:flutter/material.dart';

class MySubscriptionScreen extends StatelessWidget {
  const MySubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'My Subscription',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        // Replace this with your actual subscription UI
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text("Subscription details go here."),
        ),
      ],
    );
  }
}
