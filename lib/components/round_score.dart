import 'package:flutter/material.dart';
import 'package:sec_me/manager/style_manager.dart';

class RoundScore extends StatelessWidget {
  const RoundScore({super.key, required this.progress})
      : score = progress * 10000;

  final double progress;
  final double score;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: SizedBox(
            height: 150,
            width: 150,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 10,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 20),
          child: Text(
            score.toInt().toString(),
            style: AppTextStyles.bodyText1,
          ),
        ),
      ],
    );
  }
}
