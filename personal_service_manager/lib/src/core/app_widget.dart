import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../src/core/app_colors.dart';
import '../../src/pages/home/home_page.dart';

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
