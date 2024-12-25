import 'package:flutter/material.dart';
import 'package:sec_me/manager/style_manager.dart';

class SmallContainer extends StatelessWidget {
  const SmallContainer({
    super.key,
    this.titletext = "Lorem ipsum",
    this.bodytext = "Lorem ipsum dolor sit amet",
    this.icon = const Icon(Icons.warning_rounded),
  });

  final String bodytext;
  final String titletext;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      height: 95,
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
                  bodytext,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                icon,
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
