import 'package:flutter/material.dart';
import 'package:sec_me/manager/style_manager.dart';
import 'package:sec_me/components/feedback_container.dart';
import 'package:go_router/go_router.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feedback',
          style: AppTextStyles.headline1,
        ),
        backgroundColor: AppColors.primaryColorShade,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(
                Icons.bug_report,
                size: 36,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: super.key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FeedbackContainer(
                question: 'comment ça va toi ?',
                answerHint: 'bien',
              ),
              const FeedbackContainer(
                question: 'comment ça va toi ?',
                answerHint: 'bien',
              ),
              const FeedbackContainer(
                question: 'comment ça va toi ?',
                answerHint: 'bien',
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => GoRouter.of(context).go('/home'),
                child: const Text('Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
