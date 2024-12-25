import 'package:flutter/material.dart';
import 'package:sec_me/manager/style_manager.dart';

class LargeContainer extends StatelessWidget {
  const LargeContainer(
      {super.key,
      this.bodytext = "Lorem ispsum dolor eit",
      this.titletext = "Lorem Ipsum"});

  final String bodytext;
  final String titletext;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titletext,
              style: const TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                  bodytext,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
            const Text(
              "View Details",
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 93, 93, 93)),
            ),
          ],
        ),
      ),
    );
  }
}
