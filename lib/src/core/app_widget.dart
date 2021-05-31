import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:good_look_app/src/core/app_colors.dart';
import 'package:good_look_app/src/pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  void changeNavigationBarColor() {
    SystemUiOverlayStyle appUiStyle = SystemUiOverlayStyle.light.copyWith(
      statusBarColor: AppColors.primaryColor,
      systemNavigationBarColor: AppColors.primaryColor,
    );
    SystemChrome.setSystemUIOverlayStyle(appUiStyle);
  }

  @override
  Widget build(BuildContext context) {
    changeNavigationBarColor();
    return MaterialApp(
      title: 'Pretty Woman',
      debugShowCheckedModeBanner: true,
      home: HomePage(),
    );
  }
}
