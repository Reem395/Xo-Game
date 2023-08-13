import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:xo_game/presentation/styles/app_color.dart';
import 'package:xo_game/presentation/view/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: AppColor.createMaterialColor(AppColor.orange),
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
