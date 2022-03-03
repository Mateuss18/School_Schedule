import 'package:flutter/material.dart';
import 'package:school_schedule/pages/home_page.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: const HomePage(),
      title: const Text(
        'School Schudle',
        style: TextStyle(
          fontSize: 23,
        ),
      ),
      image: Image.asset('assets/images'),
    );
  }
}
