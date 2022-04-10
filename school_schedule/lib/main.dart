import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:school_schedule/modules/home/pages/home_page.dart';
import 'package:school_schedule/modules/login/pages/login_page.dart';
import 'package:school_schedule/modules/user/page/user_page.dart';
import 'modules/welcome_page/welcome_page.dart';

import 'package:flutter_svg/svg.dart';
import '../../../core/app_images.dart';
import 'package:school_schedule/core/app_colors.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

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
      // Set Poppins as the default app font.
      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: '/splash-screen',
      routes: Navigate.routes,
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          SvgPicture.asset(AppImages.capeloSVG),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: const Text(
              'School Schedule',
              style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 255, 255, 255))
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.corPrimaria,
      nextScreen: const HomePage(),
      splashIconSize: 30,
      duration: 2500,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}

class Navigate {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const WelcomePage(),
    '/splash-screen': (context) => const SplashScreen(),
    '/sign-in': (context) => const LoginPage(),
    '/home': (context) => const HomePage(),
    '/user-page': (context) => const UserPage(),
  };
}
