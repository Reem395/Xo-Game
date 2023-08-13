import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../styles/app_color.dart';

class RoundedButtton extends StatelessWidget {
  const RoundedButtton(
      {Key? key,
      required this.buttonTitle,
      required this.buttonFunction,
      this.buttonRaduis = 28,
      this.titleSize = 20,
      this.verticalPadding = 11.48,
      this.horizontalPadding = 115,
      this.titleColor = AppColor.blue})
      : super(key: key);

  final Function()? buttonFunction;
  final String buttonTitle;
  final double buttonRaduis;
  final double titleSize;
  final double verticalPadding;
  final double horizontalPadding;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonFunction,
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.orange,
          borderRadius: BorderRadius.circular(buttonRaduis),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.6.h, horizontal: 8.w),
          child: Text(
            buttonTitle,
            style: TextStyle(
                color: titleColor,
                fontWeight: FontWeight.bold,
                fontSize: titleSize),
          ),
        ),
      ),
    );
  }
}
