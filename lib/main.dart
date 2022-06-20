import 'package:flutter/material.dart';
import 'package:tiktok_yt/constants.dart';
import 'package:tiktok_yt/view/screens/auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikShock',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor
      ),
      home: LoginScreen(),
    );
  }
}

