import 'package:flutter/material.dart';

class ViewFeedback extends StatelessWidget {
  const ViewFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('View Feedback'),
        ),
        body: const Center(
          child: Text('List of Feedbacks'),
        ),
      ),
    );
  }
}
