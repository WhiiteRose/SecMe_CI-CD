import 'package:flutter/material.dart';
import 'package:sec_me/manager/style_manager.dart';

class FeedbackContainer extends StatelessWidget {
  // const FeedbackContainer({super.key});

  final String question;
  final String answerHint;

  const FeedbackContainer(
      {Key? key, required this.question, required this.answerHint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question,
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                style: const TextStyle(
                  color: AppColors.hinttextColor,
                ),
                decoration: InputDecoration(
                  hintText: answerHint,
                  hintStyle: const TextStyle(
                    color: AppColors.hinttextColor,
                    fontWeight: FontWeight.normal,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.borderColor),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.textColor),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 10.0),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
