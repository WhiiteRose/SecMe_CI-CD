import 'dart:io';
import 'dart:typed_data';

import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sec_me/components/large_container.dart';
import 'package:sec_me/components/medium_container.dart';
import 'package:sec_me/components/round_score.dart';
import 'package:sec_me/components/small_container.dart';
import 'package:sec_me/manager/style_manager.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void feedback() {
      BetterFeedback.of(context).show((feedback) async {
        final screenshotFilePath =
            await writeImageToStorage(feedback.screenshot);

        final Email email = Email(
          body: feedback.text,
          subject: 'App feedback',
          recipients: ['geoffroy.luc18@gmail.com'],
          attachmentPaths: [screenshotFilePath],
          isHTML: false,
        );
        await FlutterEmailSender.send(email);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcome Geoffroy,',
          style: AppTextStyles.headline1,
        ),
        backgroundColor: AppColors.primaryColorShade,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.bug_report,
              size: 28,
              color: Colors.white,
            ),
            onPressed: feedback,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(
                Icons.account_circle,
                size: 36,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const RoundScore(
              progress: 0.7,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: SmallContainer(
                    titletext: "tomroger2108@icloud.com",
                    bodytext: "Found 2 times",
                    icon: Icon(
                      Icons.warning_rounded,
                      color: AppColors.errorColor,
                    ),
                  ),
                ),
                Flexible(
                  child: SmallContainer(
                    titletext: "password1234",
                    bodytext: "Found 24 times",
                    icon: Icon(
                      Icons.warning_rounded,
                      color: AppColors.errorColor,
                    ),
                  ),
                ),
              ],
            ),
            const LargeContainer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return const MediumContainer();
              }),
            ),
            ElevatedButton(
              onPressed: () => GoRouter.of(context).go('/login'),
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () => GoRouter.of(context).go('/feedback'),
              child: const Text('Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<String> writeImageToStorage(Uint8List feedbackScreenShot) async {
  final Directory output = await getTemporaryDirectory();
  final String screenshotFilePath = '${output.path}/feedback.png';
  final File screenshotFile = File(screenshotFilePath);
  await screenshotFile.writeAsBytes(feedbackScreenShot);
  return screenshotFilePath;
}
