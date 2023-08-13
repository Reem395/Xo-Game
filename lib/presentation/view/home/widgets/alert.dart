import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:xo_game/presentation/styles/app_color.dart';

import '../home_screen.dart';

class Alert extends StatelessWidget {
  const Alert({
    Key? key,
    required this.title,
    required this.content,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final String content;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.offWhite.withOpacity(0.5),
      title: Text(
        title,
        style: const TextStyle(color: AppColor.blue),
      ),
      content: Text(
        content,
        style: const TextStyle(
            color: AppColor.tomato, fontWeight: FontWeight.bold),
      ),
      actions: [
        TextButton(
            onPressed: () {
              // print("OOOOOOOOOO");
              Navigator.pop(context);
              onPressed();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const HomeScreen()));
            },
            child: Text(
              "OK",
              style: TextStyle(fontSize: 12.sp, color: AppColor.tomato),
            ))
      ],
    );
  }
}
