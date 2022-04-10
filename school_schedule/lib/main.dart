import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:school_schedule/modules/home/pages/home_page.dart';
import 'package:school_schedule/modules/login/pages/login_page.dart';
import 'package:school_schedule/modules/user/page/user_page.dart';
import 'modules/welcome_page/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School Schedule',
      initialRoute: '/home',
      routes: Navigate.routes,
    );
  }
}

class Navigate {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const WelcomePage(),
    '/sign-in': (context) => const LoginPage(),
    '/home': (context) => const HomePage(),
    '/user-page': (context) => const UserPage(),
  };
}
