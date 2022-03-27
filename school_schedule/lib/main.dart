import 'package:flutter/material.dart';
import 'package:school_schedule/core/app_colors.dart';
import 'package:school_schedule/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School Schedule',
      home: const LoginPage(),
    );
  }
}
