import 'package:flutter/material.dart';

class SubmissionScreen extends StatelessWidget {
  const SubmissionScreen({super.key});

  static const routeName = 'submission';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Submit a viral recipe coming soon'),
      ),
    );
  }
}
