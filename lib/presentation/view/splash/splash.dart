import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:xo_game/presentation/styles/app_color.dart';
import 'package:xo_game/presentation/view/widgets/rounded_button.dart';

import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isColumnVisible = false;
  bool _isButtonVisible = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isColumnVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.honeydew,
      body: Center(
        child: AnimatedOpacity(
          opacity: _isColumnVisible ? 1.0 : 0.0,
          curve: Curves.easeInOut,
          duration: const Duration(seconds: 3),
          onEnd: () {
            setState(() {
              _isButtonVisible = true;
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "XO Game",
                style: TextStyle(
                    fontFamily: "BlackOpsOne",
                    fontSize: 35.sp,
                    color: AppColor.moonStone),
              ),
              Image.asset(
                "assets/images/game_logo.png",
                width: 44.w,
                height: 30.h,
              ),
              SizedBox(
                height: 2.h,
              ),
              Visibility(
                  visible: _isButtonVisible,
                  child: RoundedButtton(
                      buttonTitle: "Start",
                      buttonRaduis: 8,
                      titleColor: AppColor.vanilla,
                      titleSize: 12.sp,
                      buttonFunction: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const HomeScreen(),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
