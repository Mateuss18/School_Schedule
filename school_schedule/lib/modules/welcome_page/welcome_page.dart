import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:school_schedule/core/app_colors.dart';
import 'package:school_schedule/core/app_images.dart';

import '../../core/constants.dart';

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
              Image.asset("assets/images/main-img.png"),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: Constants.textIntro,
                        style: TextStyle(
                          color: AppColors.corDarkGray1,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        )),
                    TextSpan(
                        text: Constants.textIntroDesc1,
                        style: TextStyle(
                            color: AppColors.corRed,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0)),
                    TextSpan(
                        text: Constants.textIntroDesc2,
                        style: TextStyle(
                            color: AppColors.corDarkGray1,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0)),
                  ])),
              SizedBox(height: heigth * 0.01),
              Text(
                "Constants.textSmallSignUp",
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
                  child: Text("Constants.textStart"),
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
                  onPressed: () {},
                  child: Text(
                    "Constants.textSignIn",
                    style: TextStyle(color: AppColors.corDarkGray1),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.corLightGray1),
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
