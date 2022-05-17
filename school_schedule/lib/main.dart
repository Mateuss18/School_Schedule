import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import '../../../core/app_images.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'core/app_colors.dart';
import 'modules/home/pages/home_page.dart';
import 'modules/login/pages/login_page.dart';
import 'modules/user/page/user_page.dart';

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

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SvgPicture.asset(AppImages.logoSplash),
      backgroundColor: AppColors.corPrimaria,
      nextScreen: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Temos um erro'),
            );
          } else if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginPage();
          }
        },
      ),
      splashIconSize: 200,
      duration: 5000,
      splashTransition: SplashTransition.slideTransition,
      animationDuration: const Duration(seconds: 1),
      pageTransitionType: PageTransitionType.rightToLeft,
    );
  }
}

class Navigate {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const HomePage(),
    '/splash-screen': (context) => const SplashScreen(),
    '/sign-in': (context) => const LoginPage(),
    '/home': (context) => const HomePage(),
    '/user-page': (context) => const UserPage(),
  };
}
