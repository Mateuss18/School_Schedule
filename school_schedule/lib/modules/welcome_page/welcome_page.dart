import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_schedule/core/app_colors.dart';
import 'package:school_schedule/core/app_images.dart';

import '../../core/constants.dart';
import '../login/firebase_service.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double heigth = MediaQuery.of(context).size.height;
    User? result = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              AppImages.darkModeSVG,
            ),
            const Text(
              'Menu',
              style: TextStyle(color: Colors.black),
            ),
            SvgPicture.asset(AppImages.configuracoesSVG)
          ],
        ),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: Constants.statusBarColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: heigth * 0.01),
              Text(
                "Login",
                style: TextStyle(color: AppColors.corDarkGray1),
              ),
              SizedBox(height: heigth * 0.1),
              SizedBox(
                width: width * 0.8,
                child: OutlinedButton(
                  onPressed: () {
                    result == null
                        ? Navigator.pushNamed(context, Constants.signInNavigate)
                        : Navigator.pushReplacementNamed(
                            context, Constants.homeNavigate);
                  },
                  child: Text("Start"),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          AppColors.corPrimaria),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.corDarkGray1),
                      side: MaterialStateProperty.all<BorderSide>(
                          BorderSide.none)),
                ),
              ),
              SizedBox(
                width: width * 0.8,
                child: OutlinedButton(
                  onPressed: () async {
                    FirebaseService service = FirebaseService();
                    try {
                      await service.signOutFromGoogle();
                    } catch (e) {
                      if (e is FirebaseAuthException) {
                        print(e.message);
                      }
                    }
                  },
                  child: Text("Logout"),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                          AppColors.corPrimaria),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.corDarkGray1),
                      side: MaterialStateProperty.all<BorderSide>(
                          BorderSide.none)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
