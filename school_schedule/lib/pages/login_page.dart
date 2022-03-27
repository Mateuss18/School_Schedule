import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_schedule/core/app_colors.dart';

import '../core/app_texts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  get wght => null;

  @override
  Widget build(BuildContext context) {
    double widthValue = MediaQuery.of(context).size.width;
    double heigthValue = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: heigthValue * 0.55,
            width: widthValue,
            color: Colors.white,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              color: AppColors.corPrimaria,
            ),
            height: heigthValue * 0.45,
            width: widthValue,
            child: const Text(
              'Tenha controle das suas \ndisiplinas, notas, faltas e \n grade de horários na\n palma de sua mão',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}