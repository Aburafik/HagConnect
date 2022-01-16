import 'package:flutter/material.dart';
import 'package:hag_connect_app/utils/app_colors.dart';
import 'package:hag_connect_app/views/homeview/home_view.dart';
import 'package:hag_connect_app/views/splash_screen.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const HomeView(),
    theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffF8F9E7),
        appBarTheme: AppBarTheme(
          elevation: 0,
          titleTextStyle: TextStyle(color: whiteColor, fontSize: 20),
          backgroundColor: generalPrimaryColor,
        )),
  ));
}
